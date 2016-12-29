//
//  Notification.swift
//  Simple
//
//  Created by Clement Chan on 12/22/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Firebase
import Batch

class Notifyclass: UIViewController, UIScrollViewDelegate{
    
    
    @IBOutlet weak var ProfileName: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var myScroll: UIScrollView!
    var myUIImageView: UIImageView!
    
    var count = 0;
    var requestcount = 0;
    
    //Accept Button
    @IBAction func Accept(_ sender: Any) {
        
        
        if(Notification.emailarray.isEmpty == true){
            
            
        }
        else if(Notification.chatid[self.count] == 2 && Notification.emailarray.isEmpty == false){
        let usernamefriend = login_user.uid + "_fd";
        let friendusername = Notification.useridarray[self.count] + "_fd";
        
        let ref = FIRDatabase.database().reference().child("friends")
        let fdref = FIRDatabase.database().reference().child("friends")
        
        let friendinfo = [
            "Profile_Name" : Notification.profilenamearray[self.count],
            "location" : Notification.locationarray[self.count],
            "Education": Notification.educationarray[self.count],
            "Major": Notification.majorarray[self.count],
            "username": Notification.usernamearray[self.count],
            "Email": Notification.emailarray[self.count],
            "Photo": Notification.photoarray[self.count],
            "uid": Notification.useridarray[self.count],
            "phoneid": Notification.phoneidarray[self.count],
            "Notification": 1,
            "Block": "0",
            "Chatid": 1
        ] as [String : Any];
        
        let infofriend = [
            "Profile_Name" : login_user.Profile_Name,
            "location" : login_user.location,
            "Education": login_user.university,
            "Major": login_user.major,
            "username": login_user.user_name,
            "Email": login.loginid,
            "Photo": login_user.photo,
            "uid": login_user.uid,
            "phoneid": login_user.phoneid,
            "Notification": 1,
            "Block": "0",
            "Chatid": 2
            ] as [String : Any];
        
        let usernamefd = ref.child(byAppendingPath: usernamefriend);
        let fdusername = fdref.child(byAppendingPath: friendusername);
        usernamefd.child(byAppendingPath: Notification.useridarray[self.count]).setValue(friendinfo);
        fdusername.child(byAppendingPath: login_user.uid).setValue(infofriend);
        
        var refnoti = FIRDatabase.database().reference()
        refnoti.child("Notifications").child(usernamefriend).child(Notification.useridarray[self.count]).removeValue()
        refnoti.child("Notifications").child(friendusername).child(login_user.uid).removeValue()
        
        try! FIRAuth.auth()!.signOut()
        
        //Load profile
        loadDestinationVC()
        }
    }
    
    //Decline Button
    @IBAction func Decline(_ sender: Any) {
        
        if(Notification.emailarray.isEmpty == true){
            
            
        }
        else if(Notification.chatid[self.count] == 2 && Notification.emailarray.isEmpty == false){
        let usernamefriend = login_user.uid + "_fd";
        let friendusername = Notification.useridarray[self.count] + "_fd";
        
        let ref = FIRDatabase.database().reference().child("friends")
        let fdref = FIRDatabase.database().reference().child("friends")
        
        let friendinfo = [
        "Profile_Name" : Notification.profilenamearray[self.count],
        "location" : Notification.locationarray[self.count],
        "Education": Notification.educationarray[self.count],
        "Major": Notification.majorarray[self.count],
        "username": Notification.usernamearray[self.count],
        "Email": Notification.emailarray[self.count],
        "Photo": Notification.photoarray[self.count],
        "uid": Notification.useridarray[self.count],
        "phoneid": Notification.phoneidarray[self.count],
        "Notification": 1,
        "Block": "1",
        "Chatid": 1
        ] as [String : Any];
        
        let infofriend = [
            "Profile_Name" : login_user.Profile_Name,
            "location" : login_user.location,
            "Education": login_user.university,
            "Major": login_user.major,
            "username": login_user.user_name,
            "Email": login.loginid,
            "Photo": login_user.photo,
            "uid": login_user.uid,
            "phoneid": login_user.phoneid,
            "Notification": 1,
            "Block": "1",
            "Chatid": 2
        ] as [String : Any];
        
        let usernamefd = ref.child(byAppendingPath: usernamefriend);
        let fdusername = fdref.child(byAppendingPath: friendusername);
        usernamefd.child(byAppendingPath: Notification.useridarray[self.count]).setValue(friendinfo);
        fdusername.child(byAppendingPath: login_user.uid).setValue(infofriend);
        
        var refnoti = FIRDatabase.database().reference()
        refnoti.child("Notifications").child(usernamefriend).child(Notification.useridarray[self.count]).removeValue()
        refnoti.child("Notifications").child(friendusername).child(login_user.uid).removeValue()
        
        try! FIRAuth.auth()!.signOut()
        
        //Load profile
        loadDestinationVC()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.endEditing(true)
        
        
        self.requestcount = Notification.profilenamearray.count
        
        if(self.requestcount != 0 && Notification.chatid[self.count] == 2){
        let decodedData = Data(base64Encoded: Notification.photoarray[self.count], options: Data.Base64DecodingOptions())
        let decodedImage = UIImage(data: decodedData!)!
        myUIImageView = UIImageView(image: decodedImage)
        self.myScroll.maximumZoomScale = 5.0
        self.myScroll.minimumZoomScale = 0.5
        self.myScroll.delegate = self
        self.myScroll.addSubview(myUIImageView)
        updateMinZoomScaleForSize(view.bounds.size)
            
            
        //Friend's Info
        self.ProfileName.text = Notification.profilenamearray[self.count]
        self.ProfileName.textColor = UIColor.white
        self.Location.text = Notification.locationarray[self.count]
        self.Location.textColor = UIColor.white
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myUIImageView
        
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / myUIImageView.bounds.width
        let heightScale = size.height / myUIImageView.bounds.height
        let minScale = min(widthScale, heightScale)
        self.myScroll.minimumZoomScale = minScale
        self.myScroll.zoomScale = minScale
    }
        
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "AcceptFriend", sender: nil)
    }
    
    
}
