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
    var data = frienduser.useridarray
    var data1 = frienduser.profilenamearray
    var filtered:[String] = []
    var filtered1:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Setup delegates */
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
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
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        if(searchActive){
            cell1.textLabel?.text = filtered[indexPath.row]
            convo_final.friend_id_final = filtered[indexPath.row]
            let loginid = "https://simpleplus.firebaseio.com/friends/" + login_user.uid + "_fd/" + data[indexPath.row];
            print(cell1.textLabel?.text);
            let rref = Firebase(url:loginid);
            rref.observeEventType(.Value, withBlock: { snapshot in
                if(login_user.uid != self.data[indexPath.row]){
                let friends_name:String? = snapshot.value["Profile_Name"] as? String
                let friends_loc:String? = snapshot.value["location"] as? String
                let friends_uni:String? = snapshot.value["Education"] as? String
                let friends_major:String? = snapshot.value["Major"] as? String
                let friends_id:String? = snapshot.value["Email"] as? String
                let friends_username:String? = snapshot.value["username"] as? String
                let friends_photo:String? = snapshot.value["Photo"] as? String
                let uid:String? = snapshot.value["uid"] as? String
                let phoneid:String? = snapshot.value["phoneid"] as? String
                let chat_id:Int? = snapshot.value["Chatid"] as? Int
                convo_final.chat_check_final = chat_id;
                convo_final.friend_phoneid_final = phoneid!;
                convo_final.friend_id_final = uid!;
                convo_final.friend_Profile_final = friends_name!;
                }
            })
            
            return cell1;
        }
        else {
            
            cell1.textLabel?.text = data1[indexPath.row];
            convo_final.friend_id_final = data[indexPath.row]
            let loginid = "https://simpleplus.firebaseio.com/friends/" + login_user.uid + "_fd/" + data[indexPath.row];
            let rref = Firebase(url:loginid);
            print(cell1.textLabel?.text);
            rref.observeEventType(.Value, withBlock: { snapshot in
                if(login_user.uid != self.data[indexPath.row]){
                    let friends_name:String? = snapshot.value["Profile_Name"] as? String
                    let friends_loc:String? = snapshot.value["location"] as? String
                    let friends_uni:String? = snapshot.value["Education"] as? String
                    let friends_major:String? = snapshot.value["Major"] as? String
                    let friends_id:String? = snapshot.value["Email"] as? String
                    let friends_username:String? = snapshot.value["username"] as? String
                    let friends_photo:String? = snapshot.value["Photo"] as? String
                    let uid:String? = snapshot.value["uid"] as? String
                    let phoneid:String? = snapshot.value["phoneid"] as? String
                    let chat_id:Int? = snapshot.value["Chatid"] as? Int
                    convo_final.chat_check_final = chat_id;
                    convo_final.friend_phoneid_final = phoneid!;
                    convo_final.friend_id_final = uid!;
                    convo_final.friend_Profile_final = friends_name!;
                }
            })
            
            return cell1;
        }
    }
};


