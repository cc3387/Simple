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
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBarHidden = true
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = false
        var ref = Firebase(url:"https://simpleplus.firebaseio.com/autologin")
        var reflogin = Firebase(url:"https://simpleplus.firebaseio.com")
        let phoneid = BatchPush.lastKnownPushToken()
        ref.queryOrderedByChild("phoneid").queryEqualToValue(phoneid)
            .observeEventType(.ChildAdded, withBlock: { snapshot in
                if let username = snapshot.value["username"] as? String {
                    login.loginid = username
                    print(login.loginid)
                    if let password = snapshot.value["password"] as? String {
                        login.password = password
                        print(login.password)
                        if(username != "" && password != ""){
                        reflogin.authUser(login.loginid, password: login.password) {
                            error, authData in
                            if error != nil {
                                // an error occured while attempting login
                                print("Login info is wrong");
                            } else {
                                login.chatid = ref.authData.uid
                                indication = 1;
                                frienduser.emailarray.removeAll();
                                frienduser.useridarray.removeAll();
                                frienduser.phoneidarray.removeAll();
                                frienduser.profilenamearray.removeAll();
                                self.loadDestinationVC1();
                            };
                           }
                    }
                        else{

                    }
                }
            }
        })
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(5 * NSEC_PER_SEC)), dispatch_get_main_queue()){
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidden = true
        };
        
    }
    
    @IBAction func Login(sender: AnyObject) {
//        if(loginid == ""){
            loadDestinationVC()
//        }
//        else if(loginid != ""){
//            loadDestinationVC1()
//        }
    }
    
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    

    func loadDestinationVC1(){
        self.performSegueWithIdentifier("openProfile", sender: nil)
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
};
