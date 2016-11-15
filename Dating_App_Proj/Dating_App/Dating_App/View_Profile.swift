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

class Profile_View : UIViewController{
    
    
    @IBOutlet weak var Bkground_Image: UIImageView!
    
    @IBOutlet weak var User_ID: UILabel!
    @IBOutlet weak var Time_Greetings: UILabel!
    @IBOutlet weak var Profile_Pic: UIImageView!
    @IBOutlet weak var Profile_Name: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var University: UILabel!
    @IBOutlet weak var Major: UILabel!
    
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
            
            Time_Greetings.textColor = UIColor.white;
            Bkground_Image.image = UIImage(named: "Night_Sky_Pond.jpg");
            
            //Setting the User ID to login user id
            self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
            self.User_ID.textColor = UIColor.white;
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
                Bkground_Image.image = UIImage(named: "night_sky.jpg");
            }
            
            if(random == 1){
                Bkground_Image.image = UIImage(named: "night_sky.jpg");
            }
            
            //Setting the User ID to login user id
            self.User_ID.text = "Welcome to Simple, " + login_user.loginname;
            self.User_ID.textColor = UIColor.white;
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
            self.User_ID.textColor = UIColor.white;
        }
        
        
        let decodedData = Data(base64Encoded: login_user.photo, options: Data.Base64DecodingOptions())
        let decodedImage = UIImage(data: decodedData!)!
        self.Profile_Pic.image = decodedImage
        login.Photo = decodedImage
        self.Profile_Pic.contentMode = .scaleAspectFit
        self.Profile_Name.text = "Profile Name : " + login_user.Profile_Name
        self.Location.text = "Location : " + login_user.location
        self.University.text = "University : " + login_user.university
        self.Major.text = "Major : " + login_user.major
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

    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    
};
