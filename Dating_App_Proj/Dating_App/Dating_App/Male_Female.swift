//
//  Male_Female.swift
//  Simple
//
//  Created by Clement Chan on 7/26/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation

import UIKit

class Male_Female: UIViewController{
    
    override func viewDidLoad() {
    
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(Male_Female.handleSwipes(_:))))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(Male_Female.handleSwipes(_:))))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipes(_ sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .right){
        register_info.Gender = "Female"
        loadDestinationVC()
        print(register_info.Gender)
        }
        else if(sender.direction == .left){
        register_info.Gender = "Male"
        loadDestinationVC()
        print(register_info.Gender)
        }
    }

    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Ethnicity", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}
