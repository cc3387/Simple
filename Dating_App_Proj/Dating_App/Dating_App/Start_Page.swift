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
        
        if(loginid == ""){
            loadDestinationVC()
        }
        else if(loginid != ""){
            loadDestinationVC1()
        }
    }


    func loadDestinationVC1(){
        self.performSegueWithIdentifier("Yes_Login", sender: nil)
    }
    
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("No_Login", sender: nil)
    }

};
