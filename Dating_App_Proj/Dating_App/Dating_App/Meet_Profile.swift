//
//  Meet_Profile.swift
//  Simple
//
//  Created by Clement Chan on 10/11/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Profile_Meet_Main : UIViewController{
    
    @IBOutlet weak var User_ID: UILabel!
    @IBOutlet weak var Time_Greetings: UILabel!
    @IBOutlet weak var user_greetings: UILabel!
    @IBOutlet weak var Bkground_Image: UIImageView!
    
    @IBOutlet var Image_1: UIImageView!
    @IBOutlet var Image_2: UIImageView!
    @IBOutlet var Image_3: UIImageView!
    @IBOutlet var Image_4: UIImageView!
    
    //Getting Profile name from the server
    @IBOutlet weak var Profile_Name: UILabel!
    var user_id: String = login.loginid;
    
    //Matching Labels
    @IBOutlet weak var First_Match: UILabel!
    @IBOutlet weak var First_Loc: UILabel!
    @IBOutlet weak var First_Uni: UILabel!
    @IBOutlet weak var First_Major: UILabel!
    var first_id: String = "";
    var first_match: String = "";
    var first_loc: String = "";
    var first_uni: String = "";
    var first_major: String = "";
    var first_photo_string: String = "";
    var uid1: String = "";
    var phoneid1: String = "";
    var q11: String = "";
    var q12: String = "";
    var q13: String = "";
    
    @IBOutlet weak var Second_Match: UILabel!
    @IBOutlet weak var Second_Loc: UILabel!
    @IBOutlet weak var Second_Uni: UILabel!
    @IBOutlet weak var Second_Major: UILabel!
    var second_id: String = "";
    var second_match: String = "";
    var second_loc: String = "";
    var second_uni: String = "";
    var second_major: String = "";
    var second_photo_string: String = "";
    var uid2: String = "";
    var phoneid2: String = "";
    var q21: String = "";
    var q22: String = "";
    var q23: String = "";
    
    @IBOutlet weak var Third_Match: UILabel!
    @IBOutlet weak var Third_Loc: UILabel!
    @IBOutlet weak var Third_Uni: UILabel!
    @IBOutlet weak var Third_Major: UILabel!
    var third_id: String = "";
    var third_match: String = "";
    var third_loc: String = "";
    var third_uni:String = "";
    var third_major: String = "";
    var third_photo_string: String = "";
    var uid3: String = "";
    var phoneid3: String = "";
    var q31: String = "";
    var q32: String = "";
    var q33: String = "";
    
    @IBOutlet weak var Fourth_Match: UILabel!
    @IBOutlet weak var Fourth_Loc: UILabel!
    @IBOutlet weak var Fourth_Uni: UILabel!
    @IBOutlet weak var Fourth_Major: UILabel!
    var fourth_id: String = "";
    var fourth_match: String = "";
    var fourth_loc: String = "";
    var fourth_uni: String = "";
    var fourth_major: String = "";
    var fourth_photo_string: String = "";
    var uid4: String = "";
    var phoneid4: String = "";
    var q41: String = "";
    var q42: String = "";
    var q43: String = "";
    
    @IBOutlet weak var Fifth_Match: UILabel!
    
    
    @IBAction func Chat_1(sender: AnyObject) {
        
        if(self.first_match != ""){
            var usernamefriend = login_user.uid + "_fd";
            var friendusername = self.uid1 + "_fd";
            var ref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
            let fdref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
            
            var friendinfo = [
                "Profile_Name" : self.First_Match.text!,
                "location" : self.First_Loc.text!,
                "Education": self.First_Uni.text!,
                "Major": self.First_Major.text!,
                "username": self.first_id,
                "Email": self.first_match,
                "Photo": self.first_photo_string,
                "uid": self.uid1,
                "phoneid": self.phoneid1,
                "Notification": 0,
                "Chatid": 1
            ];
            
            var infofriend = [
                "Profile_Name" : login_user.Profile_Name,
                "location" : login_user.location,
                "Education": login_user.university,
                "Major": login_user.major,
                "username": login_user.user_name,
                "Email": login.loginid,
                "Photo": login_user.photo,
                "uid": login_user.uid,
                "phoneid": login_user.phoneid,
                "Notification": 0,
                "Chatid": 2
            ];
            
            var usernamefd = ref.childByAppendingPath(usernamefriend);
            var fdusername = fdref.childByAppendingPath(friendusername);
            usernamefd.childByAppendingPath(self.uid1).setValue(friendinfo);
            fdusername.childByAppendingPath(login_user.uid).setValue(infofriend);
            
            //Load to the next destination
            loadDestinationVC();
        }
        else{
            
        }
    }

    //Buttons to Chat ViewController
    @IBAction func Chat_2(sender: AnyObject) {
        if(self.second_match != ""){
            var usernamefriend = login_user.uid + "_fd";
            var friendusername = self.uid2 + "_fd";
            var ref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
            let fdref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
            
            var friendinfo = [
                "Profile_Name" : self.Second_Match.text!,
                "location" : self.Second_Loc.text!,
                "Education": self.Second_Uni.text!,
                "Major": self.Second_Major.text!,
                "username": self.second_id,
                "Email": self.second_match,
                "Photo": self.second_photo_string,
                "uid": self.uid2,
                "phoneid": self.phoneid2,
                "Notification": 0,
                "Chatid": 1
            ];
            
            var infofriend = [
                "Profile_Name" : login_user.Profile_Name,
                "location" : login_user.location,
                "Education": login_user.university,
                "Major": login_user.major,
                "username": login_user.user_name,
                "Email": login.loginid,
                "Photo": login_user.photo,
                "uid": login_user.uid,
                "phoneid": login_user.phoneid,
                "Notification": 0,
                "Chatid": 2
            ];
            
            var usernamefd = ref.childByAppendingPath(usernamefriend);
            var fdusername = fdref.childByAppendingPath(friendusername);
            usernamefd.childByAppendingPath(self.uid2).setValue(friendinfo);
            fdusername.childByAppendingPath(login_user.uid).setValue(infofriend);
            
            //Load to the next destination
            loadDestinationVC();
        }
        else{
            
        }
    }

    @IBAction func Chat_3(sender: AnyObject) {
        if(self.third_match != ""){
            var usernamefriend = login_user.uid  + "_fd";
            var friendusername = self.uid3 + "_fd";
            var ref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
            let fdref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
            
            var friendinfo = [
                "Profile_Name" : self.Third_Match.text!,
                "location" : self.Third_Loc.text!,
                "Education": self.Third_Uni.text!,
                "Major": self.Third_Major.text!,
                "username": self.third_id,
                "Email": self.third_match,
                "Photo": self.third_photo_string,
                "uid": self.uid3,
                "phoneid": self.phoneid3,
                "Notification": 0,
                "Chatid": 1
            ];
            
            var infofriend = [
                "Profile_Name" : login_user.Profile_Name,
                "location" : login_user.location,
                "Education": login_user.university,
                "Major": login_user.major,
                "username": login_user.user_name,
                "Email": login.loginid,
                "Photo": login_user.photo,
                "uid": login_user.uid,
                "phoneid": login_user.phoneid,
                "Notification": 0,
                "Chatid": 2
            ];
            
            var usernamefd = ref.childByAppendingPath(usernamefriend);
            var fdusername = fdref.childByAppendingPath(friendusername);
            usernamefd.childByAppendingPath(self.uid3).setValue(friendinfo);
            fdusername.childByAppendingPath(login_user.uid).setValue(infofriend);
            
            
            //Load to the next destination
            loadDestinationVC();
        }
        else{
            
        }
    }
    
    @IBAction func Chat_4(sender: AnyObject) {
        if(self.fourth_match != ""){
            var usernamefriend = login_user.uid + "_fd";
            var friendusername = self.uid4 + "_fd";
            var ref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
            let fdref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
            
            var friendinfo = [
                "Profile_Name" : self.Fourth_Match.text!,
                "location" : self.Fourth_Loc.text!,
                "Education": self.Fourth_Uni.text!,
                "Major": self.Fourth_Major.text!,
                "username": self.fourth_id,
                "Email": self.fourth_match,
                "Photo": self.fourth_photo_string,
                "uid": self.uid4,
                "phoneid": self.phoneid4,
                "Notification": 0,
                "Chatid": 1
            ];
            
            var infofriend = [
                "Profile_Name" : login_user.Profile_Name,
                "location" : login_user.location,
                "Education": login_user.university,
                "Major": login_user.major,
                "username": login_user.user_name,
                "Email": login.loginid,
                "Photo": login_user.photo,
                "uid": login_user.uid,
                "phoneid": login_user.phoneid,
                "Notification": 0,
                "Chatid": 2
            ];
            
            var usernamefd = ref.childByAppendingPath(usernamefriend);
            var fdusername = fdref.childByAppendingPath(friendusername);
            usernamefd.childByAppendingPath(self.uid4).setValue(friendinfo);
            fdusername.childByAppendingPath(login_user.uid).setValue(infofriend);
            
            //Load to the next destination
            loadDestinationVC();
        }
        else{
            
        }
    }

    //Getting the login_user id that is collected from the login page
    var loginuser: String = login.loginid;
    var user1: String = "";
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let hours = hour();
        let minutes = minute();
        let hour_i = hour_int();
        let minute_i = minute_Int();
        
        if(hour_i > 6 && hour_i < 12){
            
            if(minute_i < 10){
                self.Time_Greetings.text = "Good Morning, the time is " + hours + " : " + "0" + minutes;
            }
            else{
                self.Time_Greetings.text = "Good Morning, the time is " + hours + " : " + minutes;
            }
            
            Time_Greetings.textColor = UIColor.whiteColor();
            Bkground_Image.image = UIImage(named: "Night_Sky_Pond.jpg");
            
            //Setting the User ID to login user id
            self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
            self.User_ID.textColor = UIColor.whiteColor();
            Time_Greetings.textColor = UIColor.whiteColor();
        }
        else if(hour_i >= 12 && hour_i <= 18){
            
            if(minute_i < 10){
                self.Time_Greetings.text = "Good Afternoon, the time is " + hours + " : " + "0" + minutes;
            }
            else{
                self.Time_Greetings.text = "Good Afternoon, the time is " + hours + " : " + minutes;
            }
            
            let random = arc4random_uniform(2);
            
            if(random == 0){
                Bkground_Image.image = UIImage(named: "chicago_afternoon.jpg");
            }
            
            if(random == 1){
                Bkground_Image.image = UIImage(named: "Sunset.jpg");
            }
            
            //Setting the User ID to login user id
            self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
            self.User_ID.textColor = UIColor.whiteColor();
            Time_Greetings.textColor = UIColor.whiteColor();
        }
        else{
            
            if(minute_i < 10){
                self.Time_Greetings.text = "Good Evening, the time is " + hours + " : " + "0" + minutes;
            }
            else{
                self.Time_Greetings.text = "Good Evening, the time is " + hours + " : " + minutes;
            }
            
            
            let random = arc4random_uniform(2);
            
            if(random == 0){
                Bkground_Image.image = UIImage(named: "night_sky.jpg");
            }
            else if(random == 1){
                Bkground_Image.image = UIImage(named: "Night_Sky_Pond.jpg");
            }
            else if(random == 2){
                Bkground_Image.image = UIImage(named: "Night_Sky_Pond.jpg");
            }
            
            //Setting the User ID to login user id
            self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
            self.User_ID.textColor = UIColor.whiteColor();
            Time_Greetings.textColor = UIColor.whiteColor();
        }
        
        //Download all the users to the meeting page
        let ref = Firebase(url:"https://simpleplus.firebaseio.com/users")
        ref.queryOrderedByChild("longitude").queryStartingAtValue(login_user.longitude-1).queryEndingAtValue(login_user.longitude+1).observeEventType(.Value, withBlock: { longitudesnapshot in
                let latref = ref.queryOrderedByChild("latitude").queryStartingAtValue(login_user.latitude-1).queryEndingAtValue(login_user.latitude+1).observeEventType(.Value, withBlock: { latitudesnapshot in
                    
                    var count = 0;
                    
                    for index in latitudesnapshot.children.allObjects as! [FDataSnapshot]{
                        
                        var uname: String = "";
                        var ind: Int = 0;
                        uname = (index.value["Email"] as! String?)!;
                        
                        for friend in frienduser.emailarray{
                            if(uname == friend){
                                ind = 1;
                            }
                        }
                        
                        if(uname != login.loginid && count == 0 && ind == 0){
                        self.First_Match.text = index.value["Profile_Name"] as! String?;
                        self.First_Loc.text = index.value["location"] as! String?;
                        self.First_Uni.text = index.value["Education"] as! String?;
                        self.First_Major.text = index.value["Major"] as! String?;
                        self.first_id = (index.value["username"] as! String?)!;
                        self.first_match = (index.value["Email"] as! String?)!;
                        self.first_photo_string = (index.value["Photo"] as! String?)!;
                        var decodedData = NSData(base64EncodedString: self.first_photo_string, options: NSDataBase64DecodingOptions())
                        var decodedImage = UIImage(data: decodedData!)!
                        self.Image_1.image = decodedImage
                        self.Image_1.contentMode = .ScaleAspectFit
//                        self.q11 = (index.value["Qone"] as! String?)!;
//                        self.q12 = (index.value["Qtwo"] as! String?)!;
//                        self.q13 = (index.value["Qthree"] as! String?)!;
                        self.uid1 = (index.value["uid"] as! String?)!;
                        self.phoneid1 = (index.value["phoneid"] as! String?)!;
                        self.First_Match.textColor = UIColor.whiteColor();
                        self.First_Loc.textColor = UIColor.whiteColor();
                        self.First_Uni.textColor = UIColor.whiteColor();
                        self.First_Major.textColor = UIColor.whiteColor();
                        self.First_Match.sizeToFit()
                        self.First_Loc.sizeToFit()
                        self.First_Uni.sizeToFit()
                        self.First_Major.sizeToFit()
                        self.First_Match.adjustsFontSizeToFitWidth = true
                        self.First_Loc.adjustsFontSizeToFitWidth = true
                        self.First_Uni.adjustsFontSizeToFitWidth = true
                        self.First_Major.adjustsFontSizeToFitWidth = true
                        count += 1;
                        }
                        else if(uname != login.loginid && count == 1 && ind == 0){
                        self.Second_Match.text = index.value["Profile_Name"] as! String?;
                        self.Second_Loc.text = index.value["location"] as! String?;
                        self.Second_Uni.text = index.value["Education"] as! String?;
                        self.Second_Major.text = index.value["Major"] as! String?;
                        self.second_id = (index.value["username"] as! String?)!;
                        self.second_match = (index.value["Email"] as! String?)!;
                        self.second_photo_string = (index.value["Photo"] as! String?)!;
                        var decodedData = NSData(base64EncodedString: self.second_photo_string, options: NSDataBase64DecodingOptions())
                        var decodedImage = UIImage(data: decodedData!)!
                        self.Image_2.image = decodedImage
                        self.Image_2.contentMode = .ScaleAspectFit
//                        self.q21 = (index.value["Qone"] as! String?)!;
//                        self.q22 = (index.value["Qtwo"] as! String?)!;
//                        self.q23 = (index.value["Qthree"] as! String?)!;
                        self.uid2 = (index.value["uid"] as! String?)!;
                        self.phoneid2 = (index.value["phoneid"] as! String?)!;
                        self.Second_Match.textColor = UIColor.whiteColor();
                        self.Second_Loc.textColor = UIColor.whiteColor();
                        self.Second_Uni.textColor = UIColor.whiteColor();
                        self.Second_Major.textColor = UIColor.whiteColor();
                        self.Second_Match.sizeToFit()
                        self.Second_Loc.sizeToFit()
                        self.Second_Uni.sizeToFit()
                        self.Second_Major.sizeToFit()
                        self.Second_Match.adjustsFontSizeToFitWidth = true
                        self.Second_Loc.adjustsFontSizeToFitWidth = true
                        self.Second_Uni.adjustsFontSizeToFitWidth = true
                        self.Second_Major.adjustsFontSizeToFitWidth = true
                        count += 1;
                        }
                        else if(uname != login.loginid && count == 2 && ind == 0){
                        self.Third_Match.text = index.value["Profile_Name"] as! String?;
                        self.Third_Loc.text = index.value["location"] as! String?;
                        self.Third_Uni.text = index.value["Education"] as! String?;
                        self.Third_Major.text = index.value["Major"] as! String?;
                        self.third_id = (index.value["username"] as! String?)!;
                        self.third_match = (index.value["Email"] as! String?)!;
                        self.third_photo_string = (index.value["Photo"] as! String?)!;
                        var decodedData = NSData(base64EncodedString: self.third_photo_string, options: NSDataBase64DecodingOptions())
                        var decodedImage = UIImage(data: decodedData!)!
                        self.Image_3.image = decodedImage
                        self.Image_3.contentMode = .ScaleAspectFit
//                        self.q31 = (index.value["Qone"] as! String?)!;
//                        self.q32 = (index.value["Qtwo"] as! String?)!;
//                        self.q33 = (index.value["Qthree"] as! String?)!;
                        self.uid3 = (index.value["uid"] as! String?)!;
                        self.phoneid3 = (index.value["phoneid"] as! String?)!;
                        self.Third_Match.textColor = UIColor.whiteColor();
                        self.Third_Loc.textColor = UIColor.whiteColor();
                        self.Third_Uni.textColor = UIColor.whiteColor();
                        self.Third_Major.textColor = UIColor.whiteColor();
                        self.Third_Match.sizeToFit()
                        self.Third_Loc.sizeToFit()
                        self.Third_Uni.sizeToFit()
                        self.Third_Major.sizeToFit()
                        self.Third_Match.adjustsFontSizeToFitWidth = true
                        self.Third_Loc.adjustsFontSizeToFitWidth = true
                        self.Third_Uni.adjustsFontSizeToFitWidth = true
                        self.Third_Major.adjustsFontSizeToFitWidth = true
                        count += 1;
                        }
                        else if(uname != login.loginid && count == 3 && ind == 0){
                        self.Fourth_Match.text = index.value["Profile_Name"] as! String?;
                        self.Fourth_Loc.text = index.value["location"] as! String?;
                        self.Fourth_Uni.text = index.value["Education"] as! String?;
                        self.Fourth_Major.text = index.value["Major"] as! String?;
                        self.fourth_id = (index.value["username"] as! String?)!;
                        self.fourth_match = (index.value["Email"] as! String?)!;
                        self.fourth_photo_string = (index.value["Photo"] as! String?)!;
                        var decodedData = NSData(base64EncodedString: self.fourth_photo_string, options: NSDataBase64DecodingOptions())
                        var decodedImage = UIImage(data: decodedData!)!
                        self.Image_4.image = decodedImage
                        self.Image_4.contentMode = .ScaleAspectFit
//                        self.q41 = (index.value["Qone"] as! String?)!;
//                        self.q42 = (index.value["Qtwo"] as! String?)!;
//                        self.q43 = (index.value["Qthree"] as! String?)!;
                        self.uid4 = (index.value["uid"] as! String?)!;
                        self.phoneid4 = (index.value["phoneid"] as! String?)!;
                        self.Fourth_Match.textColor = UIColor.whiteColor();
                        self.Fourth_Loc.textColor = UIColor.whiteColor();
                        self.Fourth_Uni.textColor = UIColor.whiteColor();
                        self.Fourth_Major.textColor = UIColor.whiteColor();
                        self.Fourth_Match.sizeToFit()
                        self.Fourth_Loc.sizeToFit()
                        self.Fourth_Uni.sizeToFit()
                        self.Fourth_Major.sizeToFit()
                        self.Fourth_Match.adjustsFontSizeToFitWidth = true
                        self.Fourth_Loc.adjustsFontSizeToFitWidth = true
                        self.Fourth_Uni.adjustsFontSizeToFitWidth = true
                        self.Fourth_Major.adjustsFontSizeToFitWidth = true
                        count += 1;
                        }
                    }
                })
        })
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    
    //Functions that will be used to display the time
    func hour() -> String
    {
        //Get Hour
        let date:NSDate = NSDate();
        let calendar: NSCalendar = NSCalendar.currentCalendar();
        let components:NSDateComponents = calendar.components(
            NSCalendarUnit.NSHourCalendarUnit, fromDate: date)
        let hours = components.hour
        let hour = String(hours);
        //Return Hour
        return hour
    }
    
    func hour_int() -> Int
    {
        //Get Hour
        let date:NSDate = NSDate();
        let calendar: NSCalendar = NSCalendar.currentCalendar();
        let components:NSDateComponents = calendar.components(
            NSCalendarUnit.NSHourCalendarUnit, fromDate: date)
        let hours = components.hour
        let hour = Int(hours);
        //Return Hour
        return hour
    }
    
    
    func minute() -> String
    {
        //Get Minute
        let date:NSDate = NSDate();
        let calendar: NSCalendar = NSCalendar.currentCalendar();
        let components:NSDateComponents = calendar.components(
            NSCalendarUnit.NSMinuteCalendarUnit, fromDate: date)
        let minutes = components.minute
        let minute = String(minutes);
        //Return Minute
        return minute
    }
    
    func minute_Int() -> Int
    {
        //Get Minute
        let date:NSDate = NSDate();
        let calendar: NSCalendar = NSCalendar.currentCalendar();
        let components:NSDateComponents = calendar.components(
            NSCalendarUnit.NSMinuteCalendarUnit, fromDate: date)
        let minutes = components.minute
        let minute = Int(minutes);
        //Return Minute
        return minute
    }
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("To_Chat", sender: nil)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
};
