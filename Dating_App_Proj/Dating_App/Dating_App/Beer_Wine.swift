//
//  Beer_Wine.swift
//  Simple
//
//  Created by Clement Chan on 9/4/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation

import UIKit

class BeerWine: UIViewController{
    
    override func viewDidLoad() {
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(BeerWine.BeerWineSwipes(_:))))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(BeerWine.BeerWineSwipes(_:))))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func BeerWineSwipes(_ sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .right){
            register_info.beer_or_wine = "Wine"
            print(register_info.beer_or_wine)
            loadDestinationVC()
           
        }
        else if(sender.direction == .left){
            register_info.beer_or_wine = "Beer"
            print(register_info.beer_or_wine)
            loadDestinationVC()
        }
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "SportsArt", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}
