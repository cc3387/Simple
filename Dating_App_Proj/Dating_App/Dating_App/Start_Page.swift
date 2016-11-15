//
//  Start_Page.swift
//  Simple
//
//  Created by Clement Chan on 6/20/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//


import Foundation
import Firebase
import Batch
var loginid: String = "";

class Start_Page : UIViewController{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var phoneid: String = "";
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.isNavigationBarHidden = true
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        
        var ref = FIRDatabase.database().reference().child("autologin")
        
        if(BatchPush.lastKnownPushToken() == nil){
        self.phoneid = BatchUser.installationID()!
        login.phoneid = self.phoneid
        }
        else if(BatchPush.lastKnownPushToken() != nil){
        self.phoneid = BatchPush.lastKnownPushToken()
        login.phoneid = self.phoneid
        }
        
        ref.queryOrdered(byChild: "phoneid").queryEqual(toValue: self.phoneid)
            .observeSingleEvent(of: .childAdded, with: { snapshot in
                
                if let source = snapshot.value as? [String:AnyObject] {
                let loginid = source["username"] as? String
                let password  = source["password"] as? String
                
                login.loginid = loginid!
                login.password = password!
                
                //Logging in with details extracted from autologin data
                if(login.loginid != "" && login.password != ""){
                    FIRAuth.auth()?.signIn(withEmail: login.loginid, password: login.password) { (user, error) in
                        if error != nil {
                            // an error occured while attempting login
                            print("Login info is wrong");
                        } else {
                            login.chatid = (FIRAuth.auth()!.currentUser!.uid)
                            indication = 1;
                            frienduser.emailarray.removeAll();
                            frienduser.useridarray.removeAll();
                            frienduser.phoneidarray.removeAll();
                            frienduser.profilenamearray.removeAll();
                            
                            var friend = "friends/" + login.chatid  + "_fd"
                            let friendlist = FIRDatabase.database().reference().child(friend)
                            friendlist.queryOrdered(byChild: "uid").observe(.value, with:{friendsnapshot in
                                for index in friendsnapshot.children.allObjects as! [FIRDataSnapshot] {
                                    
                                    if let source = index.value as? [String:AnyObject] {
                                    
                                    let uid = source["uid"] as! String!
                                    let id = uid! + "_fd"
                                    
                                    var friendlst = FIRDatabase.database().reference().child("friends").child(id).child(login.chatid).child("phoneid")
                                    
                                    friendlst.setValue(BatchPush.lastKnownPushToken())
                                    }
                                }
                            })
                            
                            self.loadDestinationVC1();
                        };
                    }
                }
            }
        })
              
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(5 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)){
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        };
        
    }
    
    @IBAction func Login(_ sender: AnyObject) {
        //        if(loginid == ""){
        loadDestinationVC()
        //        }
        //        else if(loginid != ""){
        //            loadDestinationVC1()
        //        }
    }
    
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    
    func loadDestinationVC1(){
        self.performSegue(withIdentifier: "ToProfile", sender: nil)
    }
    
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "No_Login", sender: nil)
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
    static var uid: String = "";
    static var phoneid: String = "";
};


struct frienduser{
    static var emailarray = [String]();
    static var useridarray = [String]();
    static var phoneidarray = [String]();
    static var profilenamearray = [String]();
    static var photoarray = [String]();
};

//Storing the userid as global variable in the ios app machine
struct register_info{
    static var username: String = "";
    static var password: String = "";
    static var email: String = "";
    static var user_id: String = "";
    static var age_range: String = "";
    static var Profile_name: String = "";
    static var location: String = "";
    static var address: String = "";
    static var location_lat: Double = 0;
    static var location_lng: Double = 0;
    static var Gender: String = "";
    static var education: String = "";
    static var Major: String = "";
    static var beer_or_wine: String = "";
    static var sports_or_art: String = "";
    static var EDC_or_Classic: String = "";
    static var Ethnicity: String = "";
    static var Cooking_Dineout: String = "";
    static var URank: String = "";
    static var Photo: NSString = "";
    static var uid: NSString = "";
    static var phoneid: NSString = "";
}

struct friend_profile{
    static var Profile_Name: String? = "";
    static var Location: String? = "";
    static var Major: String? = "";
    static var University: String? = "";
    static var Photo: UIImage?;
    static var username: String? = "";
    static var Email: String? = "";
    static var Photostring: String? = "";
    static var uid: String? = "";
    static var phoneid: String? = "";
    static var Chatid: Int?;
    static var q1: String? = "";
    static var q2: String? = "";
    static var q3: String? = "";
};

struct conversation_info{
    static var friend_id1: String? = "";
    static var friend_id2: String? = "";
    static var friend_id3: String? = "";
    static var friend_id4: String? = "";
    static var chat_check1: Int?;
    static var chat_check2: Int?;
    static var chat_check3: Int?;
    static var chat_check4: Int?;
};

struct convo_final{
    static var friend_id_final: String = "";
    static var friend_phoneid_final: String = "";
    static var friend_Profile_final: String = "";
    static var chat_check_final: Int?;
    static var notification: Int?;
};


//Storing the userid as global variable in the ios app machine
struct login{
    
    static var loginid = "";
    static var password = "";
    static var chatid = "";
    static var phoneid = "";
    static var registered:Int = 0;
    static var Photo: UIImage?;
}

struct arrays{
    
    static var friendsArray:[String] = [String]() //Set an empty array for friend names
    static var friendlocArray:[String] = [String]() //Set an empty array for friend locations
    static var frienduniArray:[String] = [String]() //Set an empty array for university locations
    static var friendmajorArray:[String] = [String]() //Set an empty array for major locations
    static var friendidArray:[String] = [String]() //Set an empty array for friend's ID
    static var chatcheck:[Int] = [Int]() //Check 1:1 relationship
    
};


//Define the question array
var Question_array = 0
var Questions = [String]()
var Answerone = [String]()
var Answertwo = [String]()
