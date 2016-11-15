//
//  Transfer_Page.swift
//  Simple
//
//  Created by Clement Chan on 7/13/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase


class Transfer : UIViewController{

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(5 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)){
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.loadDestinationVC()
        };
        self.loadDestinationVC()
    }

    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    func loadDestinationVC(){
    self.performSegue(withIdentifier: "To_Main", sender: nil)
    }
};
