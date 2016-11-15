//
//  Location.swift
//  Simple
//
//  Created by Clement Chan on 8/9/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import UIKit

class MapTasks: NSObject {
    
    let baseURLGeocode = "https://maps.googleapis.com/maps/api/geocode/json?"
    var lookupAddressResults: Dictionary<NSObject, AnyObject>!
    var fetchedFormattedAddress: String!
    var fetchedAddressLongitude: Double!
    var fetchedAddressLatitude: Double!
    let baseURLDirections = "https://maps.googleapis.com/maps/api/directions/json?"
    var selectedRoute: Dictionary<NSObject, AnyObject>!
    var overviewPolyline: Dictionary<NSObject, AnyObject>!
    var originCoordinate: CLLocationCoordinate2D!
    var destinationCoordinate: CLLocationCoordinate2D!
    var originAddress: String!
    var destinationAddress: String!
    var totalDistanceInMeters: UInt = 0
    var totalDistance: String!
    var totalDurationInSeconds: UInt = 0
    var totalDuration: String!
    let apikey = "AIzaSyCDpeX5sgpfZFhhXyzCcU57drXp--q6PBw"
    
    override init() {
        super.init()
    }
    
    
    func getLatLngForZip(_ loc: String) {
        let geocoding = self.baseURLGeocode + "address=" + loc + "&key=" + self.apikey
        let urlStr : NSString = geocoding.addingPercentEscapes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as NSString
        let searchURL = NSURL(string: urlStr as String)
        
        let data = try? Data(contentsOf: searchURL as! URL)
        let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        if let result = json["results"] as? [AnyObject] {
            if let geometry = result[0]["geometry"] as? NSDictionary {
                if let location = geometry["location"] as? NSDictionary {
                    self.fetchedAddressLatitude = location["lat"] as! Double
                    self.fetchedAddressLongitude = location["lng"] as! Double
                }
            }
        }
    }
    
}
