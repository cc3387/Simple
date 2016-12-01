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
    
    @IBAction func ToMenuPage(_ sender: Any) {
        var ref = FIRDatabase.database().reference().child("users")
        ref.queryOrdered(byChild: "Email").queryEqual(toValue: login.loginid)
            .observe(.childAdded, with: { snapshot in
                
                if let source = snapshot.value as? [String:AnyObject] {
                    
                    if ((source["EULA"] as? String)! == "0"){
                    self.loadEULA()
                    }
                    else if ((source["EULA"] as? String)! == "1"){
                    self.loadmainmenu()
                    }
                }
        })
    }
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.endEditing(true)
        self.indicator.startAnimating()
        self.indicator.isHidden = false
        
        frienduser.emailarray.removeAll();
        frienduser.useridarray.removeAll();
        frienduser.phoneidarray.removeAll();
        frienduser.profilenamearray.removeAll();
        frienduser.photoarray.removeAll()
        frienduser.blockarray.removeAll()
        frienduser.useridarrayfinal.removeAll();
        frienduser.phoneidarrayfinal.removeAll();
        frienduser.profilenamearrayfinal.removeAll();
        
        
        var ref = FIRDatabase.database().reference().child("users")
        ref.queryOrdered(byChild: "Email").queryEqual(toValue: login.loginid)
            .observe(.childAdded, with: { snapshot in
                
                if let source = snapshot.value as? [String:AnyObject] {
                    
                    login_user.loginname = (source["Profile_Name"] as? String)!
                    login_user.latitude = (source["latitude"] as? Double)!
                    login_user.longitude = (source["longitude"] as? Double)!
                    login_user.user_name = (source["username"] as? String)!
                    login_user.major = (source["Major"] as? String)!
                    login_user.university = (source["Education"] as? String)!
                    login_user.location = (source["Address"] as? String)!
                    login_user.Profile_Name = (source["Profile_Name"] as? String)!
                    login_user.photo = (source["Photo"] as? String)!
                    login_user.uid = (source["uid"] as? String)!
                    login_user.phoneid = (source["phoneid"] as? String)!
                }
            })
        
        var friend = "friends/" + login_user.uid + "_fd"
        let friendemail = FIRDatabase.database().reference().child(friend)
        
        friendemail.queryOrdered(byChild: "Email").observe(.value, with:{friendsnapshot in
            for index in friendsnapshot.children.allObjects as! [FIRDataSnapshot]{
                if let source = index.value as? [String:AnyObject] {
                    
                    
                    if let id = source["Email"] as! String?{
                        if(id != login.loginid){
                            frienduser.emailarray.append(id);
                        }
                        if let id2 = source["uid"] as! String?{
                            if(id2 != login_user.uid){
                                frienduser.useridarray.append(id2);
                            }
                            if let id3 = source["Profile_Name"] as! String?{
                                if(id3 != login_user.Profile_Name){
                                    frienduser.profilenamearray.append(id3);
                                }
                                if let id4 = source["phoneid"] as! String?{
                                    if(id4 != login_user.phoneid){
                                        frienduser.phoneidarray.append(id4);
                                    }
                                    if let id5 = source["Photo"] as! String?{
                                        if(id5 != login_user.phoneid){
                                            frienduser.photoarray.append(id5);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(10 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)){
            self.indicator.stopAnimating()
            self.indicator.isHidden = true
        };
        
        //self.loadDest()
    }
    
    func loadDest(){
        self.performSegue(withIdentifier: "loadtomenu", sender: nil)
    }
    
    func loadEULA(){
        self.performSegue(withIdentifier: "ToEULA", sender: nil)
    }
    
    func loadmainmenu(){
        self.performSegue(withIdentifier: "ToMainMenu", sender: nil)
    }
    
};

