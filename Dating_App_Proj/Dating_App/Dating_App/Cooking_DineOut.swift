//
//  Cooking_DineOut.swift
//  Simple
//
//  Created by Clement Chan on 9/30/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation

import UIKit

class Cooking_DineOut: UIViewController{
    
    override func viewDidLoad() {
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(Cooking_DineOut.CookingDineoutSwipe(_:))))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(Cooking_DineOut.CookingDineoutSwipe(_:))))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func CookingDineoutSwipe(_ sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .right){
            register_info.Cooking_Dineout = "Dine_Out"
            loadDestinationVC()
            print(register_info.Cooking_Dineout)
        }
        else if(sender.direction == .left){
            register_info.Cooking_Dineout = "Cooking_Home"
            loadDestinationVC()
            print(register_info.Cooking_Dineout)
        }
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Profile_Upload", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}
