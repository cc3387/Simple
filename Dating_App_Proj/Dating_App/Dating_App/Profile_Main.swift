//
//  Profile_Main.swift
//  Simple
//
//  Created by Clement Chan on 9/19/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Profile_Main : UIViewController{

    @IBOutlet weak var User_ID: UILabel!
    @IBOutlet weak var Time_Greetings: UILabel!
    @IBOutlet weak var user_greetings: UILabel!
    @IBOutlet weak var Bkground_Image: UIImageView!
    
    var friendsArray:[String] = [String]() //Set an array with empty array
    var friend:String = "";
    var read_count: Int = 0;
    var id:String = "";
    var id1:String = "";
    var id_user:String = login_user.user_name;
    var timestamp:String = "";
    var timestamp1:String = "";
    var lstmessage:String = "";
    var lstmessage1:String = "";
    var indication:Int = 0;
    
    //Getting Profile name from the server
    
    @IBOutlet weak var Profile_Name: UILabel!
    
    @IBAction func Single_Meet(sender: AnyObject) {
        loadDestinationVC();
    }
    
    @IBAction func To_Chat(sender: AnyObject) {
        loadtoChat();
    }
    
    
    //Getting the login_user id that is collected from the login page
    var loginuser: String = "";
    var user1: String = "";
    
    @IBOutlet var Profile_Pic: UIImageView!
    
    //Action Item
    override func viewDidLoad() {
    super.viewDidLoad()
    self.view.endEditing(true)
        
    loginid = login.loginid
    self.navigationController?.setNavigationBarHidden(true, animated: false)
//    frienduser.emailarray.removeAll();
//    frienduser.useridarray.removeAll();
//    frienduser.timestamparray.removeAll();

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
            
            let random = arc4random_uniform(3);
            
            Time_Greetings.textColor = UIColor.blackColor();
            
            if(random == 0){
            Bkground_Image.image = UIImage(named: "malaysia_morning.jpg");
            }
            else if(random == 1){
            Bkground_Image.image = UIImage(named: "Switzerland_Bridge.jpg");
            }
            else if(random == 2){
            Bkground_Image.image = UIImage(named: "Dawn_City.jpg");
            }

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
            Bkground_Image.image = UIImage(named: "Dawn_City.jpg");
            }
            
            if(random == 1){
            Bkground_Image.image = UIImage(named: "Dawn_City.jpg");
            }
                
            //Setting the User ID to login user id
            //self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
            //self.User_ID.textColor = UIColor.blackColor();
        }
        else{
            
            if(minute_i < 10){
                self.Time_Greetings.text = "Good Evening, the time is " + hours + " : " + "0" + minutes;
            }
            else{
                self.Time_Greetings.text = "Good Evening, the time is " + hours + " : " + minutes;
            }
            
            
            let random = arc4random_uniform(5);
            
            if(random == 0){
            Bkground_Image.image = UIImage(named: "Night_Sky_Pond.jpg");
            }
            else if(random == 1){
            Bkground_Image.image = UIImage(named: "hongkongnight.jpg");
            }
            else if(random == 2){
            Bkground_Image.image = UIImage(named: "New_York_Night.jpg");
            }
            else if(random == 3){
            Bkground_Image.image = UIImage(named: "seattle_night.jpg");
            }
            else if(random == 4){
            Bkground_Image.image = UIImage(named: "New_York_Night.jpg");
            }
            
            //Setting the User ID to login user id
            //self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
            //self.User_ID.textColor = UIColor.whiteColor();
        }
        
        let ref = Firebase(url:"https://simpleplus.firebaseio.com/users")
        ref.queryOrderedByChild("Email").queryEqualToValue(login.loginid)
            .observeEventType(.ChildAdded, withBlock: { snapshot in
                if let login_name = snapshot.value["Profile_Name"] as? String {
                    login_user.loginname = login_name;
                    print(login_user.loginname);
                    self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
                    self.User_ID.textColor = UIColor.whiteColor();
                    
                    if let ulat = snapshot.value["latitude"] as? Double{
                        login_user.latitude = ulat;
                        print(login_user.latitude);
                        if let ulon = snapshot.value["longitude"] as? Double{
                            login_user.longitude = ulon;
                            print(login_user.longitude);
                            if let username = snapshot.value["username"] as? String{
                                login_user.user_name = username;
                                print(login_user.user_name);
                                if let major = snapshot.value["Major"] as? String{
                                    login_user.major = major;
                                    print(login_user.major);
                                    if let university = snapshot.value["Education"] as? String{
                                        login_user.university = university;
                                        print(login_user.university);
                                        if let location = snapshot.value["location"] as? String{
                                            login_user.location = location;
                                            print(login_user.location);
                                            if let ProfileName = snapshot.value["Profile_Name"] as? String{
                                                login_user.Profile_Name = ProfileName;
                                                print(login_user.Profile_Name);
                                                if let base64String = snapshot.value["Photo"] as? String{
                                                        login_user.photo = base64String;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            })
        
        
        if(frienduser.useridarray.count == 0){
        //Download all the Friends' emails
        var friend = "https://simpleplus.firebaseio.com/friends/" + login_user.user_name + "_fd";
        let friendemail = Firebase(url:friend)
        
        friendemail.queryOrderedByChild("Email").observeEventType(.Value, withBlock:{friendsnapshot in
            for index in friendsnapshot.children.allObjects as! [FDataSnapshot]{
                if let id = index.value["Email"] as! String?{
                    frienduser.emailarray.append(id);
                    if let id2 = index.value["username"] as! String?{
                    frienduser.useridarray.append(id2);
                        if let id3 = index.value["Profile_Name"] as! String?{
                            frienduser.profilenamearray.append(id3);
                        }
                    }
                }
            }
        })
        }
        
//        if(frienduser.useridarray.count == 0){
//        friendemail.queryOrderedByChild("username").observeEventType(.Value, withBlock:{friendsnapshot in
//            for index in friendsnapshot.children.allObjects as! [FDataSnapshot]{
//                if let id2 = index.value["username"] as! String?{
//                frienduser.useridarray.append(id2);
//                }
//            }
//         })
//        }
//        
//        print(frienduser.useridarray)
//        
//            //Download all the messages timestamps
//            for index in frienduser.useridarray{
//                
//                var friend = "https://simpleplus.firebaseio.com/messages/" + index + login_user.user_name + "msg";
//                var friend1 = "https://simpleplus.firebaseio.com/messages/" + login_user.user_name + index + "msg";
//                
//                let friendtimestamp = Firebase(url:friend)
//                let friendtimestamp1 = Firebase(url:friend1)
//                let last_message = friendtimestamp.queryLimitedToLast(1);
//                let last_message1 = friendtimestamp1.queryLimitedToLast(1);
//                
//                last_message.observeEventType(.ChildAdded) { (snapshot: FDataSnapshot!) in
//                    let lstmessage = snapshot.value["Timestamp"] as! String!
//                    if(lstmessage != ""){
//                        if(!frienduser.timestamparray.contains(lstmessage)){
//                        frienduser.timestamparray.append(lstmessage);
//                        print(frienduser.timestamparray);
//                        }
//                    }
//                }
//                
//                last_message1.observeEventType(.ChildAdded) { (snapshot: FDataSnapshot!) in
//                    let lstmessage1 = snapshot.value["Timestamp"] as! String!
//                    if(lstmessage1 != ""){
//                        if(!frienduser.timestamparray.contains(lstmessage1)){
//                        frienduser.timestamparray.append(lstmessage1);
//                        print(frienduser.timestamparray);
//                        }
//                    }
//                }
//            }
        
//            if(global_observe == 0){
//                global_observe = 1;
//                var timer: NSTimer!
//                var refresher: UIRefreshControl!
//                refresher = UIRefreshControl()
//                refresher.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
//                timer = NSTimer.scheduledTimerWithTimeInterval(3600.0, target: self, selector:"refreshEvery30Secs", userInfo: nil, repeats: true)
//            }
        
    }
    
    
    //To Logout and delete token that is assigned
    @IBAction func Logout(sender: AnyObject) {
        
//        //print(loginUsername.text)
//        let manager = AFHTTPRequestOperationManager()
//        
//        var params = [
//            
//            "username":login.loginid,
//            "password":login.password
//            
//        ]
//        
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject(nil, forKey: "token")
//        //defaults.getObject(for
//        defaults.synchronize()
//        
//        
//        manager.POST("http://localhost:3000/logout",
//            parameters: params,
//            
//            //what is needed for success to execute?
//            success: { (AFHTTPRequestOperation, AnyObject) -> Void in
//                print("successful logout")
//            }) { (AFHTTPRequestOperation, NSError) -> Void in
//                print("fail")
//        }
//        
        let ref = Firebase(url:"https://simpleplus.firebaseio.com")
        ref.unauth();
    
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
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
        self.performSegueWithIdentifier("To_Meet", sender: nil)
    }
    
    func loadtoChat(){
        self.performSegueWithIdentifier("Chat", sender: nil)
    }
    
    func refreshEvery30Secs(){
        //observe()
    }
    
    func refreshEvery3600Secs(){
        send_reminder()
    }
    
    func refresh(sender: AnyObject){
        refreshEvery30Secs() // calls when ever button is pressed
        refreshEvery3600Secs()
    }
    
    //Function to observe the information
//    func observe() {
//        
//        for index in frienduser.useridarray{
//        self.indication = 0;
//        var friend = "https://simpleplus.firebaseio.com/messages/" + login_user.user_name + index + "msg";
//        var friend2 = "https://simpleplus.firebaseio.com/messages/" + index + login_user.user_name +  "msg";
//        let friendmessageaccess = Firebase(url:friend)
//        let friendmessageaccess2 = Firebase(url:friend2)
//        
//        let last_message = friendmessageaccess.queryLimitedToLast(1);
//        let last_message2 = friendmessageaccess2.queryLimitedToLast(1);
//        
//        last_message.observeEventType(.ChildAdded) { (snapshot: FDataSnapshot!) in
//            self.timestamp = snapshot.value["Timestamp"] as! String
//            self.id = snapshot.value["senderId"] as! String
//            
//            if(self.timestamp != ""){
//            self.indication = 1;
//                print(self.indication);
//                if(self.timestamp != "" && frienduser.timestamparray.contains(self.timestamp) && self.id != "" && self.id != login_user.user_name && !frienduser.timestamparray.isEmpty && self.indication == 1){
//                    let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
//                    UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
//                    let notification = UILocalNotification()
//                    notification.fireDate = NSDate(timeIntervalSinceNow: 1)
//                    notification.alertBody = "Reply Message to " + self.id
//                    notification.alertAction = "Read Message!"
//                    notification.soundName = UILocalNotificationDefaultSoundName
//                    notification.userInfo = ["CustomField1": "w00t"]
//                    UIApplication.sharedApplication().scheduleLocalNotification(notification)
//                }
//            }
//            
//        }
//            
//        last_message2.observeEventType(.ChildAdded) { (snapshot: FDataSnapshot!) in
//            self.timestamp1 = snapshot.value["Timestamp"] as! String
//            self.id1 = snapshot.value["senderId"] as! String
//            
//            if(self.timestamp1 != ""){
//            self.indication = 1;
//            print(self.indication);
//            if(self.timestamp1 != "" && frienduser.timestamparray.contains(self.timestamp1) && self.id1 != "" && self.id1 != login_user.user_name && !frienduser.timestamparray.isEmpty && self.indication == 1){
//                let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
//                UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
//                let notification = UILocalNotification()
//                notification.fireDate = NSDate(timeIntervalSinceNow: 1)
//                notification.alertBody = "Reply Message to " + self.id1
//                notification.alertAction = "Read Message!"
//                notification.soundName = UILocalNotificationDefaultSoundName
//                notification.userInfo = ["CustomField1": "w00t"]
//                UIApplication.sharedApplication().scheduleLocalNotification(notification)
//              }
//            }
//          }
//        }
//    }
    
    func send_reminder(){
            let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
            UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
            let notification = UILocalNotification()
            notification.fireDate = NSDate(timeIntervalSinceNow: 1)
            notification.alertBody = "Time to Check Your Friend's messages!"
            notification.alertAction = "Read Message!"
            notification.soundName = UILocalNotificationDefaultSoundName
            notification.userInfo = ["CustomField1": "w00t"]
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
};
