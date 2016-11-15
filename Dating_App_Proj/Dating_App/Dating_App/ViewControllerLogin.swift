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
    userName = UserDefaults.standard.string(forKey: "keepUsername")!
    pssword = UserDefaults.standard.string(forKey: "keepPassword")!
    self.Username.text = userName;
    self.Password.text = "";
    login.password = pssword;
    }
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewControllerLogin.dismissKeyboard))
        view.addGestureRecognizer(tap)
    
    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func Login(_ sender: AnyObject) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        login.loginid = self.Username.text!;
        
//        if(self.Password.text != "**********"){
        login.password = self.Password.text!;
//        }
            
        FIRAuth.auth()?.signIn(withEmail: self.Username.text!, password: self.Password.text!) {
            (user, error) in
            if error != nil {
                // an error occured while attempting login
                print("Login info is wrong");
            } else {
                // user is logged in, check authData for data
                login.loginid = self.Username.text!;
                loginid = self.Username.text!;
                login.chatid = (FIRAuth.auth()!.currentUser!.uid)

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
                
            refauto.child(byAppendingPath: self.phoneloginfinal).setValue(self.autologin);
                
                
                var friend = "friends/" + login.chatid  + "_fd"
                let friendlist = FIRDatabase.database().reference().child(friend)
                friendlist.queryOrdered(byChild: "uid").observe(.value, with:{friendsnapshot in
                    for index in friendsnapshot.children.allObjects as! [FIRDataSnapshot]{
                        
                        if let source = index.value as? [String:AnyObject] {
                        let uid = source["uid"] as! String!
                        let id = uid! + "_fd"
                        
                        var friendlst = FIRDatabase.database().reference().child("friends").child(id).child(login.chatid).child("phoneid")
                        
                        
                        if(BatchPush.lastKnownPushToken() != nil){
                            friendlst.setValue(BatchPush.lastKnownPushToken())
                        }
                        else{
                            friendlst.setValue("xxxxxxxxxxxxxxx");
                        }
                        }
                    }
                })
                
                UserDefaults.standard.set(login.loginid, forKey: "keepUsername")
                UserDefaults.standard.set(login.password, forKey: "keepPassword")
                UserDefaults.standard.synchronize()
                indication = 1;
                frienduser.emailarray.removeAll();
                frienduser.useridarray.removeAll();
                frienduser.phoneidarray.removeAll();
                frienduser.profilenamearray.removeAll();
                self.loadDestinationVC();
            };
        }
    }
    
    //Load destination to the main profile
    func loadDestinationVC(){
    self.performSegue(withIdentifier: "LoadProfile", sender: nil)
    }
}
