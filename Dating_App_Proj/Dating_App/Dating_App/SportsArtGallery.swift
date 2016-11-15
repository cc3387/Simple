//
//  EDC_Classical.swift
//  Simple
//
//  Created by Clement Chan on 9/4/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation

import UIKit

class SportsArtGallery: UIViewController{
    
    override func viewDidLoad() {
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(SportsArtGallery.SportArtSwipes(_:))))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(SportsArtGallery.SportArtSwipes(_:))))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func SportArtSwipes(_ sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .right){
            register_info.sports_or_art = "Art_Gallery"
            loadDestinationVC()
            print(register_info.sports_or_art)
        }
        else if(sender.direction == .left){
            register_info.sports_or_art = "Sports_Event"
            loadDestinationVC()
            print(register_info.sports_or_art)
        }
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "EDC_Classical", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}
