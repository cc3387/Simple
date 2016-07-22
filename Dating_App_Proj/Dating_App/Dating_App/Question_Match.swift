//
//  Question_Match.swift
//  Simple
//
//  Created by Clement Chan on 7/21/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Question_Answer: UIViewController{
    
    @IBOutlet weak var q1user: UILabel!
    @IBOutlet weak var q1friend: UILabel!
    @IBOutlet weak var Matchone: UILabel!
    @IBOutlet weak var User: UILabel!
    @IBOutlet weak var Friend: UILabel!
    
    let ref = Firebase(url:"https://simpleplus.firebaseio.com/pref/" + login_user.uid)
    let reffd = Firebase(url:"https://simpleplus.firebaseio.com/pref/" + convo_final.friend_id_final)
    
    override func viewDidLoad() {
        
        self.User.text = login_user.Profile_Name
        self.Friend.text = convo_final.friend_Profile_final
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            if(snapshot.exists() == false){
            self.q1user.text = "";
            }
            else{
            self.q1user.text = snapshot.value["q1"] as? String
            }
        })
        
        reffd.observeEventType(.Value, withBlock: { snapshot in
            if(snapshot.exists() == false){
                self.q1friend.text = "";
            }
            else{
                self.q1friend.text = snapshot.value["q1"] as? String
            }
        })
        
        //Question 1
        if(self.q1user.text == self.q1friend.text){
            self.Matchone.text = "Match"
            self.Matchone.textColor = UIColor.greenColor()
        }
        else if(self.q1user.text != self.q1friend.text){
            self.Matchone.text = "Not Match"
            self.Matchone.textColor = UIColor.redColor()
        }

        
        
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
};