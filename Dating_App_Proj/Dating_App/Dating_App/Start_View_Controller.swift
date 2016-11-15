//
//  Start_View_Controller.swift
//  Simple
//
//  Created by Clement Chan on 10/8/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation
import UIKit

class startViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: "token") //as? String
        //println("yay");
        print(token)
        
        if(token == nil) {
            //go to the login screen
            //println(token)
            self.performSegue(withIdentifier: "goToLogin", sender: self)
            
        } else {
            //go to the accountview
            //token = token as! String
            print(token)
            print("hi")
            self.performSegue(withIdentifier: "goToAccount", sender: self)
            
        }
        // call something to the server
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
