//
//  Choose_Photos.swift
//  Simple
//
//  Created by Clement Chan on 6/4/16.
//  Copyright (c) 2016 Clement Chan. All rights reserved.
//

import UIKit
import Firebase

//Resizing the image before loading
func resizeimage(_ image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}


//Saving Images after the selection
extension UIImage {
    
    func save(_ fileName: String, type: String) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] 
        
        if type.lowercased() == "png" {
            let path = "\(documentsPath)/\(fileName).\(type)"
            try? UIImagePNGRepresentation(self)!.write(to: URL(fileURLWithPath: path), options: [.atomic])
        } else if type.lowercased() == "jpg" {
            let path = "\(documentsPath)/\(fileName).\(type)"
            try? UIImageJPEGRepresentation(self, 1.0)!.write(to: URL(fileURLWithPath: path), options: [.atomic])
        } else {
            
        }
    }
    
    convenience init?(fileName: String, type: String) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] 
        let path = "\(documentsPath)/\(fileName).\(type)"
        self.init(contentsOfFile: path)
    }
}

class ChoosePhoto: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    var base64String: NSString!
    var photonamepath: NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loadImageButtonTapped(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.allowsEditing = false
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        present(image, animated: true, completion: nil)
    }
    
    @IBAction func UploadButtons(_ sender: UIButton) {
        
        //Make a new UIImage
        let uploadImage = UIImage(fileName:"Profile", type:"png")
        
        
        //Make an NSData PNG representation of the Image
        let imageData: Data = UIImagePNGRepresentation(resizeimage(uploadImage!,targetSize: CGSize(width: uploadImage!.size.height/5, height: uploadImage!.size.width/5)))!
        
        //Using base64StringFromData method, we are able to convert data to string
        self.base64String = imageData.base64EncodedString(options: []) as NSString!
        register_info.Photo = self.base64String as NSString
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
        self.performSegue(withIdentifier: "Final_Send", sender: nil)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
}
