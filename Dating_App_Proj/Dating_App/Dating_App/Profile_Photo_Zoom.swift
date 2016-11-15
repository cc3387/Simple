//
//  Profile_Photo_Zoom.swift
//  Simple
//
//  Created by Clement Chan on 9/4/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import UIKit

class ProfilePhotoZoom: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var myUIScrollView: UIScrollView!
    
    var myUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myUIScrollView.maximumZoomScale = 5.0
        self.myUIScrollView.minimumZoomScale = 0.5
        self.myUIScrollView.delegate = self
        
        myUIImageView = UIImageView(image: login.Photo)
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
}
