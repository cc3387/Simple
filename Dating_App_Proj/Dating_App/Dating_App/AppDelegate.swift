//
//  AppDelegate.swift
//  Dating_App
//
//  Created by Clement Chan on 7/8/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController
import Batch


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITableViewDelegate, UISearchBarDelegate{

    var window: UIWindow?
    
    var myViewController:ViewController?
    
    var loginid = login.loginid
    var password = login.password

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //Include Batch
        Batch.startWithAPIKey("577F39F55EDFB32D2A5AC16A8A3941")
        
        // Register for push notifications
        BatchPush.registerForRemoteNotifications()
        
        //Google Map API
        GMSServices.provideAPIKey("AIzaSyCDpeX5sgpfZFhhXyzCcU57drXp--q6PBw")
        
        //Register for push notifications
        registerForPushNotifications(application)
        
//        var timer: NSTimer!
//        var refresher: UIRefreshControl!
//        refresher = UIRefreshControl()
//        refresher.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
//        timer = NSTimer.scheduledTimerWithTimeInterval(3600.0, target: self, selector:"send_reminder", userInfo: nil, repeats: true)
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
        func autologin(){
            if(loginid != "" && password != ""){
                var ref = Firebase(url:"https://simpleplus.firebaseio.com")
                ref.authUser(loginid, password: password) {
                    error, authData in
                    if error != nil {
                        // an error occured while attempting login
                        print("Login info is wrong");
                    } else {
                        print("Login info is correct");
                    };
                }
                self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
                var storyboard = UIStoryboard(name: "Main", bundle: nil)
                var initialViewController = storyboard.instantiateViewControllerWithIdentifier("Profile_Main") as! UIViewController
                self.window?.rootViewController = initialViewController
//              self.window?.makeKeyAndVisible()
            }
        }
        
        //autologin();
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        var loginid = login.loginid
        var password = login.password
        
//        var timer1: NSTimer!
//        var refresher1: UIRefreshControl!
//        refresher1 = UIRefreshControl()
//        refresher1.addTarget(self, action: "refresh1:", forControlEvents: .ValueChanged)
//        timer = NSTimer.scheduledTimerWithTimeInterval(30.0, target: self, selector:"autologin", userInfo: nil, repeats: true)
        
        func autologin(){
        if(loginid != "" && password != ""){
            var ref = Firebase(url:"https://simpleplus.firebaseio.com")
            ref.authUser(loginid, password: password) {
                error, authData in
                if error != nil {
                    // an error occured while attempting login
                    print("Login info is wrong");
                } else {
                    print("Login info is correct");
                };
            }
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            var initialViewController = storyboard.instantiateViewControllerWithIdentifier("Chatroom") as! UIViewController
            self.window?.rootViewController = initialViewController
//          self.window?.makeKeyAndVisible()
        }
        }
        
        let devDeviceToken = login_user.phoneid
        if let pushClient = BatchClientPush(apiKey: "577F39F55EDFB32D2A5AC16A8A3941", restKey: "a524aa85f96b3bc103188428b026bd5b") {
            
            pushClient.sandbox = false
            pushClient.customPayload = ["aps": ["badge": 0]]
            pushClient.recipients.tokens.append(devDeviceToken)
            pushClient.send { (response, error) in
                if let error = error {
                    print("Something happened while sending the push: \(response) \(error.localizedDescription)")
                } else {
                    print("Push sent \(response)")
                }
            }
        }

        //Calling the function
        autologin();
    }

    func send_reminder(){
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 1)
        notification.alertBody = "Time to Send Your Friend messages!"
        notification.alertAction = "Read Message!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let tokenChars = UnsafePointer<CChar>(deviceToken.bytes)
        var tokenString = ""
        
        for i in 0..<deviceToken.length {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        
        print("Device Token:", tokenString)
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Failed to register:", error)
    }
    
    
    func registerForPushNotifications(application: UIApplication) {
        let notificationSettings = UIUserNotificationSettings(
            forTypes: [.Badge, .Sound, .Alert], categories: nil)
        application.registerUserNotificationSettings(notificationSettings)
    }

}

