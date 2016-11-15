//
//  Login_With_User.swift
//  Simple
//
//  Created by Clement Chan on 6/20/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase
import Batch

var global_observe:Int = 0;

class Login_With_User: UIViewController{
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var user: String = "";
    var decision_user: Int = 0
    var decision_pwd: Int = 0
    var user1:User!
    var count: Int = 0;
    
    @IBOutlet var login_email: UILabel!
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.login_email.text = loginid
        super.viewDidLoad()
        UserDefaults.standard.set(login.loginid, forKey: "keepUsername")
        UserDefaults.standard.set(login.password, forKey: "keepPassword")
        frienduser.emailarray.removeAll();
        frienduser.useridarray.removeAll();
    }
    
    @IBAction func Login(_ sender: AnyObject) {

    }
    
    @IBAction func New_User(_ sender: AnyObject) {

    }
    
    //Load destination to the main profile
    func loadDestinationVC(){
    self.performSegue(withIdentifier: "Login_With_User", sender: nil)
    }
    
    func loadDestinationVC1(){
        self.performSegue(withIdentifier: "New_User", sender: nil)
    }
    
}
