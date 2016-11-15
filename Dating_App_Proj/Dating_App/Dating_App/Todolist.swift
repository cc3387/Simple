//
//  Todolist.swift
//  Simple
//
//  Created by Clement Chan on 7/26/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class Todolist: UIViewController{
    
    @IBAction func ChillButton(_ sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
            
            let random = arc4random_uniform(9);
            
            if(random == 0){
                if let url = NSURL(string: "http://www.10best.com/destinations/") {
                UIApplication.shared.openURL(url as URL)
                }
            }
            else if(random == 1){
                if let url = URL(string: "http://www.rownyc.com/blog/") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 2){
                if let url = URL(string: "http://www.10best.com/destinations/") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 3){
                if let url = URL(string: "http://www.eggcanvas.me/nyc-guide/") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 4){
                if let url = URL(string: "http://www.fodors.com/world/north-america/usa/new-york/new-york-city/neighborhoods") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 5){
                if let url = URL(string: "https://www.eventbrite.com/d/ny--new-york/parties") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 6){
                if let url = URL(string: "https://www.eventbrite.com/d/ny--brooklyn/events") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 7){
                if let url = URL(string: "https://www.timeout.com/newyork/brooklyn") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 8){
                if let url = URL(string: "https://pulsd.com/new-york") {
                    UIApplication.shared.openURL(url)
                }
            }
            
            
            
        }
        
        //Hong Kong
        if(login_user.latitude >= 22.2 && login_user.latitude <= 22.5 &&
            login_user.longitude <= 114.2 && login_user.longitude > 114.1){
            
            let random = arc4random_uniform(5);
            
            if(random == 0){
                if let url = URL(string: "http://www.discoverhongkong.com/us/index.jsp") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 1){
                if let url = URL(string: "http://travel.qunar.com/p-cs300027-xianggang-jingdian") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 2){
                if let url = URL(string: "http://www.discoverhongkong.com/tc/see-do/highlight-attractions/index.jsp") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 3){
                if let url = URL(string: "http://www.tommyooi.com/hongkong-attractions/") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 4){
                if let url = URL(string: "http://www.discoverhongkong.com/us/see-do/highlight-attractions/top-10/index.jsp") {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        
        
        
        
    }
    
    @IBAction func MovieButton(_ sender: AnyObject) {
        
        let random = arc4random_uniform(5);
        
        if(random == 0){
            if let url = URL(string: "http://www.movie-blogger.com") {
                UIApplication.shared.openURL(url)
            }
        }
        else if(random == 1){
            if let url = URL(string: "http://www.rogerebert.com") {
                UIApplication.shared.openURL(url)
            }
        }
        else if(random == 2){
            if let url = URL(string: "http://www.themovieblog.com/category/features/reviews/") {
                UIApplication.shared.openURL(url)
            }
        }
        else if(random == 3){
            if let url = URL(string: "http://www.themovieblog.com/category/trailers/") {
                UIApplication.shared.openURL(url)
            }
        }
        else if(random == 4){
            if let url = URL(string: "http://www.rollingstone.com/movies/reviews") {
                UIApplication.shared.openURL(url)
            }
        }
        
    }
    
    
    @IBAction func EatButton(_ sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
        
        let random = arc4random_uniform(3);
        
        if(random == 0){
            if let url = URL(string: "http://ny.eater.com/maps/best-new-new-york-restaurants-heatmap") {
                UIApplication.shared.openURL(url)
            }
        }
        else if(random == 1){
            if let url = URL(string: "http://www.timeout.com/newyork/restaurants") {
                UIApplication.shared.openURL(url)
            }
        }
        else if(random == 2){
            if let url = URL(string: "https://www.thrillist.com/eat/new-york") {
                UIApplication.shared.openURL(url)
            }
        }
        }
        
        //Hong Kong
        if(login_user.latitude >= 22.2 && login_user.latitude <= 22.5 &&
            login_user.longitude <= 114.2 && login_user.longitude > 114.1){
            
            let random = arc4random_uniform(3);
            
            if(random == 0){
                if let url = URL(string: "http://www.tommyooi.com/must-eat-food-in-hong-kong/") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 1){
                if let url = URL(string: "http://goingawesomeplaces.com/the-top-20-hk-restaurant-eat-list/") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 2){
                if let url = URL(string: "http://www.thatfoodcray.com/that-restaurant-cray-where-to-eat-in-hong-kong/") {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    
    @IBAction func SummerButton(_ sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
            
            let random = arc4random_uniform(2);
            if(random == 0){
                if let url = URL(string: "http://www.nycinsiderguide.com/things-to-do-in-new-york-in-summer.html#.V5nmD1cydFI") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 1){
                if let url = URL(string: "http://www.nycgo.com/articles/summer-guide-2016-slideshow") {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        
        //Hong Kong
        if(login_user.latitude >= 22.2 && login_user.latitude <= 22.5 &&
            login_user.longitude <= 114.2 && login_user.longitude > 114.1){
            
            let random = arc4random_uniform(1);
            
            if(random == 0){
                if let url = URL(string: "http://www.fodors.com/world/asia/china/hong-kong/experiences/news/photos/15-incredible-rooftop-bars-in-hong-kong") {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        
    }
    
    @IBAction func HikingButton(_ sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
            
            let random = arc4random_uniform(1);
            if(random == 0){
                if let url = URL(string: "https://www.trails.com") {
                    UIApplication.shared.openURL(url)
                }
            }
            
        }
    }
    
    @IBAction func Rooftop(_ sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
            
            let random = arc4random_uniform(4);
            if(random == 0){
                if let url = URL(string: "http://www.timeout.com/newyork/bars/rooftop-bars-in-nyc") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 1){
                if let url = URL(string: "http://gothamist.com/2016/04/27/best_rooftop_bars_nyc.php") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 2){
                if let url = URL(string: "http://www.amny.com/eat-and-drink/nyc-rooftop-bars-and-restaurants-to-visit-now-1.10394553") {
                    UIApplication.shared.openURL(url)
                }
            }
            else if(random == 3){
                if let url = URL(string: "http://www.cntraveler.com/galleries/2016-06-08/10-best-rooftop-bars-in-new-york-city/4") {
                    UIApplication.shared.openURL(url)
                }
            }
            
        }
        
        //Hong Kong
        if(login_user.latitude >= 22.2 && login_user.latitude <= 22.5 &&
            login_user.longitude <= 114.2 && login_user.longitude > 114.1){
            
            let random = arc4random_uniform(1);
            
            if(random == 0){
                if let url = URL(string: "http://punchdrink.com/articles/the-best-bars-with-a-view-in-hong-kong/") {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        
    }
    
    //Load destination to the main profile
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "LoadProfile", sender: nil)
    }
    
}

