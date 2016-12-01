//
//  EULA.swift
//  Simple
//
//  Created by Clement Chan on 12/1/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase


class EULA : UIViewController{
    
    @IBOutlet weak var EULAText: UITextView!
    @IBAction func Accept(_ sender: Any) {
    var ref = FIRDatabase.database().reference().child("users").child(login_user.uid).child("EULA")
    ref.setValue("1")
    loadtomain()
    }
    
    @IBAction func Decline(_ sender: Any) {
    loadoriginal()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref = FIRDatabase.database().reference().child("EULA")
        ref.queryOrdered(byChild: "Ruling").queryEqual(toValue: "1")
            .observe(.childAdded, with: { snapshot in
                
                if let source = snapshot.value as? [String:AnyObject] {
                self.EULAText.text = (source["EULA"] as? String)!
                }
        })
    }
    
    func loadoriginal(){
        self.performSegue(withIdentifier: "Loginoriginal", sender: nil)
    }
    
    func loadtomain(){
        self.performSegue(withIdentifier: "EULAtomain", sender: nil)
    }
    
    
};
