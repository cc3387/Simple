//
//  Answertwo.swift
//  Simple
//
//  Created by Clement Chan on 7/20/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Ansone: UIViewController{
    
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
        
        Questions.append("Rural or Urban?")
        Answerone.append("Rural")
        Answertwo.append("Urban")
        
        
        self.questionlabel.text = "Rural or Urban?";
        self.answeronelabel.text = "Rural";
        self.answertwolabel.text = "Urban";
        
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
            
            let param = ["q2": "Urban"]
            
            ref.updateChildValues(param)
            
            loadDestinationVC()
            
        }
        else if(sender.direction == .Left){
            
            let param = ["q2": "Rural"]
            
            ref.updateChildValues(param)
            
            loadDestinationVC()
        }
    }
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("ReturnToProfile", sender: nil)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
};
