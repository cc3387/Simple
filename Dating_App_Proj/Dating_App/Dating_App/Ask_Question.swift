//
//  Ask_Question.swift
//  Simple
//
//  Created by Clement Chan on 7/7/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation

import UIKit

class Ask_Questions: UIViewController{
    
    override func viewDidLoad() {
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: ("BeerWineSwipes:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: ("BeerWineSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func BeerWineSwipes(sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .Right){
            register_info.beer_or_wine = "Wine"
            print(register_info.beer_or_wine)
            loadDestinationVC()
            
        }
        else if(sender.direction == .Left){
            register_info.beer_or_wine = "Beer"
            print(register_info.beer_or_wine)
            loadDestinationVC()
        }
    }
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("Ask_Main", sender: nil)
    }
    
}
