//
//  Answerthree.swift
//  Simple
//
//  Created by Clement Chan on 7/21/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase

class Ansthree: UIViewController{
    
    var Answer1: String = "";
    var Answer2: String = "";
    var Question: String = "";
    var chatid: String = "";
    var count: Int = 0;
    
    @IBOutlet weak var questionlabel: UILabel!
    
    @IBOutlet weak var answeronelabel: UILabel!
    
    @IBOutlet weak var answertwolabel: UILabel!
    
    //    let ref = Firebase(url:"https://simpleplus.firebaseio.com/pref/" + login_user.uid)
    
    var ref = FIRDatabase.database().reference().child("pref").child(login_user.uid)
    override func viewDidLoad() {
        
        self.questionlabel.text = "Cats or Dogs?";
        self.answeronelabel.text = "Cats";
        self.answertwolabel.text = "Dogs";
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(Ansthree.Swipes(_:))))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: (#selector(Ansthree.Swipes(_:))))
        
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
            
            let param = ["q3": "Dogs"]
            
            ref.updateChildValues(param)
            
            loadDestinationVC()
            
        }
        else if(sender.direction == .left){
            
            let param = ["q3": "Cats"]
            
            ref.updateChildValues(param)
            
            loadDestinationVC()
        }
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Toansfour", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
};
