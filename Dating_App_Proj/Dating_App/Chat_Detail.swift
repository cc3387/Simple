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
    
    var messageRef: Firebase!
    var messages = [JSQMessage]()
    var check = 0
    var noticeonce = 0;
    
    //Setting up the bubbles
    var outgoingBubbleImageView: JSQMessagesBubbleImage!
    var incomingBubbleImageView: JSQMessagesBubbleImage!
    
    override func viewDidLoad(){
        super.viewDidLoad()
//        self.navigationController!.navigationBar.hidden = true
//        self.navigationController!.interactivePopGestureRecognizer!.enabled = false
        self.senderDisplayName = ""
        self.senderId = login_user.uid
        title = "Chat - " + convo_final.friend_Profile_final 
        setupBubbles()
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
        self.inputToolbar!.contentView!.leftBarButtonItem = nil
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
        messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
            return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
        messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
            let message = messages[indexPath.item] // 1
            if message.senderId == senderId { // 2
                return outgoingBubbleImageView
            } else { // 3
                return incomingBubbleImageView
            }
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
        avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
            return nil
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        observeMessages()
    }
  
    //Sending the message to server
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!,
        senderDisplayName: String!, date: NSDate!) {
            
            let rootRef = Firebase(url: "https://simpleplus.firebaseio.com/messages/")
            
            //Define the server hosting name
            if(convo_final.chat_check_final == 1){
            messageRef = rootRef.childByAppendingPath(login_user.uid + convo_final.friend_id_final + "msg")
            }
            else if (convo_final.chat_check_final == 2){
            messageRef = rootRef.childByAppendingPath(convo_final.friend_id_final + login_user.uid + "msg")
            }
        
            var Timestamp = "\(NSDate().timeIntervalSince1970*1000)"
        
            let itemRef = messageRef.childByAutoId()
            
            let messageItem = [
                "Timestamp": Timestamp,
                "text": text,
                "senderId": self.senderId
            ]
            
            itemRef.setValue(messageItem)
            
            // 4
            JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
            //5 Sending notification to your friend's phone
            let devDeviceToken = "e88a682f5895cd0780eb3e252768991fbd39ed0bdfcc00ac24f9a9eba2924567"
            if let pushClient = BatchClientPush(apiKey: "DEV577F39F560C20E0DCE06C1229D7", restKey: "a524aa85f96b3bc103188428b026bd5b") {
            
            pushClient.sandbox = true
            pushClient.customPayload = ["aps": ["badge": 7]]
            pushClient.groupId = "tests"
            pushClient.message.title = "iOS Push"
            pushClient.message.body = "Batch's working!"
            pushClient.recipients.customIds = ["foo"]
            pushClient.recipients.tokens.append(devDeviceToken)
            
            pushClient.send { (response, error) in
                if let error = error {
                    print("Something happened while sending the push: \(response) \(error.localizedDescription)")
                } else {
                    print("Push sent \(response)")
                }
            }
            
        } else {
            print("Error while initializing BatchClientPush")
        }
        
            // 6
            finishSendingMessage()
    }
    
    override func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath)
                as! JSQMessagesCollectionViewCell
            
            let message = messages[indexPath.item]
            
            if message.senderId == senderId {
                cell.textView!.textColor = UIColor.whiteColor()
            } else {
                cell.textView!.textColor = UIColor.blackColor()
            }
            
            return cell
    }
    
    //To Set up chat bubbles for the chat app process
    private func setupBubbles() {
        let factory = JSQMessagesBubbleImageFactory()
        outgoingBubbleImageView = factory.outgoingMessagesBubbleImageWithColor(
            UIColor.jsq_messageBubbleBlueColor())
        incomingBubbleImageView = factory.incomingMessagesBubbleImageWithColor(
            UIColor.jsq_messageBubbleLightGrayColor())
    }
    
    //Function to observe the information
    private func observeMessages() {
        
        let rootRef = Firebase(url: "https://simpleplus.firebaseio.com/messages/")
        if(convo_final.chat_check_final == 1){
            messageRef = rootRef.childByAppendingPath(login_user.uid + convo_final.friend_id_final + "msg")
        }
        else if (convo_final.chat_check_final == 2){
            messageRef = rootRef.childByAppendingPath(convo_final.friend_id_final + login_user.uid + "msg")
        }

        //Define the messageQuery
        let messagesQuery = messageRef.queryLimitedToLast(25)
        self.messages = [];
        
        //Loading the message query
        messagesQuery.observeEventType(.ChildAdded) { (snapshot: FDataSnapshot!) in
            let id = snapshot.value["senderId"] as! String
            let text = snapshot.value["text"] as! String
            self.addMessage(id, text: text)
            self.finishReceivingMessage()
            
//            if(Chat_notification == 1){
//                let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
//                UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
//                
//                //send notifications to the app
//                let notification = UILocalNotification()
//                notification.fireDate = NSDate(timeIntervalSinceNow: 5)
//                notification.alertBody = "New Message from " + convo_final.friend_id_final + " chatroom!"
//                notification.alertAction = "Read Message!"
//                notification.soundName = UILocalNotificationDefaultSoundName
//                notification.userInfo = ["CustomField1": "w00t"]
//                UIApplication.sharedApplication().scheduleLocalNotification(notification)
//                self.noticeonce += 1;
//            }
        }
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    //Function to add messages and send to the server
    func addMessage(id: String, text: String) {
        let message = JSQMessage(senderId: id, displayName: "", text: text)
        messages.append(message)
    }
};



