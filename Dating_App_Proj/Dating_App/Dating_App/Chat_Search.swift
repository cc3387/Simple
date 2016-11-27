//
//  Chat_Search.swift
//  Simple
//
//  Created by Clement Chan on 7/6/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class Chat_Search: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchActive : Bool = false
    var selectedname: String = "";
    var data = frienduser.useridarrayfinal
    var data1 = frienduser.profilenamearrayfinal
    var dataphoto:[String] = frienduser.phoneidarrayfinal
    var filtered:[String] = []
    var filtered1:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Setup delegates */
        self.tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data1.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        if(searchActive){
            cell.textLabel?.text = filtered[(indexPath as NSIndexPath).row]
            var count = 0;
            var selectednames = [String]();
            var selectedphotos = [String]();
            for index in data1{
                if(index == cell.textLabel!.text!){
                    selectednames.append(data1[count]);
                    selectedphotos.append(dataphoto[count]);
                }
                count += 1;
            }
            
            if(selectednames.count == 1){
            let base64String = selectedphotos[0];
                let decodedData = Data(base64Encoded: base64String, options: Data.Base64DecodingOptions())
                let decodedImage = UIImage(data: decodedData!)!
                cell.imageView!.image = decodedImage
            }
            else{
            let base64String = dataphoto[(indexPath as NSIndexPath).row];
            let decodedData = Data(base64Encoded: base64String, options: Data.Base64DecodingOptions())
            let decodedImage = UIImage(data: decodedData!)!
            cell.imageView!.image = decodedImage
            }
        }
        else {
            cell.textLabel?.text = data1[(indexPath as NSIndexPath).row];
            let base64String = dataphoto[(indexPath as NSIndexPath).row];
            let decodedData = Data(base64Encoded: base64String, options: Data.Base64DecodingOptions())
            let decodedImage = UIImage(data: decodedData!)!
            cell.imageView!.image = decodedImage
        }
        
        return cell;
        
    }
    
    //Select Row in index Path
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(searchActive){
            
            var count = 0;
            let selectedname = filtered[(indexPath as NSIndexPath).row]
            var selectednames = [String]();
            
            
            for index in data1{
                if(index == selectedname){
                    selectednames.append(data[count]);
                }
                count += 1;
            }
            
            if(selectednames.count == 1){
                convo_final.friend_id_final = selectednames[0];
                let loginid = "friends/" + login_user.uid + "_fd/" + convo_final.friend_id_final;
                
                var rref = FIRDatabase.database().reference().child(loginid)
                
                rref.observe(.value, with: { snapshot in
                    if(login_user.uid != self.data[(indexPath as NSIndexPath).row]){
                        
                        if let source = snapshot.value as? [String:AnyObject] {
                        let friends_name:String? = source["Profile_Name"] as? String
                        let friends_loc:String? = source["location"] as? String
                        let friends_uni:String? = source["Education"] as? String
                        let friends_major:String? = source["Major"] as? String
                        let friends_id:String? = source["Email"] as? String
                        let friends_username:String? = source["username"] as? String
                        let friends_photo:String? = source["Photo"] as? String
                        let uid:String? = source["uid"] as? String
                        let phoneid:String? = source["phoneid"] as? String
                        let chat_id:Int? = source["Chatid"] as? Int
                        let notification:Int? = source["Notification"] as? Int
                        convo_final.chat_check_final = chat_id;
                        convo_final.friend_phoneid_final = phoneid!;
                        convo_final.friend_id_final = uid!;
                        convo_final.friend_Profile_final = friends_name!;
                        convo_final.notification = notification!;
                        friend_profile.Profile_Name = friends_name;
                        friend_profile.Location = friends_loc;
                        friend_profile.University = friends_uni;
                        friend_profile.Major = friends_major;
                        let base64String = friends_photo
                        var decodedData = Data(base64Encoded: base64String!, options: NSData.Base64DecodingOptions())
                        var decodedImage = UIImage(data: decodedData!)!
                        friend_profile.Photo = decodedImage
                        }
                    }
                })
            }
            else{
        
            convo_final.friend_id_final = data[(indexPath as NSIndexPath).row];
            let loginid = "friends/" + login_user.uid + "_fd/" + convo_final.friend_id_final;
            var rref = FIRDatabase.database().reference().child(loginid);
            rref.observe(.value, with: { snapshot in
                if(login_user.uid != self.data[(indexPath as NSIndexPath).row]){
                    if let source = snapshot.value as? [String:AnyObject] {
                    let friends_name:String? = source["Profile_Name"] as? String
                    let friends_loc:String? = source["location"] as? String
                    let friends_uni:String? = source["Education"] as? String
                    let friends_major:String? = source["Major"] as? String
                    let friends_id:String? = source["Email"] as? String
                    let friends_username:String? = source["username"] as? String
                    let friends_photo:String? = source["Photo"] as? String
                    let uid:String? = source["uid"] as? String
                    let phoneid:String? = source["phoneid"] as? String
                    let chat_id:Int? = source["Chatid"] as? Int
                    let notification:Int? = source["Notification"] as? Int
                    convo_final.chat_check_final = chat_id;
                    convo_final.friend_phoneid_final = phoneid!;
                    convo_final.friend_id_final = uid!;
                    convo_final.friend_Profile_final = friends_name!;
                    convo_final.notification = notification!;
                    friend_profile.Profile_Name = friends_name;
                    friend_profile.Location = friends_loc;
                    friend_profile.University = friends_uni;
                    friend_profile.Major = friends_major;
                    let base64String = friends_photo
                    var decodedData = Data(base64Encoded: base64String!, options: NSData.Base64DecodingOptions())
                    var decodedImage = UIImage(data: decodedData!)!
                    friend_profile.Photo = decodedImage
                    }
                }
                })
            }
        }
        else{
            convo_final.friend_id_final = data[(indexPath as NSIndexPath).row];
            let loginid = "friends/" + login_user.uid + "_fd/" + convo_final.friend_id_final;
            var rref = FIRDatabase.database().reference().child(loginid)
            rref.observe(.value, with: { snapshot in
                if(login_user.uid != self.data[(indexPath as NSIndexPath).row]){
                    
                    if let source = snapshot.value as? [String:AnyObject] {
                    let friends_name:String? = source["Profile_Name"] as? String
                    let friends_loc:String? = source["location"] as? String
                    let friends_uni:String? = source["Education"] as? String
                    let friends_major:String? = source["Major"] as? String
                    let friends_id:String? = source["Email"] as? String
                    let friends_username:String? = source["username"] as? String
                    let friends_photo:String? = source["Photo"] as? String
                    let uid:String? = source["uid"] as? String
                    let phoneid:String? = source["phoneid"] as? String
                    let chat_id:Int? = source["Chatid"] as? Int
                    let notification:Int? = source["Notification"] as? Int
                    convo_final.chat_check_final = chat_id;
                    convo_final.friend_phoneid_final = phoneid!;
                    convo_final.friend_id_final = uid!;
                    convo_final.friend_Profile_final = friends_name!;
                    convo_final.notification = notification!;
                    friend_profile.Profile_Name = friends_name;
                    friend_profile.Location = friends_loc;
                    friend_profile.University = friends_uni;
                    friend_profile.Major = friends_major;
                    let base64String = friends_photo
                    var decodedData = Data(base64Encoded: base64String!, options: NSData.Base64DecodingOptions())
                    var decodedImage = UIImage(data: decodedData!)!
                    friend_profile.Photo = decodedImage
                    }
                }
            })
        }
    }
};


