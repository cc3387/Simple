//
//  Answer_Question.swift
//  Simple
//
//  Created by Clement Chan on 7/20/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Answer: UIViewController{
    
    var Answer1: String = "";
    var Answer2: String = "";
    var Question: String = "";
    var chatid: String = "";
    
    let ref = Firebase(url:"https://simpleplus.firebaseio.com/question/" + login_user.uid + convo_final.friend_id_final + "q")
    
    override func viewDidLoad() {
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            self.Question = (snapshot.value["Question"] as? String)!
            self.Answer1 = (snapshot.value["Answer1"] as? String)!
            self.Answer2 = (snapshot.value["Answer2"] as? String)!
        })
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: ("Swipes:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: ("Swipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func Swipes(sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .Right){
            
            if(convo_final.chat_check_final == 1){
               self.chatid = "two"
            }
            else{
               self.chatid = "one"
            }
            
            let chat = "Chatid" + self.chatid as String
            let param = [chat: self.Answer1]
            
            ref.updateChildValues(param)
            
            loadDestinationVC()
            
        }
        else if(sender.direction == .Left){
            
            if(convo_final.chat_check_final == 1){
                self.chatid = "two"
            }
            else{
                self.chatid = "one"
            }
            
            let chat = "Chatid" + self.chatid as String
            let param = [chat: self.Answer2]
            
            ref.updateChildValues(param)
            
            loadDestinationVC()
        }
    }
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("BacktoProfile", sender: nil)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }








};