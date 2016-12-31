//
//  Chat_Detail.swift
//  Simple
//
//  Created by Clement Chan on 6/2/16.
//  Copyright (c) 2016 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import JSQMessagesViewController
import Batch


class ChatDetail: JSQMessagesViewController{
    
//    var messageRef: Firebase!
    var rootRef = FIRDatabase.database().reference()
    var messages = [JSQMessage]()
    var check = 0
    var noticeonce = 0;
    
    //Setting up the bubbles
    var outgoingBubbleImageView: JSQMessagesBubbleImage!
    var incomingBubbleImageView: JSQMessagesBubbleImage!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.senderDisplayName = ""
        self.senderId = login_user.uid
        title = "Chat - " + convo_final.friend_Profile_final 
        setupBubbles()
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        self.inputToolbar!.contentView!.leftBarButtonItem = nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!,
        messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
            return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!,
        messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
            let message = messages[indexPath.item] // 1
            if message.senderId == senderId { // 2
                return outgoingBubbleImageView
            } else { // 3
                return incomingBubbleImageView
            }
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!,
        avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
            return nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        observeMessages()
    }
  
    //Sending the message to server
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!,
        senderDisplayName: String!, date: Date!) {
        
        let messageRef = FIRDatabase.database().reference().child("messages")
        var finalidmsg = "";
        
            //Define the server hosting name
            if(convo_final.chat_check_final == 1){
            finalidmsg = login_user.uid + convo_final.friend_id_final + "msg";
            }
            else if (convo_final.chat_check_final == 2){
            finalidmsg = convo_final.friend_id_final + login_user.uid + "msg";
            }
        
            var Timestamp = "\(Date().timeIntervalSince1970*1000)"
        
            let itemRef = messageRef.child(finalidmsg).childByAutoId()
            
            let messageItem = [
                "Timestamp": Timestamp,
                "text": text,
                "senderId": self.senderId
            ]
            
            itemRef.setValue(messageItem)
            
            // 4
            JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
            //5 Sending notification to your friend's phone
            let devDeviceToken = convo_final.friend_phoneid_final
            print(devDeviceToken)
            if let pushClient = BatchClientPush(apiKey: "582972DC5260C0EF339765F650941A", restKey: "a524aa85f96b3bc103188428b026bd5b") {
            
            pushClient.sandbox = false
            pushClient.customPayload = ["aps": ["badge": 1] as AnyObject]
            pushClient.groupId = "tests"
            pushClient.message.title = "Simple"
            pushClient.message.body = login_user.Profile_Name + " sent you a message!"
            pushClient.recipients.customIds = ["c657587b-969c-483e-89cb-7c5105af4c55"]
            pushClient.recipients.tokens.append(devDeviceToken)
            
            if(convo_final.notification == 1){
            pushClient.send { (response, error) in
                if let error = error {
                    print("Something happened while sending the push: \(response) \(error.localizedDescription)")
                } else {
                    print("Push sent \(response)")
                }
            }
            }
                
        } else {
            print("Error while initializing BatchClientPush")
        }
        
            // 6
            finishSendingMessage()
    }
    
    override func collectionView(_ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = super.collectionView(collectionView, cellForItemAt: indexPath)
                as! JSQMessagesCollectionViewCell
            
            let message = messages[(indexPath as NSIndexPath).item]
            
            if message.senderId == senderId {
                cell.textView!.textColor = UIColor.white
            } else {
                cell.textView!.textColor = UIColor.black
            }
            
            return cell
    }
    
    //To Set up chat bubbles for the chat app process
    fileprivate func setupBubbles() {
        let factory = JSQMessagesBubbleImageFactory()
        outgoingBubbleImageView = factory?.outgoingMessagesBubbleImage(
            with: UIColor.jsq_messageBubbleBlue())
        incomingBubbleImageView = factory?.incomingMessagesBubbleImage(
            with: UIColor.jsq_messageBubbleLightGray())
    }
    
    //Function to observe the information
    fileprivate func observeMessages() {
        
        let messageRef = FIRDatabase.database().reference().child("messages")
        var finalidmsg = "";
        
        
        if(convo_final.chat_check_final == 1){
        finalidmsg = login_user.uid + convo_final.friend_id_final + "msg"
        }
        else if (convo_final.chat_check_final == 2){
        finalidmsg = convo_final.friend_id_final + login_user.uid + "msg"
        }

        //Define the messageQuery
        let messagesQuery = messageRef.child(finalidmsg).queryLimited(toLast: 25)
        self.messages = [];
        
        //Loading the message query
        messagesQuery.observe(.childAdded, with:{ snapshot in
            if let source = snapshot.value as? [String:AnyObject] {
            let id = source["senderId"] as! String
            let text = source["text"] as! String
            self.addMessage(id, text: text)
            self.finishReceivingMessage()
            }
        })
        
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    //Function to add messages and send to the server
    func addMessage(_ id: String, text: String) {
        let message = JSQMessage(senderId: id, displayName: "", text: text)
        messages.append(message!)
    }
};



