//
//  ViewControllerLogin.swift
//  Dating_App
//
//  Created by Clement Chan on 7/8/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import UIKit
import Firebase
import Batch

class ViewControllerRegister: UIViewController, UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate{
    
    //TextField Outlet
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Sender: UIButton!
    @IBOutlet weak var User_Note: UILabel!
    @IBOutlet weak var Password_Not: UILabel!
    @IBOutlet weak var Email_Not: UILabel!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var Location: UITextField!
    @IBOutlet weak var Age_Not: UILabel!
    @IBOutlet weak var Location_Not: UILabel!
    @IBOutlet weak var userexist: UILabel!
    
    //PickerView
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var LocPicker: UIPickerView!
    
    //Define User class for the later use
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        myPicker.delegate = self;
        myPicker.dataSource = self;
        //LocPicker.delegate = self;
        //LocPicker.dataSource = self;
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewControllerRegister.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        if(BatchPush.lastKnownPushToken() != nil){
        register_info.phoneid = BatchPush.lastKnownPushToken() as NSString
        }
        else{
        register_info.phoneid = "xxxxxxxxxxxx"
        }
            
        print(register_info.phoneid)
        updateAge();
        
        if(login.registered == 1){
            self.Username.isEnabled = false;
            self.Password.isEnabled = false;
            self.Email.isEnabled = false;
            self.Age.isEnabled = false;
            self.Location.isEnabled = false;
            self.Sender.isEnabled = false;
        }
    }

    //Register Button Click
    @IBAction func Register(_ sender: AnyObject) {
        if(self.Username.text == ""){
        self.User_Note.textColor = UIColor.red;
        }
        else if (self.Username.text != "" && self.Password.text == ""){
        self.User_Note.textColor = UIColor.clear;
        self.Password_Not.textColor = UIColor.red;
        }
        else if(self.Username.text != "" && self.Password.text != "" && self.Email.text == ""){
        self.User_Note.textColor = UIColor.clear;
        self.Password_Not.textColor = UIColor.clear;
        self.Email_Not.textColor = UIColor.red;
        }
        else if(self.Username.text != "" && self.Password.text != "" && self.Email.text != "" && self.Age.text == "" && self.Location.text == ""){
        self.User_Note.textColor = UIColor.clear;
        self.Password_Not.textColor = UIColor.clear;
        self.Email_Not.textColor = UIColor.clear;
        self.Age_Not.textColor = UIColor.red;
        self.Location_Not.textColor = UIColor.clear;
        }
        else if(self.Username.text != "" && self.Password.text != "" && self.Email.text != "" && self.Age.text != "" && self.Location.text == ""){
        self.User_Note.textColor = UIColor.clear;
        self.Password_Not.textColor = UIColor.clear;
        self.Email_Not.textColor = UIColor.clear;
        self.Age_Not.textColor = UIColor.clear;
        self.Location_Not.textColor = UIColor.red;
        }
        
        if(self.Username.text != "" && self.Password.text != "" && self.Email.text != "" && self.Age.text != "" && self.Location.text != "" ){
        self.User_Note.textColor = UIColor.clear;
        self.Password_Not.textColor = UIColor.clear;
        self.Email_Not.textColor = UIColor.clear;
        self.Age_Not.textColor = UIColor.clear;
        self.Location_Not.textColor = UIColor.clear;
            
            
        //When send button is tappe
        self.Username.endEditing(true);
        self.Password.endEditing(true);
        self.Email.endEditing(true);
        self.Age.endEditing(true);
        self.Location.endEditing(true);
        
        
        //Passing info to Firebase
        register_info.user_id = self.Username.text!;
        register_info.username = self.Username.text!;
        register_info.password = self.Password.text!;
        register_info.age_range = self.Age.text!;
        register_info.Profile_name = self.Location.text!;
        register_info.email = self.Email.text!;
        
            
          //New Firebase Version
          FIRAuth.auth()?.createUser(withEmail: register_info.email, password: register_info.password) { (user, error) in
            
            if error != nil {
            // There was an error creating the account
            print("There was an error in creating")
            } else {
            let uid = user?.uid
            register_info.uid = uid! as NSString;
            print("Successfully created user account with uid: \(uid)")
            }
           
           }

            //Disable the button and end field
            self.Username.isEnabled = false;
            self.Password.isEnabled = false;
            self.Email.isEnabled = false;
            self.Age.isEnabled = false;
            self.Location.isEnabled = false;
            self.Sender.isEnabled = false;
            self.Username.text = "";
            self.Password.text = "";
            self.Email.text = "";
            self.Age.text = "";
            self.Location.text = "";
            
            self.loadDestinationVC();
            
        }
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum PickerComponent:Int{
        case age = 0
    }
    
    func updateAge(){
        let sizeComponent = PickerComponent.age.rawValue
        let size = pickerData[sizeComponent][myPicker.selectedRow(inComponent: sizeComponent)]
        self.Age.text = size;
    }
    
    //Picker View, Age Range Functions
    let pickerData = [
        ["18-25","25-30","30-35","35-40", "40-45"]
    ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count ;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateAge();
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[component][row];
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Location_Picker", sender: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView!) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.white
        pickerLabel.text = pickerData[component][row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "System Thin", size: 10) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
}

