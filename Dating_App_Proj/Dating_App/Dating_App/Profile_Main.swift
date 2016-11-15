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
import Batch

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
    var count:Int = 0;
    
    //Getting Profile name from the server
    @IBOutlet weak var Profile_Name: UILabel!
    
    
    @IBAction func ProfileLoad(_ sender: AnyObject) {
        if(login_user.user_name != ""){
        loadusermeet()
        }
    }
    
    @IBAction func Single_Meet(_ sender: AnyObject) {
        if(login_user.user_name != ""){
        loadDestinationVC();
        }
    }
    
    @IBAction func To_Chat(_ sender: AnyObject) {
        if(login_user.user_name != ""){
        loadtoChat();
        }
    }
    
    @IBAction func To_Choice(_ sender: AnyObject) {
        if(login_user.user_name != ""){
        loadchoice()
        }
    }
    
    @IBAction func ToUpdate(_ sender: AnyObject) {
        if(login_user.user_name != ""){
        loadupdateprofile()
        }
    }
    
    @IBAction func ToContactUs(_ sender: AnyObject) {
        if(login_user.user_name != ""){
        loadcontactus()
        }
    }
    
    
    @IBAction func ToTermsandConditions(_ sender: AnyObject) {
        if(login_user.user_name != ""){
        loadtermsandcondition()
        }
    }
 
    //Getting the login_user id that is collected from the login page
    var loginuser: String = "";
    var user1: String = "";
    
    @IBOutlet var Profile_Pic: UIImageView!
    
    //Action Item
    override func viewDidLoad() {
    super.viewDidLoad()
    self.view.endEditing(true)
    
    //Register for Batch
    let editor = BatchUser.editor();
    editor.setIdentifier(login.chatid);
    editor.save();
        
    Batch.defaultUserProfile()?.customIdentifier = login.chatid
        
    loginid = login.loginid as String
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    frienduser.emailarray.removeAll();
    frienduser.useridarray.removeAll();
    frienduser.phoneidarray.removeAll();
    frienduser.profilenamearray.removeAll();
    frienduser.photoarray.removeAll()

    let hours = hour() as! String!;
    let minutes = minute() as! String!;
    let hour_i = hour_int();
    let minute_i = minute_Int();
        
        if(hour_i > 6 && hour_i < 12){
            
            if(minute_i < 10){
            self.Time_Greetings.text = "Good Morning, the time is " + "\(hours!)" + " : " + "0" + "\(minutes!)";
            }
            else{
            self.Time_Greetings.text = "Good Morning, the time is " + "\(hours!)" + " : " + "\(minutes!)";
            }
            
            let random = arc4random_uniform(3);
            
            self.User_ID.textColor = UIColor.white;
            Time_Greetings.textColor = UIColor.white;
            
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
                self.Time_Greetings.text = "Good Afternoon, the time is " + "\(hours!)" + " : " + "0" + "\(minutes!)";
            }
            else{
                self.Time_Greetings.text = "Good Afternoon, the time is " + "\(hours!)" + " : " + "\(minutes!)";
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
            Time_Greetings.textColor = UIColor.white;
        }
        else{
            
            if(minute_i < 10){
                self.Time_Greetings.text = "Good Evening, the time is " + "\(hours!)" + " : " + "0" + "\(minutes!)";
            }
            else{
                self.Time_Greetings.text = "Good Evening, the time is " + "\(hours!)" + " : " + "\(minutes!)";
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
            self.User_ID.textColor = UIColor.white;
            Time_Greetings.textColor = UIColor.white;
        }
        
        var ref = FIRDatabase.database().reference().child("users")
        ref.queryOrdered(byChild: "Email").queryEqual(toValue: login.loginid)
            .observe(.childAdded, with: { snapshot in
                
                if let source = snapshot.value as? [String:AnyObject] {
                
                login_user.loginname = (source["Profile_Name"] as? String)!
                self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
                self.User_ID.textColor = UIColor.white;
            
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
        
        print(login.chatid)
        
    }
    
    
    //To Logout and delete token that is assigned
    @IBAction func Logoutbutton(_ sender: AnyObject) {
        try! FIRAuth.auth()!.signOut()
        loadoriginal();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    //Functions that will be used to display the time
    func hour() -> String
    {
        //Get Hour
        let date:Date = Date();
        let calendar: Calendar = Calendar.current;
        let hour = calendar.component(.hour, from: date)
        //Return Hour
        return String(hour)
    }
    
    func hour_int() -> Int
    {
        //Get Hour
        let date:Date = Date();
        let calendar: Calendar = Calendar.current;
        let hour = calendar.component(.hour, from: date)
        //Return Hour
        return hour
    }
    
    
    func minute() -> String
    {
        //Get Minute
        let date:Date = Date();
        let calendar: Calendar = Calendar.current;
        let minutes = calendar.component(.minute, from: date)
        //Return Minute
        return String(minutes)
    }
    
    func minute_Int() -> Int
    {
        //Get Minute
        let date:Date = Date();
        let calendar: Calendar = Calendar.current;
        let minutes = calendar.component(.minute, from: date)
        //Return Minute
        return minutes
    }
    
    func loadDestinationVC(){
    self.performSegue(withIdentifier: "To_Meet", sender: nil)
    }
    
    func loadtoChat(){
    self.performSegue(withIdentifier: "Chat", sender: nil)
    }
    
    func loadusermeet(){
        self.performSegue(withIdentifier: "Touserprofile", sender: nil)
    }
    
    func loadchoice(){
        self.performSegue(withIdentifier: "ToChoice", sender: nil)
    }
    
    
    func loadupdateprofile(){
        self.performSegue(withIdentifier: "ToUpdateProfile", sender: nil)
    }
    
    func loadcontactus(){
        self.performSegue(withIdentifier: "Tocontactus", sender: nil)
    }
    
    func loadtermsandcondition(){
        self.performSegue(withIdentifier: "totermsandconditions", sender: nil)
    }
    
    func refreshEvery30Secs(){
        //observe()
    }
    
    func refreshEvery3600Secs(){
        send_reminder()
    }
    
    func refresh(_ sender: AnyObject){
        refreshEvery30Secs() // calls when ever button is pressed
        refreshEvery3600Secs()
    }
    
    func loadoriginal(){
        self.performSegue(withIdentifier: "original", sender: nil)
    }
    
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    
    func send_reminder(){
            let notificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(notificationSettings)
            let notification = UILocalNotification()
            notification.fireDate = Date(timeIntervalSinceNow: 1)
            notification.alertBody = "Time to Check Your Friend's messages!"
            notification.alertAction = "Read Message!"
            notification.soundName = UILocalNotificationDefaultSoundName
            notification.userInfo = ["CustomField1": "w00t"]
            UIApplication.shared.scheduleLocalNotification(notification)
    }
};
