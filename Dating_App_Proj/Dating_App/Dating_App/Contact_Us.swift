//
//  Contact_Us.swift
//  Simple
//
//  Created by Clement Chan on 7/4/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class contactus: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var Admin_email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.endEditing(true)
        self.Admin_email.text = "simplethemeetingsite@gmail.com"
    }

    
    @IBAction func Send_Email(_ sender: AnyObject) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([self.Admin_email.text!])
        mailComposerVC.setSubject("Reporting Abuse, Events and Account issue")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController!, didFinishWith result: MFMailComposeResult, error: Error!) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
}
