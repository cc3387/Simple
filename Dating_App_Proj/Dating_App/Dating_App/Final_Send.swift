//
//  Final_Send.swift
//  Simple
//
//  Created by Clement Chan on 9/4/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class FinalSend_Final: UIViewController{
    
    @IBOutlet weak var userid: UILabel!
    @IBOutlet weak var Profile_Name: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var School: UILabel!
    @IBOutlet weak var Major: UILabel!
    
    
    var ref = FIRDatabase.database().reference()
    //var ref = Firebase(url:"https://simpleplus.firebaseio.com/")
    //var refauto = Firebase(url:"https://simpleplus.firebaseio.com/autologin")
    //var userref = Firebase(url:"https://simpleplus.firebaseio.com/friends/")
    
    @IBAction func ConfirmSend(_ sender: AnyObject) {
        
        let manager = AFHTTPRequestOperationManager();
        
        var loc_lng_int = round(register_info.location_lng);
        var loc_lat_int = round(register_info.location_lat);
        
        var loc_lng: String = String(format:"%f",register_info.location_lng);
        var loc_lat:String = String(format:"%f",register_info.location_lat);
        
        //var loc_lng: String = String(format:"%f",loc_lng_int);
        //var loc_lat:String = String(format:"%f",loc_lat_int);
        
        let refauto = self.ref.child("autologin")
        let userref = self.ref.child("friends")
    
        let profile = [
            //"title": register_info.user_id,
            "username": register_info.username,
            "password": register_info.password,
            //"user_id": register_info.user_id,
            "Profile_Name": register_info.Profile_name,
            "Age_Range": register_info.age_range,
            "location": register_info.location,
            "Gender": register_info.Gender,
            "Ethnicity": register_info.Ethnicity,
            "longitude": register_info.location_lng,
            "latitude": register_info.location_lat,
            "Education":register_info.education,
            "Major":register_info.Major,
            "Address": register_info.address,
            "Qone": register_info.beer_or_wine,	
            "Qtwo": register_info.sports_or_art,
            "Qthree": register_info.Cooking_Dineout,
            "University_Rank": register_info.URank,
            "Email": register_info.email,
            "Photo": register_info.Photo,
            "uid": register_info.uid,
            "phoneid": register_info.phoneid
        ] as [String : Any];
        
        let friend = [
            "username" : register_info.username,
            "location" : register_info.location,
            "Education": register_info.education,
            "Major": register_info.Major,
            "Email": register_info.email,
            "uid": register_info.uid,
            "phoneid": register_info.phoneid
        ] as [String : Any];
        
        let autologin = [
            "username": register_info.email,
            "password": register_info.password,
            "phoneid" : register_info.phoneid
        ] as [String : Any];
        
        let phonelogin = register_info.phoneid
        let phoneloginfinal = (phonelogin as String) + "login"
        
        let usersRef = ref.child(byAppendingPath: "users");
        let usernamefriend = register_info.uid as String + "_fd";
        usersRef.child(byAppendingPath: register_info.uid as String).setValue(profile);
        let userfd = userref.child(byAppendingPath: usernamefriend);
        userfd.child(byAppendingPath: register_info.uid as String).setValue(friend);
        refauto.child(byAppendingPath: phoneloginfinal).setValue(autologin);
        login.registered = 1;
        loadDestinationVC();
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        self.userid.text = register_info.user_id
        self.City.text = register_info.location
        self.Gender.text = register_info.Gender
        self.School.text = register_info.education
        self.Major.text = register_info.Major
        self.Profile_Name.text = register_info.Profile_name
        self.userid.adjustsFontSizeToFitWidth = true
        self.City.adjustsFontSizeToFitWidth = true
        self.Gender.adjustsFontSizeToFitWidth = true
        self.School.adjustsFontSizeToFitWidth = true
        self.Major.adjustsFontSizeToFitWidth = true
        self.Profile_Name.adjustsFontSizeToFitWidth = true
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Start", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}

