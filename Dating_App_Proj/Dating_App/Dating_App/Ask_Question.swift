//
//  Ask_Question.swift
//  Simple
//
//  Created by Clement Chan on 7/7/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation

import UIKit
import Firebase

class Ask_Questions: UIViewController{
    
    
    let randomIndex = Int(arc4random_uniform(UInt32(Questions.count)))
    
    @IBOutlet weak var Welcome: UILabel!
    
    @IBOutlet weak var QuestionField: UITextField!
    
    @IBOutlet weak var MessageSent: UILabel!
    
    @IBAction func SendQuestion(sender: AnyObject) {
            
//            let starturl = "https://simpleplus.firebaseio.com/question/" + login_user.uid + convo_final.friend_id_final + "q"
//            
//            let rootRef = Firebase(url: starturl)
//            
//            let messageItem = [
//                "Question": Questions[randomIndex],
//                "Answer1": Answer1[randomIndex],
//                "Answer2": Answer2[randomIndex],
//                "Chatone": "",
//                "Chattwo": ""
//            ]
//        
//            rootRef.setValue(messageItem)
//            self.MessageSent.text = "Question Sent! "
//            self.MessageSent.textColor = UIColor.greenColor()
//            loadDestinationVC()
        
    }
    
    override func viewDidLoad() {
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.Welcome.text = "Ask "+convo_final.friend_Profile_final + " a question"
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("Back_To_Friend", sender: nil)
    }
    
}
