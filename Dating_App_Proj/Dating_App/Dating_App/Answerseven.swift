//
//  Answerseven.swift
//  Simple
//
//  Created by Clement Chan on 7/21/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Ansseven: UIViewController{
    
    var Answer1: String = "";
    var Answer2: String = "";
    var Question: String = "";
    var chatid: String = "";
    var count: Int = 0;
    
    @IBOutlet weak var questionlabel: UILabel!
    
    @IBOutlet weak var answeronelabel: UILabel!
    
    @IBOutlet weak var answertwolabel: UILabel!
    
    let ref = Firebase(url:"https://simpleplus.firebaseio.com/pref/" + login_user.uid)
    
    override func viewDidLoad() {
        
        self.questionlabel.text = "Pancakes or Waffles?";
        self.answeronelabel.text = "Pancakes";
        self.answertwolabel.text = "Waffles";
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: ("Swipes:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: ("Swipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func Swipes(sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .Right){
            
            let param = ["q7": "Pancakes"]
            
            ref.updateChildValues(param)
            
            loadDestinationVC()
            
        }
        else if(sender.direction == .Left){
            
            let param = ["q7": "Waffles"]
            
            ref.updateChildValues(param)
            
            loadDestinationVC()
        }
    }
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("Toanseight", sender: nil)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
};
