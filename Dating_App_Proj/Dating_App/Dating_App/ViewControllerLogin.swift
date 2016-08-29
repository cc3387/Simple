//
//  ViewControllerLogin.swift
//  Dating_App
//
//  Created by Clement Chan on 7/11/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import UIKit
import Firebase
import Batch

var indication = 0;

class ViewControllerLogin: UIViewController{
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var user: String = "";
    var decision_user: Int = 0
    var decision_pwd: Int = 0
    var user1:User!
    var count: Int = 0;
    var phoneloginfinal = "";
    var userName = String()
    var pssword = String()
    var autologin = [
        "username": "",
        "password": "",
        "phoneid" : ""
    ];

    
    override func viewDidLoad() {
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    super.viewDidLoad()
    
    if(indication == 1){
    userName = NSUserDefaults.standardUserDefaults().stringForKey("keepUsername")!
    pssword = NSUserDefaults.standardUserDefaults().stringForKey("keepPassword")!
    self.Username.text = userName;
    self.Password.text = "";
    login.password = pssword;
    }
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    
    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func Login(sender: AnyObject) {
        
//        var ref = Firebase(url:"https://simpleplus.firebaseio.com")
//        var ref = FIRDatabase.database().reference()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        login.loginid = self.Username.text!;
        
//        if(self.Password.text != "**********"){
        login.password = self.Password.text!;
//        }
            
        FIRAuth.auth()?.signInWithEmail(self.Username.text!, password: self.Password.text!) {
            (user, error) in
            if error != nil {
                // an error occured while attempting login
                print("Login info is wrong");
            } else {
                // user is logged in, check authData for data
                login.loginid = self.Username.text!;
                loginid = self.Username.text!;
                login.chatid = (FIRAuth.auth()!.currentUser!.uid)
                //login.password = self.Password.text!;
                //self.Password.text = "**********";
                //login.chatid = ref.authData.uid
                
                
                if(BatchPush.lastKnownPushToken() != nil){
                self.autologin = [
                    "username": self.Username.text!,
                    "password": self.Password.text!,
                    "phoneid" : BatchPush.lastKnownPushToken()
                ];
                    
                }
                else{
                    self.autologin = [
                        "username": self.Username.text!,
                        "password": self.Password.text!,
                        "phoneid" : "xxxxxxxxxxxxxxxx"
                    ];
                }
                
                if(BatchPush.lastKnownPushToken() != nil){
                    self.phoneloginfinal = (BatchPush.lastKnownPushToken() as String) + "login"
                }
                else{
                    self.phoneloginfinal = "nologin";
                }
                
                
                var refauto = FIRDatabase.database().reference().child("autologin")
                var ref = FIRDatabase.database().reference().child("users").child(login.chatid)
                
                if(BatchPush.lastKnownPushToken() != nil){
                    ref.child("phoneid").setValue(BatchPush.lastKnownPushToken());
                }
                else{
                    ref.child("phoneid").setValue("xxxxxxxxxxxxxxxxxxxxx");
                }
                
            refauto.childByAppendingPath(self.phoneloginfinal).setValue(self.autologin);
                
                
                var friend = "friends/" + login.chatid  + "_fd"
                let friendlist = FIRDatabase.database().reference().child(friend)
                friendlist.queryOrderedByChild("uid").observeEventType(.Value, withBlock:{friendsnapshot in
                    for index in friendsnapshot.children.allObjects as! [FIRDataSnapshot]{
                        
                        let uid = index.value!["uid"] as! String!
                        let id = uid + "_fd"
                        
                        var friendlst = FIRDatabase.database().reference().child("friends").child(id).child(login.chatid).child("phoneid")
                        
                        
                        if(BatchPush.lastKnownPushToken() != nil){
                            friendlst.setValue(BatchPush.lastKnownPushToken())
                        }
                        else{
                            friendlst.setValue("xxxxxxxxxxxxxxx");
                        }
                        
                    }
                })
                
                NSUserDefaults.standardUserDefaults().setObject(login.loginid, forKey: "keepUsername")
                NSUserDefaults.standardUserDefaults().setObject(login.password, forKey: "keepPassword")
                NSUserDefaults.standardUserDefaults().synchronize()
                indication = 1;
                frienduser.emailarray.removeAll();
                frienduser.useridarray.removeAll();
                frienduser.phoneidarray.removeAll();
                frienduser.profilenamearray.removeAll();
                self.loadDestinationVC();
            };
        }
        
        //Login with our own register
        /*let manager = AFHTTPRequestOperationManager()
        
        var params = [
            
            "username":Username.text,
            "password":Password.text
            
        ]
        
        manager.POST("http://localhost:3000/login1",
            parameters: params,
            
            //what is needed for success to execute?
            success: { (AFHTTPRequestOperation, userObject) -> Void in
                println(userObject)
                if let results = userObject as? NSDictionary {
                    if let user_details = results["user"] as? NSDictionary {
                        if let username = user_details["username"] as? String {
                            self.user1 = User(username: username, token: "helloworld")
                            let defaults = NSUserDefaults.standardUserDefaults()
                            defaults.setObject(self.user1.token, forKey: "token")
                            defaults.synchronize()
                            self.performSegueWithIdentifier("openProfile", sender: self)
                            
                        }
                        
                    }
                }
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                println("fail in sending")
        }*/
    }
    
    //Load destination to the main profile
    func loadDestinationVC(){
    self.performSegueWithIdentifier("LoadProfile", sender: nil)
    }

    
    /*func finduserid(){
        var query = PFQuery(className: "UserDetails");
        query.includeKey(self.Username.text);
        query.whereKey("username", equalTo: self.Username.text);
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if objects!.count == 0 {
                self.decision_user = 0;
            }
            else {
                self.decision_user = 1;
                // The find succeeded.
                //println("Successfully retrieved \(objects!.count) record.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        //println("Username_ID is: ");
                        println(object.objectId);
                    }
                }
            }
        }
    }*/
    
    /*func move(){
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        counter++;
        if segue.identifier == "Main_Profile" {
            if let destinationVC = segue.destinationViewController as? Main_Profile{
                destinationVC.loginuser = counter
            }
          }
        }
    }*/
    
    
    //This part retrieve the Username saved that were passed on after clicking the "Login" button
    /*func RetrieveUsername(){
        let usertext = Username.text;
        //Creating a new PFQuery
        var query = PFQuery(className: "User")
        query.whereKey("username", equalTo: usertext)
        //Call FindObjectsinBackground
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if objects!.count == 0 {
                self.decision_user = 0;
            }
            else {
                self.decision_user = 1;
                // The find succeeded.
                //println("Successfully retrieved \(objects!.count) record.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        //println("Username_ID is: ");
                        println(object.objectId)
                    }
                }
            }
        }
    }*/
    

    //This part retrieve the Password saved that were passed on after clicking the "Login" button
    /*func RetrievePassword(){
        
        let passwordtext = Password.text;
        //Creating a new PFQuery
        var query = PFQuery(className: "User")
        query.whereKey("password", equalTo: passwordtext)
        //Call FindObjectsinBackground
        query.findObjectsInBackgroundWithBlock{
            (objects:[AnyObject]?, error: NSError?) -> Void in
            
            if objects!.count == 0{
            self.decision_pwd = 0;
            }
            else {
                self.decision_pwd = 1;
                // The find succeeded.
                //println("Successfully retrieved \(objects!.count) record.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        //println("Password ID is: ")
                        println(object.objectId)
                  }
               }
            }
        }
    }*/
    
    
    //if login fails how do I redirect back?
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "openProfile") {
            //self.user = User(username: "hsuregan5")
            let newViewController = segue.destinationViewController as! Profile_Main
            //println("YAY::")
            println(self.user1.username)
            newViewController.user1 = self.user
            
        }
    }*/
    
}
