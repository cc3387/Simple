//
//  Answer_Question.swift
//  Simple
//
//  Created by Clement Chan on 7/20/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Answer: UIViewController{
    
    var Answer1: String = "";
    var Answer2: String = "";
    var Question: String = "";
    var chatid: String = "";
    var count: Int = 0;
    
    @IBOutlet weak var questionlabel: UILabel!
    
    @IBOutlet weak var answeronelabel: UILabel!
    
    @IBOutlet weak var answertwolabel: UILabel!
    
    var ref = FIRDatabase.database().reference().child("pref").child(login_user.uid)
    
    override func viewDidLoad() {	
        
        self.questionlabel.text = "PC or Mac?";
        self.answeronelabel.text = "PC";
        self.answertwolabel.text = "Mac";
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(Answer.Swipes(_:))))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(Answer.Swipes(_:))))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func Swipes(_ sender:UISwipeGestureRecognizer){
        
        if(sender.direction == .right){
                
            let param = ["q1": "Mac"]
            
            ref.updateChildValues(param)
                
            loadDestinationVC()
            
        }
        else if(sender.direction == .left){
            
            let param = ["q1": "PC"]
            
            ref.updateChildValues(param)
        
            loadDestinationVC()
        }
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Toansone", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

};
