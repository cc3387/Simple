//
//  Friend_Photo_Zoom.swift
//  Simple
//
//  Created by Clement Chan on 9/3/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class PhotoZoom: UIViewController, UIScrollViewDelegate {
    
    @IBAction func Block(_ sender: Any) {
        var ref = FIRDatabase.database().reference()
        ref.child("friends").child(login_user.uid+"_fd").child(convo_final.friend_id_final).updateChildValues(["Block":"1"])
        ref.child("friends").child(convo_final.friend_id_final+"_fd").child(login_user.uid).updateChildValues(["Block":"1"])
        loadDestination()
    }
    
    
    @IBOutlet weak var myUIScrollView: UIScrollView!
    
    var myUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myUIScrollView.maximumZoomScale = 5.0
        self.myUIScrollView.minimumZoomScale = 0.5
        self.myUIScrollView.delegate = self
        
        myUIImageView = UIImageView(image: friend_profile.Photo)
        self.myUIScrollView.addSubview(myUIImageView)
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myUIImageView
        
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / myUIImageView.bounds.width
        let heightScale = size.height / myUIImageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        self.myUIScrollView.minimumZoomScale = minScale
        
        self.myUIScrollView.zoomScale = minScale
    }
    
    func loadDestination(){
        self.performSegue(withIdentifier: "Blockfriend", sender: nil)
    }
}
