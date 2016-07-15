//
//  Transfer_Page.swift
//  Simple
//
//  Created by Clement Chan on 7/13/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation


class Transfer : UIViewController{

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = false
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(5 * NSEC_PER_SEC)), dispatch_get_main_queue()){
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidden = true
            self.loadDestinationVC()
        };
        self.loadDestinationVC()
    }

    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    func loadDestinationVC(){
    self.performSegueWithIdentifier("To_Main", sender: nil)
    }
};