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
            
            let random = arc4random_uniform(5);
            
            if(random == 0){
                if let url = NSURL(string: "http://www.10best.com/destinations/new-york/new-york/near-me/") {
                UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 1){
                if let url = NSURL(string: "http://www.rownyc.com/blog/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 2){
                if let url = NSURL(string: "http://www.10best.com/destinations/new-york/new-york/near-me/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 3){
                if let url = NSURL(string: "http://www.eggcanvas.me/nyc-guide/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            else if(random == 4){
                if let url = NSURL(string: "http://lovetaza.com/category/nyc-guide-series/") {
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
            if let url = NSURL(string: "http://www.foodandnewyorkcity.com/p/where-to-eat-in-nyc.html") {
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

