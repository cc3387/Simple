//
//  Start_Page.swift
//  Simple
//
//  Created by Clement Chan on 6/20/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase
var loginid: String = "";

class Start_Page : UIViewController{

    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func Login(sender: AnyObject) {
        
//        if(loginid == ""){
            loadDestinationVC()
//        }
//        else if(loginid != ""){
//            loadDestinationVC1()
//        }
    }


    func loadDestinationVC1(){
        self.performSegueWithIdentifier("Yes_Login", sender: nil)
    }
    
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("No_Login", sender: nil)
    }

};


struct login_user{
    static var user_name: String = "";
    static var Profile_Name: String = "";
    static var loginname: String = "";
    static var location: String = "";
    static var longitude: Double = 0;
    static var latitude: Double = 0;
    static var university: String = "";
    static var major: String = "";
    static var photo: String = "";
};


struct frienduser{
    static var emailarray = [String]();
    static var useridarray = [String]();
    static var timestamparray = [String]();
};
