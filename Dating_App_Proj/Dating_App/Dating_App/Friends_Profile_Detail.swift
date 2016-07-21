//
//  Friends_Profile_Detail.swift
//  Simple
//
//  Created by Clement Chan on 6/26/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Friends_Profile_View : UIViewController{

    
    @IBOutlet weak var Bkground_Image: UIImageView!
    @IBOutlet weak var User_ID: UILabel!
    @IBOutlet weak var Time_Greetings: UILabel!
    @IBOutlet weak var Profile_Pic: UIImageView!
    @IBOutlet weak var Profile_Name: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var University: UILabel!
    @IBOutlet weak var Major: UILabel!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.endEditing(true)
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
            self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
            self.User_ID.textColor = UIColor.whiteColor();
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
        }
        
        self.Profile_Pic.image = friend_profile.Photo;
        self.Profile_Pic.contentMode = .ScaleAspectFit
        self.Profile_Name.text = "Name: " + friend_profile.Profile_Name!
        self.Profile_Name.sizeToFit()
        self.Profile_Name.adjustsFontSizeToFitWidth = true
        self.Location.text = "Location: " + friend_profile.Location!
        self.Location.sizeToFit()
        self.Location.adjustsFontSizeToFitWidth = true
        self.University.text = "University: " + friend_profile.University!
        self.University.sizeToFit()
        self.University.adjustsFontSizeToFitWidth = true
        self.Major.text = "Major: " + friend_profile.Major!
        self.Major.sizeToFit()
        self.Major.adjustsFontSizeToFitWidth = true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
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
        self.performSegueWithIdentifier("AnswerQuestion", sender: nil)
    }

};