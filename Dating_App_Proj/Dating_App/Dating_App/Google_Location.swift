//
//  Google_Location.swift
//  Simple
//
//  Created by Clement Chan on 8/9/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

class Google_ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var Address: UITextField!
    
    var mapTasks = MapTasks();
    
    
    @IBAction func Request_From_Text(_ sender: AnyObject) {
        
//            let locManager = CLLocationManager()
//            locManager.requestWhenInUseAuthorization()
//
//            var currentLocation = CLLocation()
//        
//            if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
//            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Authorized){
//            currentLocation = locManager.location!
//            register_info.location_lat = currentLocation.coordinate.longitude
//            register_info.location_lng = currentLocation.coordinate.latitude
//            
//            print(currentLocation.coordinate.longitude)
//            print(currentLocation.coordinate.latitude)
//        
//            }

/////////////////////////////////////////////////////////////////////////////////
        
        let address:String = self.Address.text!;
        
        register_info.address = address;
        print(address)
        self.mapTasks.getLatLngForZip(register_info.address);
            
        _ = CLLocationCoordinate2D(latitude: self.mapTasks.fetchedAddressLatitude, longitude: self.mapTasks.fetchedAddressLongitude)
        register_info.location_lat = self.mapTasks.fetchedAddressLatitude;
        register_info.location_lng = self.mapTasks.fetchedAddressLongitude;
        print("The Latitude is:");
        print(register_info.location_lat);
        print("The Longitude is:");
        print(register_info.location_lng);
        
//////////////////////////////////////////////////////////////////////////////////////////
//        self.mapTasks.geocodeAddress(address, withCompletionHandler: { (status, success) -> Void in
//            
//            if !success {
//                print(status)
//                
//                if status == "ZERO_RESULTS" {
//                    print("The location could not be found.")
//                }
//            }
//            else {
//                
//                let coordinate = CLLocationCoordinate2D(latitude: self.mapTasks.fetchedAddressLatitude, longitude: self.mapTasks.fetchedAddressLongitude)
//                register_info.location_lat = self.mapTasks.fetchedAddressLatitude;
//                register_info.location_lng = self.mapTasks.fetchedAddressLongitude;
//                print("The Latitude is:");
//                print(register_info.location_lat);
//                print("The Longitude is:");
//                print(register_info.location_lng);
//                
                /*Sending Location latitude and longitude to the localhost server*/
                
                /*var loc_lng:String = String(format:"%f",register_info.location_lng);
                var loc_lat:String = String(format:"%f",register_info.location_lat);
                
                
                var params = [
                    "longitude": loc_lng,
                    "latitude" : loc_lat
                ];
                
                let manager = AFHTTPRequestOperationManager();
                
                manager.POST("http://localhost:3000/collections/location",
                    parameters: params,
                    success: { (AFHTTPRequestOperation, AnyObject) -> Void in
                        print("success!")
                    }) { (AFHTTPRequestOperation, NSError) -> Void in
                        print("fail")
                }*/
//                
//            }
//            
//        })
//        
        self.loadDestinationVC();
    }
    
    /*@IBAction func Request_Address(sender: AnyObject) {
        
        let addressAlert = UIAlertController(title: "Address Finder", message: "Please type your address:", preferredStyle: UIAlertControllerStyle.Alert)
        
        addressAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Address?"
        }
        
        let findAction = UIAlertAction(title: "Find Address", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            let address = (addressAlert.textFields![0]as! UITextField).text as String
        
            self.mapTasks.geocodeAddress(address, withCompletionHandler: { (status, success) -> Void in
                if !success {
                    print(status)
                    
                    if status == "ZERO_RESULTS" {
                    print("The location could not be found.")
                    }
                }
                else {
                    let coordinate = CLLocationCoordinate2D(latitude: self.mapTasks.fetchedAddressLatitude, longitude: self.mapTasks.fetchedAddressLongitude)
                    register_info.location_lat = self.mapTasks.fetchedAddressLatitude;
                    register_info.location_lng = self.mapTasks.fetchedAddressLongitude;
                    print(register_info.location_lat);
                    print(register_info.location_lng);
                }
            })
            
        }
        /*Sending the latitude and longitude information to the server*/

        /*var params = [
            "longitude": register_info.location_lng,
            "latitude" : register_info.location_lat
        ];
        
        let manager = AFHTTPRequestOperationManager();
        
        manager.POST("http://localhost:3000/clem",
            parameters: params,
            success: { (AFHTTPRequestOperation, AnyObject) -> Void in
                print("success!")
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                print("fail")
        }
        
        let closeAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            
        }
        
        addressAlert.addAction(findAction)
        addressAlert.addAction(closeAction)
        
        presentViewController(addressAlert, animated: true, completion: nil)*/
    }*/
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Google_ViewController.dismissKeyboard))
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
        self.performSegue(withIdentifier: "Gender", sender: nil)
    }
    
    
//    func locationManager(manager: CLLocationManager!, locations: [AnyObject]!)
//    {
//        let latestLocation: AnyObject = locations[locations.count - 1]
//        
//        register_info.location_lat =
//                               latestLocation.coordinate.latitude
//        register_info.location_lng =
//                                latestLocation.coordinate.longitude
//    } 

    
    
    
}
