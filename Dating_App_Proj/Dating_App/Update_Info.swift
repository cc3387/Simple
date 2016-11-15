//
//  Update_Info.swift
//  Simple
//
//  Created by Clement Chan on 6/26/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Update_Info: UIViewController, UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var GenderChoice: UILabel!
    @IBOutlet weak var PickPreferences: UILabel!
    
    @IBOutlet weak var AgeRangePicker: UIPickerView!
    
    @IBAction func MaleButton(_ sender: AnyObject) {
    self.GenderChoice.text = "Male"
    self.GenderChoice.textColor = UIColor.black
    }
    
    
    @IBAction func FemaleButton(_ sender: AnyObject) {
        self.GenderChoice.text = "Female"
        self.GenderChoice.textColor = UIColor.black
    }
    
    @IBAction func MaleOnly(_ sender: AnyObject) {
        
        self.PickPreferences.text = "Male Only"
        self.PickPreferences.textColor = UIColor.black
    }
    
    @IBAction func FemaleOnly(_ sender: AnyObject) {
        self.PickPreferences.text = "Female Only"
        self.PickPreferences.textColor = UIColor.black
    }
    
    @IBAction func Both(_ sender: AnyObject) {
        self.PickPreferences.text = "Both Gender"
        self.PickPreferences.textColor = UIColor.black
    }
    
    var agerange = "";
    var ref = FIRDatabase.database().reference()
    
    @IBAction func UpdateInfo(_ sender: AnyObject) {
        
        let param = [
        "Profile_Name": login_user.Profile_Name,
        "Gender": self.GenderChoice.text!,
        "Age_Range": self.agerange,
        "FriendsSelectionPref": self.PickPreferences.text!
        ];
        
        
        if(self.GenderChoice.text != "" || self.PickPreferences.text != ""){
        self.ref.child("users").child(login.chatid).updateChildValues(param)
        }
        else if(self.GenderChoice.text == ""){
        self.GenderChoice.text = "Enter Gender!"
        self.GenderChoice.textColor = UIColor.red;
        }
        else if(self.PickPreferences.text == ""){
        self.PickPreferences.text = "Pick Pref!"
        self.PickPreferences.textColor = UIColor.red;
        }
    
        loadDestinationVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        AgeRangePicker.delegate = self;
        AgeRangePicker.dataSource = self;
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Update_Info.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "ProfileUpdate", sender: nil)
    }
    
    
    enum PickerComponent:Int{
        case age = 0
    }
    
    func updateAge(){
        let sizeComponent = PickerComponent.age.rawValue
        let size = pickerData[sizeComponent][AgeRangePicker.selectedRow(inComponent: sizeComponent)]
        self.agerange = size;
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
    
   
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView!) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.white
        pickerLabel.text = pickerData[component][row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "System Thin", size: 12) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }   
}
