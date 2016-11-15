//
//  EDCClassical.swift
//  Simple
//
//  Created by Clement Chan on 9/19/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation

import UIKit

class EDCClassical: UIViewController{
    
    override func viewDidLoad() {
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(EDCClassical.EDCClassicalSwipe(_:))))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(EDCClassical.EDCClassicalSwipe(_:))))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func EDCClassicalSwipe(_ sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .right){
            register_info.EDC_or_Classic = "Classical"
            loadDestinationVC()
            print(register_info.EDC_or_Classic)
        }
        else if(sender.direction == .left){
            register_info.EDC_or_Classic = "EDC"
            loadDestinationVC()
            print(register_info.EDC_or_Classic)
        }
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Cooking", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}
