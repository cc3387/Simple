//
//  Google_Location.swift
//  Simple
//
//  Created by Clement Chan on 8/9/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import UIKit
import Firebase

class Google_ViewController_Update: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var Address: UITextField!
    
    var mapTasks = MapTasks();
    
    @IBAction func Request_From_Text(_ sender: AnyObject) {
        
        let address = self.Address.text;
        
        register_info.address = address!;
        
        self.mapTasks.getLatLngForZip(register_info.address);
        
        let coordinate = CLLocationCoordinate2D(latitude: self.mapTasks.fetchedAddressLatitude, longitude: self.mapTasks.fetchedAddressLongitude)
        
         let NameRef = FIRDatabase.database().reference().child("users").child(login_user.uid);
        
        let location = [
            "longitude": self.mapTasks.fetchedAddressLongitude,
            "latitude": self.mapTasks.fetchedAddressLatitude,
            "Address": register_info.address
        ] as [String : Any];
                
        NameRef.updateChildValues(location as [AnyHashable: Any]);

        
        self.loadDestinationVC();
    }
    
    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Google_ViewController_Update.dismissKeyboard))
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
    
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Update_Main_Page", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}
