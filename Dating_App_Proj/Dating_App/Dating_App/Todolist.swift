//
//  Todolist.swift
//  Simple
//
//  Created by Clement Chan on 7/26/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
class Todolist: UIViewController{
    
    @IBAction func ChillButton(sender: AnyObject) {
        
        let location = login_user.location.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        let address = "https://www.google.com/#q=" + location + "+chill+activities"
        if let url = NSURL(string: address) {
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
    
    @IBAction func MovieButton(sender: AnyObject) {
        
        if(login_user.latitude >= 5.87 && login_user.latitude <= 71.39 &&
            login_user.longitude <= -66.9 && login_user.longitude > -180){
        
        if let url = NSURL(string: "http://www.fandango.com") {
            UIApplication.sharedApplication().openURL(url)
        }
        }
        else if(login_user.latitude >= 22.15 && login_user.latitude <= 22.557 &&
            login_user.longitude >= 113.83 && login_user.longitude < 114.407){
            if let url = NSURL(string: "http://www.uacinemas.com.hk") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    
        
    }
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        
    }
    
    //Load destination to the main profile
    func loadDestinationVC(){
        self.performSegueWithIdentifier("LoadProfile", sender: nil)
    }
    
}

