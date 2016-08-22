//
//  Todolist.swift
//  Simple
//
//  Created by Clement Chan on 7/26/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
class Todolist: UIViewController{
    
    @IBAction func ChillButton(sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
            
            let random = arc4random_uniform(9);
            
            if(random == 0){
                if let url = NSURL(string: "http://www.10best.com/destinations/") {
                UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 1){
                if let url = NSURL(string: "http://www.rownyc.com/blog/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 2){
                if let url = NSURL(string: "http://www.10best.com/destinations/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 3){
                if let url = NSURL(string: "http://www.eggcanvas.me/nyc-guide/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 4){
                if let url = NSURL(string: "http://www.fodors.com/world/north-america/usa/new-york/new-york-city/neighborhoods") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 5){
                if let url = NSURL(string: "https://www.eventbrite.com/d/ny--new-york/parties") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 6){
                if let url = NSURL(string: "https://www.eventbrite.com/d/ny--brooklyn/events") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 7){
                if let url = NSURL(string: "https://www.timeout.com/newyork/brooklyn") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 8){
                if let url = NSURL(string: "https://pulsd.com/new-york") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            
            
            
        }
        
        //Hong Kong
        if(login_user.latitude >= 22.2 && login_user.latitude <= 22.5 &&
            login_user.longitude <= 114.2 && login_user.longitude > 114.1){
            
            let random = arc4random_uniform(5);
            
            if(random == 0){
                if let url = NSURL(string: "http://www.discoverhongkong.com/us/index.jsp") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 1){
                if let url = NSURL(string: "http://travel.qunar.com/p-cs300027-xianggang-jingdian") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 2){
                if let url = NSURL(string: "http://www.discoverhongkong.com/tc/see-do/highlight-attractions/index.jsp") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 3){
                if let url = NSURL(string: "http://www.tommyooi.com/hongkong-attractions/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 4){
                if let url = NSURL(string: "http://www.discoverhongkong.com/us/see-do/highlight-attractions/top-10/index.jsp") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
        }
        
        
        
        
    }
    
    @IBAction func MovieButton(sender: AnyObject) {
        
        let random = arc4random_uniform(5);
        
        if(random == 0){
            if let url = NSURL(string: "http://www.movie-blogger.com") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if(random == 1){
            if let url = NSURL(string: "http://www.rogerebert.com") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if(random == 2){
            if let url = NSURL(string: "http://www.themovieblog.com/category/features/reviews/") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if(random == 3){
            if let url = NSURL(string: "http://www.themovieblog.com/category/trailers/") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if(random == 4){
            if let url = NSURL(string: "http://www.rollingstone.com/movies/reviews") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        
    }
    
    
    @IBAction func EatButton(sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
        
        let random = arc4random_uniform(2);
        if(random == 0){
            if let url = NSURL(string: "http://ny.eater.com/maps/best-new-new-york-restaurants-heatmap") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if(random == 1){
            if let url = NSURL(string: "http://www.timeout.com/newyork/restaurants") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        }
    }
    
    
    @IBAction func SummerButton(sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
            
            let random = arc4random_uniform(2);
            if(random == 0){
                if let url = NSURL(string: "http://www.nycinsiderguide.com/things-to-do-in-new-york-in-summer.html#.V5nmD1cydFI") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 1){
                if let url = NSURL(string: "http://www.nycgo.com/articles/summer-guide-2016-slideshow") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
        }
        
        //Hong Kong
        if(login_user.latitude >= 22.2 && login_user.latitude <= 22.5 &&
            login_user.longitude <= 114.2 && login_user.longitude > 114.1){
            
            let random = arc4random_uniform(1);
            
            if(random == 0){
                if let url = NSURL(string: "http://www.fodors.com/world/asia/china/hong-kong/experiences/news/photos/15-incredible-rooftop-bars-in-hong-kong") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
        }
        
    }
    
    @IBAction func HikingButton(sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
            
            let random = arc4random_uniform(1);
            if(random == 0){
                if let url = NSURL(string: "https://www.trails.com") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            
        }
    }
    
    @IBAction func Rooftop(sender: AnyObject) {
        
        //New York
        if(login_user.latitude >= 40 && login_user.latitude <= 41 &&
            login_user.longitude <= -73.5 && login_user.longitude > -74.5){
            
            let random = arc4random_uniform(4);
            if(random == 0){
                if let url = NSURL(string: "http://www.timeout.com/newyork/bars/rooftop-bars-in-nyc") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 1){
                if let url = NSURL(string: "http://gothamist.com/2016/04/27/best_rooftop_bars_nyc.php") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 2){
                if let url = NSURL(string: "http://www.amny.com/eat-and-drink/nyc-rooftop-bars-and-restaurants-to-visit-now-1.10394553") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 3){
                if let url = NSURL(string: "http://www.cntraveler.com/galleries/2016-06-08/10-best-rooftop-bars-in-new-york-city/4") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            
        }
        
        //Hong Kong
        if(login_user.latitude >= 22.2 && login_user.latitude <= 22.5 &&
            login_user.longitude <= 114.2 && login_user.longitude > 114.1){
            
            let random = arc4random_uniform(1);
            
            if(random == 0){
                if let url = NSURL(string: "http://punchdrink.com/articles/the-best-bars-with-a-view-in-hong-kong/") {
                    UIApplication.sharedApplication().openURL(url)
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
        self.performSegueWithIdentifier("LoadProfile", sender: nil)
    }
    
}

