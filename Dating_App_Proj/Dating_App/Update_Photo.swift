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
    
    @IBAction func Choose_Photo(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.allowsEditing = false
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        present(image, animated: true, completion: nil)
    }
    
    @IBAction func Upload(_ sender: AnyObject) {
        //Make a new UIImage
        let uploadImage = UIImage(fileName:"Profile", type:"png")
        
        
        //Make an NSData PNG representation of the Image
        let imageData: Data = UIImagePNGRepresentation(resizeimage(uploadImage!,targetSize: CGSize(width: uploadImage!.size.height/2, height: uploadImage!.size.width/2)))!
        
        //Using base64StringFromData method, we are able to convert data to string
        self.base64String = imageData.base64EncodedString(options: []) as NSString!
        
        let NameRef = FIRDatabase.database().reference().child("users").child(login_user.uid);
        
        let Photo = [
            "Photo": self.base64String
        ];
        
        NameRef.updateChildValues(Photo);
        
        for index in frienduser.useridarray{
        let friend1 = index + "_fd";
        let NameRef1 = FIRDatabase.database().reference().child("friends").child(friend1).child(login_user.uid);
            
        let Photo = [
            "Photo": self.base64String
        ];
        
        NameRef1.updateChildValues(Photo);
            
        }
            
        loadDestinationVC()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            img.save("Profile", type: "png")
            imageView.image = img
            imageView.contentMode = .scaleAspectFit
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "Update_Photo", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
}
