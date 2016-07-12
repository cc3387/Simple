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
            let manager = AFHTTPRequestOperationManager()
            manager.requestSerializer.setValue("a524aa85f96b3bc103188428b026bd5b", forHTTPHeaderField: "X-Authorization")
            manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")

            var param: [String:AnyObject] = [
                    "group_id": "welcome",
                    "recipients": [
                        "tokens": ["6163b0d91c3457c4616e37d1f4a11cc5cfac67aeb115e988059f058ccf5655cb","e88a682f5895cd0780eb3e252768991fbd39ed0bdfcc00ac24f9a9eba2924567"]
                    ],
                    "message": [
                        "title": "New Messages",
                        "body": "You got new messages!"
                    ],
                    "custom_payload": "{\"tag\":\"wake up push\", \"landing_screen\":\"greeting\"}",
                    "sandbox":true
            ]

            manager.POST( "https://api.batch.com/1.0/DEV577F39F560C20E0DCE06C1229D7/transactional/send",
            parameters: param,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
            print("Push Notification Successfully sent!")
            print("JSON:" + responseObject.description)
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
            print("Error:" + error.localizedDescription)
            })
        
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
    
    //Function to add messages and send to the server
    func addMessage(id: String, text: String) {
        let message = JSQMessage(senderId: id, displayName: "", text: text)
        messages.append(message)
    }
};



