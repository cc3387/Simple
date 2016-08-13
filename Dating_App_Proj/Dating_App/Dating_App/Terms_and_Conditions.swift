//
//  Terms_and_Conditions.swift
//  Simple
//
//  Created by Clement Chan on 7/31/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class termsandconditions: UIViewController, MFMailComposeViewControllerDelegate {

//    @IBOutlet weak var Terms: UILabel!
//    @IBOutlet weak var Lineone: UILabel!
//    @IBOutlet weak var Linetwo: UILabel!
//    @IBOutlet weak var Linethree: UILabel!
//    @IBOutlet weak var Linefour: UILabel!
//    @IBOutlet weak var Linefive: UILabel!
//    @IBOutlet weak var Linesix: UILabel!
//    @IBOutlet weak var Lineseven: UILabel!
//    @IBOutlet weak var Lineeight: UILabel!
//    @IBOutlet weak var Linenine: UILabel!
//    @IBOutlet weak var Lineten: UILabel!
//    @IBOutlet weak var Lineeleven: UILabel!
//    @IBOutlet weak var Linetwelve: UILabel!
//    @IBOutlet weak var Linethirteen: UILabel!
//    @IBOutlet weak var LineFourteen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
//        self.Terms.text = "Terms and Conditions -- Last updated (1st August 2016)"
//        self.Lineone.text = "Please read these Terms and Conditions carefully before"
//        self.Linetwo.text = "using Simple the app operated by Simple. Your access to"
//        self.Linethree.text = "and use of the Service is conditioned on your acceptance"
//        self.Linefour.text = "and compliance with these Terms. These Terms apply"
//        self.Linefive.text = "to all visitors, users and others who access or "
//        self.Linesix.text = "use the Service. By accessing or using the Service "
//        self.Lineseven.text = "you agree to be bound by these Terms. If you disagree "
//        self.Lineeight.text = "with any part of the terms then you may not access"
//        self.Linenine.text = "the Service."
//        self.Lineten.text = "Our Service may contain links to third­ party web sites "
//        self.Lineeleven.text = "that are not owned or controlled by Simple."
//        self.Linetwelve.text = "Simple has no control over, and assumes no "
//        self.Linethirteen.text = "responsibility for, the content, private policies,"
//        self.LineFourteen.text = "or practices of any third party websites or services."
//        
//        self.Terms.adjustsFontSizeToFitWidth = true
//        self.Lineone.adjustsFontSizeToFitWidth = true
//        self.Linetwo.adjustsFontSizeToFitWidth = true
//        self.Linethree.adjustsFontSizeToFitWidth = true
//        self.Linefour.adjustsFontSizeToFitWidth = true
//        self.Linefive.adjustsFontSizeToFitWidth = true
//        self.Linesix.adjustsFontSizeToFitWidth = true
//        self.Lineseven.adjustsFontSizeToFitWidth = true
//        self.Lineeight.adjustsFontSizeToFitWidth = true
//        self.Linenine.adjustsFontSizeToFitWidth = true
//        self.Lineten.adjustsFontSizeToFitWidth = true
//        self.Lineeleven.adjustsFontSizeToFitWidth = true
//        self.Linetwelve.adjustsFontSizeToFitWidth = true
//        self.Linethirteen.adjustsFontSizeToFitWidth = true
//        self.LineFourteen.adjustsFontSizeToFitWidth = true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}