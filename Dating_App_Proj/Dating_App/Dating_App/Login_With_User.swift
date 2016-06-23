//
//  Login_With_User.swift
//  Simple
//
//  Created by Clement Chan on 6/20/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Login_With_User: UIViewController{
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var user: String = "";
    var decision_user: Int = 0
    var decision_pwd: Int = 0
    var user1:User!
    var count: Int = 0;
    var ref: Firebase!
    
    @IBOutlet var login_email: UILabel!
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.login_email.text = loginid
    }
    
    @IBAction func Login(sender: AnyObject) {
        var ref = Firebase(url:"https://simpleplus.firebaseio.com")
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        ref.authUser(loginid, password: self.Password.text) {
            error, authData in
            if error != nil {
                // an error occured while attempting login
                print("Login info is wrong");
            } else {
                // user is logged in, check authData for data
                login.password = self.Password.text!;
                self.Password.text = "**********";
                login.chatid = ref.authData.uid
                self.loadDestinationVC();
            };
        }
    }
    
    @IBAction func New_User(sender: AnyObject) {
        loginid = "";
        loadDestinationVC1()
    }
    
    //Load destination to the main profile
    func loadDestinationVC(){
    self.performSegueWithIdentifier("Login_With_User", sender: nil)
    }
    
    func loadDestinationVC1(){
        self.performSegueWithIdentifier("New_User", sender: nil)
    }
    
}