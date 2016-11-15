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

    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.endEditing(true)
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
    static var uid: String = "";
    static var phoneid: String = "";
};


struct frienduser{
    static var emailarray = [String]();
    static var useridarray = [String]();
    static var phoneidarray = [String]();
    static var profilenamearray = [String]();
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
