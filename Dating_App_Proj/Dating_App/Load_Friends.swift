//
//  Load_Friends.swift
//  Simple
//
//  Created by Clement Chan on 6/18/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Load_Friends : UIViewController{
    
    var ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.endEditing(true)
        
        self.ref.queryOrdered(byChild: "Email").queryEqual(toValue: login.loginid)
            .observe(.childAdded, with: { snapshot in
                
                if let source = snapshot.value as? [String:AnyObject] {
                login_user.loginname  = (source["Profile_Name"] as? String)!
                login_user.latitude = (source["latitude"] as? Double)!
                login_user.longitude = (source["longitude"] as? Double)!
                login_user.user_name = (source["username"] as? String)!
                login_user.major = (source["Major"] as? String)!
                login_user.university = (source["Education"] as? String)!
                login_user.location = (source["location"] as? String)!
                login_user.Profile_Name = (source["Profile_Name"] as? String)!
                }
        })
        
        var friend = "friends/" + login_user.user_name + "_fd"
        let friendemail = FIRDatabase.database().reference().child(friend)
        
        frienduser.emailarray = [];
        friendemail.queryOrdered(byChild: "Email").observe(.value, with:{friendsnapshot in
            for index in (friendsnapshot.children.allObjects as! [FIRDataSnapshot]){
                if let source = index.value as? [String:AnyObject]{
                let email = source["Email"] as! String
                frienduser.emailarray.append(email);
                }
            }
        })
        
        self.loadDestinationVC()
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "ToProfile", sender: nil)
    }
    
};

