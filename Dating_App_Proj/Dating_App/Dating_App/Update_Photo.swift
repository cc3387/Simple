//
//  Update_Photo.swift
//  Simple
//
//  Created by Clement Chan on 6/26/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import UIKit
import Firebase

class UpdatePhoto: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var base64String: NSString!
    var photonamepath: NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func Choose_Photo(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        image.allowsEditing = false
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        presentViewController(image, animated: true, completion: nil)
    }
    
    @IBAction func Upload(sender: AnyObject) {
        //Make a new UIImage
        let uploadImage = UIImage(fileName:"Profile", type:"png")
        
        
        //Make an NSData PNG representation of the Image
        let imageData: NSData = UIImagePNGRepresentation(resizeimage(uploadImage!,targetSize: CGSizeMake(uploadImage!.size.height/2, uploadImage!.size.width/2)))!
        
        //Using base64StringFromData method, we are able to convert data to string
        self.base64String = imageData.base64EncodedStringWithOptions([])
        
        var NameRef = Firebase(url: "https://simpleplus.firebaseio.com/users/" + login_user.uid)
        
        var Photo = [
            "Photo": self.base64String
        ];
        
        NameRef.updateChildValues(Photo);
        
        let friend = "https://simpleplus.firebaseio.com/friends/";
        
        for index in frienduser.useridarray{
        
        let friend1 = friend + index + "_fd/" + login_user.uid;
            
        var NameRef1 = Firebase(url: friend1)
            
        var Photo = [
            "Photo": self.base64String
        ];
        
        NameRef1.updateChildValues(Photo);
            
        }
            
        loadDestinationVC()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            img.save("Profile", type: "png")
            imageView.image = img
            imageView.contentMode = .ScaleAspectFit
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("Update_Photo", sender: nil)
    }
}