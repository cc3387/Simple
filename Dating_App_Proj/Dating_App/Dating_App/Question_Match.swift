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
    @IBOutlet weak var q2user: UILabel!
    @IBOutlet weak var q2friend: UILabel!
    @IBOutlet weak var q3user: UILabel!
    @IBOutlet weak var q3friend: UILabel!
    @IBOutlet weak var q4user: UILabel!
    @IBOutlet weak var q4friend: UILabel!
    @IBOutlet weak var q5user: UILabel!
    @IBOutlet weak var q5friend: UILabel!
    @IBOutlet weak var q6user: UILabel!
    @IBOutlet weak var q6friend: UILabel!
    @IBOutlet weak var q7user: UILabel!
    @IBOutlet weak var q7friend: UILabel!
    @IBOutlet weak var q8user: UILabel!
    @IBOutlet weak var q8friend: UILabel!
    @IBOutlet weak var q9user: UILabel!
    @IBOutlet weak var q9friend: UILabel!
    @IBOutlet weak var Matchone: UILabel!
    @IBOutlet weak var Matchtwo: UILabel!
    @IBOutlet weak var Matchthree: UILabel!
    @IBOutlet weak var Matchfour: UILabel!
    @IBOutlet weak var Matchfive: UILabel!
    @IBOutlet weak var Matchsix: UILabel!
    @IBOutlet weak var Matchseven: UILabel!
    @IBOutlet weak var Matcheight: UILabel!
    @IBOutlet weak var Matchnine: UILabel!
    @IBOutlet weak var User: UILabel!
    @IBOutlet weak var Friend: UILabel!
    @IBOutlet weak var Answercorrect: UILabel!
    @IBOutlet weak var Turnonnotification: UILabel!
//    let ref = Firebase(url:"https://simpleplus.firebaseio.com/pref/" + login_user.uid)
//    let reffd = Firebase(url:"https://simpleplus.firebaseio.com/pref/" + convo_final.friend_id_final)
    
    var ref = FIRDatabase.database().reference().child("pref").child(login_user.uid)
    var reffd = FIRDatabase.database().reference().child("pref").child(convo_final.friend_id_final)
    
    var count = 0;

    @IBAction func Yes(_ sender: AnyObject) {
    
//        let loginid = "https://simpleplus.firebaseio.com/friends/" + convo_final.friend_id_final + "_fd/" + login_user.uid;
        
        let loginid = convo_final.friend_id_final + "_fd";
        let rref = FIRDatabase.database().reference().child("friends").child(loginid).child(login_user.uid)
        let param = ["Notification": 1]
    
        rref.updateChildValues(param);
        loadDestinationVC()
    }
    
    @IBAction func No(_ sender: AnyObject) {
//        let loginid = "https://simpleplus.firebaseio.com/friends/" + convo_final.friend_id_final + "_fd/" + login_user.uid;
        
        let loginid = convo_final.friend_id_final + "_fd";
                let rref = FIRDatabase.database().reference().child("friends").child(loginid).child(login_user.uid)
        let param = ["Notification": 0]
        
        rref.updateChildValues(param);
        loadDestinationVC()
    }
    
    
    
    override func viewDidLoad() {
        self.count = 0
        self.User.text = login_user.Profile_Name
        self.Friend.text = convo_final.friend_Profile_final
        
        self.ref.observe(.value, with: { snapshot in
            if(snapshot.exists() == false){
            self.q1user.text = "";
            self.q2user.text = "";
            self.q3user.text = "";
            self.q4user.text = "";
            self.q5user.text = "";
            self.q6user.text = "";
            self.q7user.text = "";
            self.q8user.text = "";
            self.q9user.text = "";
            }
            else{
            
            if let source = snapshot.value as? [String:AnyObject] {
            self.q1user.text = source["q1"] as? String
            self.q2user.text = source["q2"] as? String
            self.q3user.text = source["q3"] as? String
            self.q4user.text = source["q4"] as? String
            self.q5user.text = source["q5"] as? String
            self.q6user.text = source["q6"] as? String
            self.q7user.text = source["q7"] as? String
            self.q8user.text = source["q8"] as? String
            self.q9user.text = source["q9"] as? String
            }
            }
            
            self.reffd.observe(.value, with: { snapshot in
                if(snapshot.exists() == false){
                    self.q1friend.text = "";
                    self.q2friend.text = "";
                    self.q3friend.text = "";
                    self.q4friend.text = "";
                    self.q5friend.text = "";
                    self.q6friend.text = "";
                    self.q7friend.text = "";
                    self.q8friend.text = "";
                    self.q9friend.text = "";
                }
                else{
                    if let source = snapshot.value as? [String:AnyObject] {
                    self.q1friend.text = source["q1"] as? String
                    self.q2friend.text = source["q2"] as? String
                    self.q3friend.text = source["q3"] as? String
                    self.q4friend.text = source["q4"] as? String
                    self.q5friend.text = source["q5"] as? String
                    self.q6friend.text = source["q6"] as? String
                    self.q7friend.text = source["q7"] as? String
                    self.q8friend.text = source["q8"] as? String
                    self.q9friend.text = source["q9"] as? String
                    }
                }
                
                
                //Question 1
                if(self.q1user.text == self.q1friend.text){
                    self.Matchone.text = "Match"
                    self.Matchone.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q1user.text != self.q1friend.text){
                    self.Matchone.text = "Not Match"
                    self.Matchone.textColor = UIColor.red
                }
                
                //Question 2
                if(self.q2user.text == self.q2friend.text){
                    self.Matchtwo.text = "Match"
                    self.Matchtwo.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q2user.text != self.q2friend.text){
                    self.Matchtwo.text = "Not Match"
                    self.Matchtwo.textColor = UIColor.red
                }
                
                //Question 3
                if(self.q3user.text == self.q3friend.text){
                    self.Matchthree.text = "Match"
                    self.Matchthree.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q3user.text != self.q3friend.text){
                    self.Matchthree.text = "Not Match"
                    self.Matchthree.textColor = UIColor.red
                }
                
                //Question 4
                if(self.q4user.text == self.q4friend.text){
                    self.Matchfour.text = "Match"
                    self.Matchfour.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q4user.text != self.q4friend.text){
                    self.Matchfour.text = "Not Match"
                    self.Matchfour.textColor = UIColor.red
                }
                
                //Question 5
                if(self.q5user.text == self.q5friend.text){
                    self.Matchfive.text = "Match"
                    self.Matchfive.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q5user.text != self.q5friend.text){
                    self.Matchfive.text = "Not Match"
                    self.Matchfive.textColor = UIColor.red
                }
                
                //Question 6
                if(self.q6user.text == self.q6friend.text){
                    self.Matchsix.text = "Match"
                    self.Matchsix.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q6user.text != self.q6friend.text){
                    self.Matchsix.text = "Not Match"
                    self.Matchsix.textColor = UIColor.red
                }
                
                //Question 7
                if(self.q7user.text == self.q7friend.text){
                    self.Matchseven.text = "Match"
                    self.Matchseven.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q7user.text != self.q7friend.text){
                    self.Matchseven.text = "Not Match"
                    self.Matchseven.textColor = UIColor.red
                }
                
                //Question 8
                if(self.q8user.text == self.q8friend.text){
                    self.Matcheight.text = "Match"
                    self.Matcheight.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q8user.text != self.q8friend.text){
                    self.Matcheight.text = "Not Match"
                    self.Matcheight.textColor = UIColor.red
                }
                
                //Question 9
                if(self.q9user.text == self.q9friend.text){
                    self.Matchnine.text = "Match"
                    self.Matchnine.textColor = UIColor.green
                    self.count += 1;
                }
                else if(self.q9user.text != self.q9friend.text){
                    self.Matchnine.text = "Not Match"
                    self.Matchnine.textColor = UIColor.red
                }
                
                self.Answercorrect.text = "Number of questions matched : \(self.count) "
                self.Answercorrect.adjustsFontSizeToFitWidth = true
            })
            
            
        })
            
        self.Turnonnotification.text = "Turn on notification from this friend?"
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Back_To_Menu", sender: nil)
    }
    
};
