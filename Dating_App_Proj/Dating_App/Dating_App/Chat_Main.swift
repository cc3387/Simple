//
//  Chat_Main.swift
//  Simple
//
//  Created by Clement Chan on 11/15/15.
//  Copyright (c) 2015 Clement Chan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

var Chat_notification = 0;

class Chat_Main : UIViewController{
    
    @IBOutlet weak var Chatroom_title: UILabel!
    @IBOutlet weak var User_ID: UILabel!
    @IBOutlet weak var Time_Greetings: UILabel!
    @IBOutlet weak var user_greetings: UILabel!
    @IBOutlet weak var Bkground_Image: UIImageView!
    
    //Getting Profile name from the server
    @IBOutlet weak var Profile_Name: UILabel!
    
    //Define the variables that will be used in the functions afterwards
    var imagecounter: Int = 0;
    
    
    //Friend_1
    @IBAction func Chat_1(sender: AnyObject) {
    
    if conversation_info.friend_id1 == ""{
        
    }
    else{
        convo_final.friend_id_final = conversation_info.friend_id1!
        convo_final.chat_check_final = conversation_info.chat_check1!
        Chat_notification = 0;
        loadDestinationVC();
    }
        
    }

    @IBOutlet weak var Friend_1: UILabel!
    @IBOutlet weak var Friend_1_Image: UIImageView!

    @IBOutlet weak var Friend_1_Loc: UILabel!
    @IBOutlet weak var Friend_1_Uni: UILabel!
    @IBOutlet weak var Friend_1_Major: UILabel!
    
    @IBAction func Friend_1_Profile(sender: AnyObject) {
        friend_profile.Profile_Name = self.Friend_1.text;
        friend_profile.Location = self.Friend_1_Loc.text;
        friend_profile.University = self.Friend_1_Uni.text;
        friend_profile.Major = self.Friend_1_Major.text;
        friend_profile.Photo = self.Friend_1_Image.image;
        loadDestinationVC1();
    }
    
    //Friend_2
    @IBAction func Chat_2(sender: AnyObject) {
        if conversation_info.friend_id2 == "" {
            
        }
        else{
            convo_final.friend_id_final = conversation_info.friend_id2!
            convo_final.chat_check_final = conversation_info.chat_check2!
            Chat_notification = 0;
            loadDestinationVC();
        }
    }
    
    
    @IBAction func Friend_2_Profile(sender: AnyObject) {
        friend_profile.Profile_Name = self.Friend_2.text;
        friend_profile.Location = self.Friend_2_Loc.text;
        friend_profile.University = self.Friend_2_Uni.text;
        friend_profile.Major = self.Friend_2_Major.text;
        friend_profile.Photo = self.Friend_2_Image.image;
        loadDestinationVC1();
    }
    
    @IBOutlet weak var Friend_2: UILabel!
    @IBOutlet weak var Friend_2_Image: UIImageView!
    @IBOutlet weak var Friend_2_Loc: UILabel!
    @IBOutlet weak var Friend_2_Uni: UILabel!
    @IBOutlet weak var Friend_2_Major: UILabel!
    

    //Friend_3
    @IBAction func Chat_3(sender: AnyObject) {
        if conversation_info.friend_id3 == ""{
            
        }
        else{
            convo_final.friend_id_final = conversation_info.friend_id3!
            convo_final.chat_check_final = conversation_info.chat_check3!
            Chat_notification = 0;
            loadDestinationVC();
        }
    }
    
    @IBOutlet weak var Friend_3: UILabel!
    @IBOutlet weak var Friend_3_Loc: UILabel!
    @IBOutlet weak var Friend_3_Image: UIImageView!
    @IBOutlet weak var Friend_3_Uni: UILabel!
    @IBOutlet weak var Friend_3_Major: UILabel!
    
    
    @IBAction func Friend_3_Profile(sender: AnyObject) {
        friend_profile.Profile_Name = self.Friend_3.text;
        friend_profile.Location = self.Friend_3_Loc.text;
        friend_profile.University = self.Friend_3_Uni.text;
        friend_profile.Major = self.Friend_3_Major.text;
        friend_profile.Photo = self.Friend_3_Image.image;
        loadDestinationVC1();
    }
    
    //Friend_4
    @IBAction func Chat_4(sender: AnyObject) {
        if conversation_info.friend_id4 == ""{
            
        }
        else{
            convo_final.friend_id_final = conversation_info.friend_id4!
            convo_final.chat_check_final = conversation_info.chat_check4!
            Chat_notification = 0;
            loadDestinationVC();
        }
    }
    
    @IBOutlet weak var Friend_4: UILabel!
    @IBOutlet weak var Friend_4_Loc: UILabel!
    @IBOutlet weak var Friend_4_Image: UIImageView!
    
    @IBOutlet weak var Friend_4_Uni: UILabel!
    @IBOutlet weak var Friend_4_Major: UILabel!
    
    @IBAction func Friend_4_Profile(sender: AnyObject) {
        friend_profile.Profile_Name = self.Friend_4.text;
        friend_profile.Location = self.Friend_4_Loc.text;
        friend_profile.University = self.Friend_4_Uni.text;
        friend_profile.Major = self.Friend_4_Major.text;
        friend_profile.Photo = self.Friend_4_Image.image;
        loadDestinationVC1();
    }
    
    //Getting the login_user id that is collected from the login page
    var loginuser: String = login.loginid;
    var user1: String = "";
    
    //Friend's Array in name, location, university, major and chat check
    var friendsArray:[String] = [String]() //Set an empty array for friend names
    var friendlocArray:[String] = [String]() //Set an empty array for friend locations
    var frienduniArray:[String] = [String]() //Set an empty array for university locations
    var friendmajorArray:[String] = [String]() //Set an empty array for major locations
    var friendidArray:[String] = [String]() //Set an empty array for friend's ID
    var chatidArray:[Int] = [Int]() //Set an empty array to define Chat ID
    var friendusernameArray:[String] = [String]() //Set an empty array for friend's username
    var photoarray:[String] = [String]() //Set an empty array for friend's photo username
    var chatcheck:[Int] = [Int]() //Check 1:1 relationship
    
    
    var friend:String = "";
    var read_count: Int = 0;
    var multiple: Int = 0;
    //var multi_count = 1;
    var multi_count_add = 2;
    
    @IBAction func Previous_Button(sender: AnyObject) {
    
        if(self.multiple == 0){
            self.multiple = 0;
        }
        else{
            self.imagecounter -= 1;
            
            if(self.imagecounter <= 0){
            self.imagecounter = 0;
            }
            
            let a = self.friendsArray.count;
            let b = a / 4;
            let remainder = a % 4;
            let page_remainder = a - remainder;
            print(remainder);
            print(b);
            print(self.multi_count_add);
                
                if(b >= 1){
                    self.multi_count_add -= 2;
                    
                    if(self.multi_count_add <= 0){
                    self.multi_count_add = 0;
                    }
                    
                    self.Friend_1.text = self.friendsArray[self.multi_count_add*4+0];
                    self.Friend_1_Loc.text = self.friendlocArray[self.multi_count_add*4+0];
                    self.Friend_1_Uni.text = self.frienduniArray[self.multi_count_add*4+0];
                    self.Friend_1_Major.text = self.friendmajorArray[self.multi_count_add*4+0];
                    let base64String = self.photoarray[self.multi_count_add*4+0];
                    let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
                    let decodedImage = UIImage(data: decodedData!)!
                    self.Friend_1_Image.image = decodedImage
                    self.Friend_1_Image.contentMode = .ScaleAspectFit
                    self.Friend_2.text = self.friendsArray[self.multi_count_add*4 + 1];
                    self.Friend_2_Loc.text = self.friendlocArray[self.multi_count_add*4+1];
                    self.Friend_2_Uni.text = self.frienduniArray[self.multi_count_add*4+1];
                    self.Friend_2_Major.text = self.friendmajorArray[self.multi_count_add*4+1];
                    let base64String1 = self.photoarray[self.multi_count_add*4+1];
                    let decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
                    let decodedImage1 = UIImage(data: decodedData1!)!
                    self.Friend_2_Image.image = decodedImage1
                    self.Friend_2_Image.contentMode = .ScaleAspectFit
                    self.Friend_3.text = self.friendsArray[self.multi_count_add*4 + 2];
                    self.Friend_3_Loc.text = self.friendlocArray[self.multi_count_add*4+2];
                    self.Friend_3_Uni.text = self.frienduniArray[self.multi_count_add*4+2];
                    self.Friend_3_Major.text = self.friendmajorArray[self.multi_count_add*4+2];
                    let base64String2 = self.photoarray[self.multi_count_add*4+2];
                    let decodedData2 = NSData(base64EncodedString: base64String2, options: NSDataBase64DecodingOptions())
                    let decodedImage2 = UIImage(data: decodedData2!)!
                    self.Friend_3_Image.image = decodedImage2
                    self.Friend_3_Image.contentMode = .ScaleAspectFit
                    self.Friend_4.text = self.friendsArray[self.multi_count_add*4 + 3];
                    self.Friend_4_Loc.text = self.friendlocArray[self.multi_count_add*4+3];
                    self.Friend_4_Uni.text = self.frienduniArray[self.multi_count_add*4+3];
                    self.Friend_4_Major.text = self.friendmajorArray[self.multi_count_add*4+3];
                    let base64String3 = self.photoarray[self.multi_count_add*4+3];
                    let decodedData3 = NSData(base64EncodedString: base64String3, options: NSDataBase64DecodingOptions())
                    let decodedImage3 = UIImage(data: decodedData3!)!
                    self.Friend_4_Image.image = decodedImage3
                    self.Friend_4_Image.contentMode = .ScaleAspectFit
                    conversation_info.friend_id1 = self.friendusernameArray[self.multi_count_add*4+0];
                    conversation_info.chat_check1 = self.chatidArray[self.multi_count_add*4+0];
                    conversation_info.friend_id2 = self.friendusernameArray[self.multi_count_add*4+1];
                    conversation_info.chat_check2 = self.chatidArray[self.multi_count_add*4+1];
                    conversation_info.friend_id3 = self.friendusernameArray[self.multi_count_add*4+2];
                    conversation_info.chat_check3 = self.chatidArray[self.multi_count_add*4+2];
                    conversation_info.friend_id4 = self.friendusernameArray[self.multi_count_add*4+3];
                    conversation_info.chat_check4 = self.chatidArray[self.multi_count_add*4+3];
                    self.Friend_1.textColor = UIColor.whiteColor();
                    self.Friend_1_Loc.textColor = UIColor.whiteColor();
                    self.Friend_1_Uni.textColor = UIColor.whiteColor();
                    self.Friend_1_Major.textColor = UIColor.whiteColor();
                    self.Friend_2.textColor = UIColor.whiteColor();
                    self.Friend_2_Loc.textColor = UIColor.whiteColor();
                    self.Friend_2_Uni.textColor = UIColor.whiteColor();
                    self.Friend_2_Major.textColor = UIColor.whiteColor();
                    self.Friend_3.textColor = UIColor.whiteColor();
                    self.Friend_3_Loc.textColor = UIColor.whiteColor();
                    self.Friend_3_Major.textColor = UIColor.whiteColor();
                    self.Friend_3_Uni.textColor = UIColor.whiteColor();
                    self.Friend_4.textColor = UIColor.whiteColor();
                    self.Friend_4_Loc.textColor = UIColor.whiteColor();
                    self.Friend_4_Major.textColor = UIColor.whiteColor();
                    self.Friend_4_Uni.textColor = UIColor.whiteColor();
                    
                    if((page_remainder % 4) == 0 && self.multi_count_add >= 1 && (self.multi_count_add - 1) >= 0){
                        self.Friend_1.text = self.friendsArray[(self.multi_count_add-1)*4 + 0];
                        self.Friend_1_Loc.text = self.friendlocArray[(self.multi_count_add-1)*4 + 0];
                        self.Friend_1_Uni.text = self.frienduniArray[(self.multi_count_add-1)*4 + 0];
                        self.Friend_1_Major.text = self.friendmajorArray[(self.multi_count_add-1)*4 + 0];
                        let base64String = self.photoarray[(self.multi_count_add-1)*4 + 0];
                        var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
                        var decodedImage = UIImage(data: decodedData!)!
                        self.Friend_1_Image.image = decodedImage
                        self.Friend_1_Image.contentMode = .ScaleAspectFit
                        self.Friend_2.text = self.friendsArray[(self.multi_count_add-1)*4 + 1];
                        self.Friend_2_Loc.text = self.friendlocArray[(self.multi_count_add-1)*4 + 1];
                        self.Friend_2_Uni.text = self.frienduniArray[(self.multi_count_add-1)*4 + 1];
                        self.Friend_2_Major.text = self.friendmajorArray[(self.multi_count_add-1)*4 + 1];
                        let base64String1 = self.photoarray[(self.multi_count_add-1)*4 + 1];
                        var decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
                        var decodedImage1 = UIImage(data: decodedData1!)!
                        self.Friend_2_Image.image = decodedImage1
                        self.Friend_2_Image.contentMode = .ScaleAspectFit
                        self.Friend_3.text = self.friendsArray[(self.multi_count_add-1)*4 + 2];
                        self.Friend_3_Loc.text = self.friendlocArray[(self.multi_count_add-1)*4 + 2];
                        self.Friend_3_Uni.text = self.frienduniArray[(self.multi_count_add-1)*4 + 2];
                        self.Friend_3_Major.text = self.friendmajorArray[(self.multi_count_add-1)*4 + 2];
                        let base64String2 = self.photoarray[(self.multi_count_add-1)*4 + 2];
                        var decodedData2 = NSData(base64EncodedString: base64String2, options: NSDataBase64DecodingOptions())
                        var decodedImage2 = UIImage(data: decodedData2!)!
                        self.Friend_3_Image.image = decodedImage2
                        self.Friend_3_Image.contentMode = .ScaleAspectFit
                        self.Friend_4.text = self.friendsArray[(self.multi_count_add-1)*4 + 3];
                        self.Friend_4_Loc.text = self.friendlocArray[(self.multi_count_add-1)*4 + 3];
                        self.Friend_4_Uni.text = self.frienduniArray[(self.multi_count_add-1)*4 + 3];
                        self.Friend_4_Major.text = self.friendmajorArray[(self.multi_count_add-1)*4 + 3];
                        let base64String3 = self.photoarray[(self.multi_count_add-1)*4 + 3];
                        var decodedData3 = NSData(base64EncodedString: base64String3, options: NSDataBase64DecodingOptions())
                        var decodedImage3 = UIImage(data: decodedData3!)!
                        self.Friend_4_Image.image = decodedImage3
                        self.Friend_4_Image.contentMode = .ScaleAspectFit
                        conversation_info.friend_id1 = self.friendusernameArray[(self.multi_count_add-1)*4 + 0];
                        conversation_info.chat_check1 = self.chatidArray[(self.multi_count_add-1)*4 + 0];
                        conversation_info.friend_id2 = self.friendusernameArray[(self.multi_count_add-1)*4 + 1];
                        conversation_info.chat_check2 = self.chatidArray[(self.multi_count_add-1)*4 + 1];
                        conversation_info.friend_id3 = self.friendusernameArray[(self.multi_count_add-1)*4 + 2];
                        conversation_info.chat_check3 = self.chatidArray[(self.multi_count_add-1)*4 + 2];
                        conversation_info.friend_id4 = self.friendusernameArray[(self.multi_count_add-1)*4 + 3];
                        conversation_info.chat_check4 = self.chatidArray[(self.multi_count_add-1)*4 + 3];
                        self.Friend_1.textColor = UIColor.whiteColor();
                        self.Friend_1_Loc.textColor = UIColor.whiteColor();
                        self.Friend_1_Uni.textColor = UIColor.whiteColor();
                        self.Friend_1_Major.textColor = UIColor.whiteColor();
                        self.Friend_1.sizeToFit()
                        self.Friend_1_Loc.sizeToFit()
                        self.Friend_1_Uni.sizeToFit()
                        self.Friend_1_Major.sizeToFit()
                        self.Friend_1.adjustsFontSizeToFitWidth = true
                        self.Friend_1_Loc.adjustsFontSizeToFitWidth = true
                        self.Friend_1_Uni.adjustsFontSizeToFitWidth = true
                        self.Friend_1_Major.adjustsFontSizeToFitWidth = true
                        self.Friend_2.textColor = UIColor.whiteColor();
                        self.Friend_2_Loc.textColor = UIColor.whiteColor();
                        self.Friend_2_Uni.textColor = UIColor.whiteColor();
                        self.Friend_2_Major.textColor = UIColor.whiteColor();
                        self.Friend_2.sizeToFit()
                        self.Friend_2_Loc.sizeToFit()
                        self.Friend_2_Uni.sizeToFit()
                        self.Friend_2_Major.sizeToFit()
                        self.Friend_2.adjustsFontSizeToFitWidth = true
                        self.Friend_2_Loc.adjustsFontSizeToFitWidth = true
                        self.Friend_2_Uni.adjustsFontSizeToFitWidth = true
                        self.Friend_2_Major.adjustsFontSizeToFitWidth = true
                        self.Friend_3.textColor = UIColor.whiteColor();
                        self.Friend_3_Loc.textColor = UIColor.whiteColor();
                        self.Friend_3_Uni.textColor = UIColor.whiteColor();
                        self.Friend_3_Major.textColor = UIColor.whiteColor();
                        self.Friend_3.sizeToFit()
                        self.Friend_3_Loc.sizeToFit()
                        self.Friend_3_Uni.sizeToFit()
                        self.Friend_3_Major.sizeToFit()
                        self.Friend_3.adjustsFontSizeToFitWidth = true
                        self.Friend_3_Loc.adjustsFontSizeToFitWidth = true
                        self.Friend_3_Uni.adjustsFontSizeToFitWidth = true
                        self.Friend_3_Major.adjustsFontSizeToFitWidth = true
                        self.Friend_4.textColor = UIColor.whiteColor();
                        self.Friend_4_Loc.textColor = UIColor.whiteColor();
                        self.Friend_4_Uni.textColor = UIColor.whiteColor();
                        self.Friend_4_Major.textColor = UIColor.whiteColor();
                        self.Friend_4.sizeToFit()
                        self.Friend_4_Loc.sizeToFit()
                        self.Friend_4_Uni.sizeToFit()
                        self.Friend_4_Major.sizeToFit()
                        self.Friend_4.adjustsFontSizeToFitWidth = true
                        self.Friend_4_Loc.adjustsFontSizeToFitWidth = true
                        self.Friend_4_Uni.adjustsFontSizeToFitWidth = true
                        self.Friend_4_Major.adjustsFontSizeToFitWidth = true
                    }

                    if(self.multi_count_add == 0){
                    self.multi_count_add = 2;
                    }
                    else{
                    self.multi_count_add -= 1;
                    }
              }
        }
        
        /*if(self.imagecounter == 0){
            let url = NSURL(string: "https://media.licdn.com/media/p/6/005/0a0/376/1c3abce.jpg")
            let url1 = NSURL(string: "https://media.licdn.com/media/AAEAAQAAAAAAAAjlAAAAJDZkZmE3MDBjLWU3MWEtNGFkNC1hMWQ3LWM0NGZjN2JmMzQyMw.jpg")
            let url2 = NSURL(string:"https://media.licdn.com/media/p/4/000/176/03c/02baf1e.jpg")
            let url3 = NSURL(string:"https://media.licdn.com/media/p/7/005/01d/2f5/3d52f84.jpg")
        self.Friend_1_Image.setImageWithUrl(url!, placeHolderImage: nil);
        self.Friend_2_Image.setImageWithUrl(url1!, placeHolderImage: nil);
        self.Friend_3_Image.setImageWithUrl(url2!, placeHolderImage: nil);
        self.Friend_4_Image.setImageWithUrl(url3!, placeHolderImage: nil);
        }*/
        
    }
    
    @IBAction func Next_Button(sender: AnyObject) {
            self.imagecounter += 1;
            self.multiple += 4;
            let a = self.friendsArray.count;
            let b = a / 4;
            let remainder = a % 4;
            print(remainder);
            print(b);
            print(self.multi_count_add)
        
        if(self.multi_count_add <= b && b < 2){
            
            if(self.multi_count_add <= 0){
            self.multi_count_add += 2;
            }
            self.Friend_1.text = self.friendsArray[0 + (self.multi_count_add-1)*4];
            self.Friend_1_Loc.text = self.friendlocArray[0 + (self.multi_count_add-1)*4];
            self.Friend_1_Uni.text = self.frienduniArray[0 + (self.multi_count_add-1)*4];
            self.Friend_1_Major.text = self.friendmajorArray[0 + (self.multi_count_add-1)*4];
            let base64String = self.photoarray[0 + (self.multi_count_add-1)*4];
            var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
            var decodedImage = UIImage(data: decodedData!)!
            self.Friend_1_Image.image = decodedImage
            self.Friend_1_Image.contentMode = .ScaleAspectFit
            self.Friend_2.text = self.friendsArray[1 + (self.multi_count_add-1)*4];
            self.Friend_2_Loc.text = self.friendlocArray[1 + (self.multi_count_add-1)*4];
            self.Friend_2_Uni.text = self.frienduniArray[1 + (self.multi_count_add-1)*4];
            self.Friend_2_Major.text = self.friendmajorArray[1 + (self.multi_count_add-1)*4];
            let base64String1 = self.photoarray[1 + (self.multi_count_add-1)*4];
            var decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
            var decodedImage1 = UIImage(data: decodedData1!)!
            self.Friend_2_Image.image = decodedImage1
            self.Friend_2_Image.contentMode = .ScaleAspectFit
            self.Friend_3.text = self.friendsArray[2 + (self.multi_count_add-1)*4];
            self.Friend_3_Loc.text = self.friendlocArray[2 + (self.multi_count_add-1)*4];
            self.Friend_3_Uni.text = self.frienduniArray[2 + (self.multi_count_add-1)*4];
            self.Friend_3_Major.text = self.friendmajorArray[2 + (self.multi_count_add-1)*4];
            let base64String2 = self.photoarray[2 + (self.multi_count_add-1)*4];
            var decodedData2 = NSData(base64EncodedString: base64String2, options: NSDataBase64DecodingOptions())
            var decodedImage2 = UIImage(data: decodedData2!)!
            self.Friend_3_Image.image = decodedImage2
            self.Friend_3_Image.contentMode = .ScaleAspectFit
            self.Friend_4.text = self.friendsArray[3 + (self.multi_count_add-1)*4];
            self.Friend_4_Loc.text = self.friendlocArray[3 + (self.multi_count_add-1)*4];
            self.Friend_4_Uni.text = self.frienduniArray[3 + (self.multi_count_add-1)*4];
            self.Friend_4_Major.text = self.friendmajorArray[3 + (self.multi_count_add-1)*4];
            let base64String3 = self.photoarray[3 + (self.multi_count_add-1)*4];
            var decodedData3 = NSData(base64EncodedString: base64String3, options: NSDataBase64DecodingOptions())
            var decodedImage3 = UIImage(data: decodedData3!)!
            self.Friend_4_Image.image = decodedImage3
            self.Friend_4_Image.contentMode = .ScaleAspectFit
            conversation_info.friend_id1 = self.friendusernameArray[0 + (self.multi_count_add-1)*4];
            conversation_info.chat_check1 = self.chatidArray[0 + (self.multi_count_add-1)*4];
            conversation_info.friend_id2 = self.friendusernameArray[1 + (self.multi_count_add-1)*4];
            conversation_info.chat_check2 = self.chatidArray[1 + (self.multi_count_add-1)*4];
            conversation_info.friend_id3 = self.friendusernameArray[2 + (self.multi_count_add-1)*4];
            conversation_info.chat_check3 = self.chatidArray[2 + (self.multi_count_add-1)*4];
            conversation_info.friend_id4 = self.friendusernameArray[3 + (self.multi_count_add-1)*4];
            conversation_info.chat_check4 = self.chatidArray[3 + (self.multi_count_add-1)*4];
            self.Friend_1.textColor = UIColor.whiteColor();
            self.Friend_1_Loc.textColor = UIColor.whiteColor();
            self.Friend_1_Uni.textColor = UIColor.whiteColor();
            self.Friend_1_Major.textColor = UIColor.whiteColor();
            self.Friend_2.textColor = UIColor.whiteColor();
            self.Friend_2_Loc.textColor = UIColor.whiteColor();
            self.Friend_2_Uni.textColor = UIColor.whiteColor();
            self.Friend_2_Major.textColor = UIColor.whiteColor();
            self.Friend_3.textColor = UIColor.whiteColor();
            self.Friend_3_Loc.textColor = UIColor.whiteColor();
            self.Friend_3_Major.textColor = UIColor.whiteColor();
            self.Friend_3_Uni.textColor = UIColor.whiteColor();
            self.Friend_4.textColor = UIColor.whiteColor();
            self.Friend_4_Loc.textColor = UIColor.whiteColor();
            self.Friend_4_Major.textColor = UIColor.whiteColor();
            self.Friend_4_Uni.textColor = UIColor.whiteColor();
            self.Friend_1.sizeToFit()
            self.Friend_1_Loc.sizeToFit()
            self.Friend_1_Uni.sizeToFit()
            self.Friend_1_Major.sizeToFit()
            self.Friend_1.adjustsFontSizeToFitWidth = true
            self.Friend_1_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_1_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_1_Major.adjustsFontSizeToFitWidth = true
            self.Friend_2.sizeToFit()
            self.Friend_2_Loc.sizeToFit()
            self.Friend_2_Uni.sizeToFit()
            self.Friend_2_Major.sizeToFit()
            self.Friend_2.adjustsFontSizeToFitWidth = true
            self.Friend_2_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_2_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_2_Major.adjustsFontSizeToFitWidth = true
            self.Friend_3.sizeToFit()
            self.Friend_3_Loc.sizeToFit()
            self.Friend_3_Uni.sizeToFit()
            self.Friend_3_Major.sizeToFit()
            self.Friend_3.adjustsFontSizeToFitWidth = true
            self.Friend_3_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_3_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_3_Major.adjustsFontSizeToFitWidth = true
            self.Friend_4.sizeToFit()
            self.Friend_4_Loc.sizeToFit()
            self.Friend_4_Uni.sizeToFit()
            self.Friend_4_Major.sizeToFit()
            self.Friend_4.adjustsFontSizeToFitWidth = true
            self.Friend_4_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_4_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_4_Major.adjustsFontSizeToFitWidth = true
            self.multi_count_add+=1;
        }
        else if(self.multi_count_add > b){
        if(remainder == 1 && b > 0){
            self.Friend_1.text = self.friendsArray[0 + b*4];
            self.Friend_1_Loc.text = self.friendlocArray[0 + b*4];
            self.Friend_1_Uni.text = self.frienduniArray[0 + b*4];
            self.Friend_1_Major.text = self.friendmajorArray[0 + b*4];
            let base64String = self.photoarray[0 + b*4];
            var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
            var decodedImage = UIImage(data: decodedData!)!
            self.Friend_1_Image.image = decodedImage
            self.Friend_1_Image.contentMode = .ScaleAspectFit
            self.Friend_2_Image.image = nil;
            self.Friend_3_Image.image = nil;
            self.Friend_4_Image.image = nil;
            conversation_info.friend_id1 = self.friendusernameArray[0 + b*4];
            conversation_info.chat_check1 = self.chatidArray[0 + b*4];
            self.Friend_1.textColor = UIColor.whiteColor();
            self.Friend_1_Loc.textColor = UIColor.whiteColor();
            self.Friend_1_Uni.textColor = UIColor.whiteColor();
            self.Friend_1_Major.textColor = UIColor.whiteColor();
            self.Friend_2.textColor = UIColor.clearColor();
            self.Friend_2_Loc.textColor = UIColor.clearColor();
            self.Friend_2_Uni.textColor = UIColor.clearColor();
            self.Friend_2_Major.textColor = UIColor.clearColor();
            self.Friend_3.textColor = UIColor.clearColor();
            self.Friend_3_Loc.textColor = UIColor.clearColor();
            self.Friend_3_Major.textColor = UIColor.clearColor();
            self.Friend_3_Uni.textColor = UIColor.clearColor();
            self.Friend_4.textColor = UIColor.clearColor();
            self.Friend_4_Loc.textColor = UIColor.clearColor();
            self.Friend_4_Major.textColor = UIColor.clearColor();
            self.Friend_4_Uni.textColor = UIColor.clearColor();
            self.Friend_2.text = "";
            self.Friend_2_Loc.text  = "";
            self.Friend_2_Uni.text = "";
            self.Friend_2_Major.text = "";
            self.Friend_3.text = "";
            self.Friend_3_Loc.text = "";
            self.Friend_3_Major.text = "";
            self.Friend_3_Uni.text = "";
            self.Friend_4.text = "";
            self.Friend_4_Loc.text = "";
            self.Friend_4_Major.text = "";
            self.Friend_4_Uni.text = "";
            self.Friend_1.sizeToFit()
            self.Friend_1_Loc.sizeToFit()
            self.Friend_1_Uni.sizeToFit()
            self.Friend_1_Major.sizeToFit()
            self.Friend_1.adjustsFontSizeToFitWidth = true
            self.Friend_1_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_1_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_1_Major.adjustsFontSizeToFitWidth = true
            self.Friend_2.sizeToFit()
            self.Friend_2_Loc.sizeToFit()
            self.Friend_2_Uni.sizeToFit()
            self.Friend_2_Major.sizeToFit()
            self.Friend_2.adjustsFontSizeToFitWidth = true
            self.Friend_2_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_2_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_2_Major.adjustsFontSizeToFitWidth = true
            self.Friend_3.sizeToFit()
            self.Friend_3_Loc.sizeToFit()
            self.Friend_3_Uni.sizeToFit()
            self.Friend_3_Major.sizeToFit()
            self.Friend_3.adjustsFontSizeToFitWidth = true
            self.Friend_3_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_3_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_3_Major.adjustsFontSizeToFitWidth = true
            self.Friend_4.sizeToFit()
            self.Friend_4_Loc.sizeToFit()
            self.Friend_4_Uni.sizeToFit()
            self.Friend_4_Major.sizeToFit()
            self.Friend_4.adjustsFontSizeToFitWidth = true
            self.Friend_4_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_4_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_4_Major.adjustsFontSizeToFitWidth = true
            //self.multi_count -= (b-1);
        }
        else if(remainder == 2 && b > 0){
            self.Friend_1.text = self.friendsArray[0 + b*4];
            self.Friend_1_Loc.text = self.friendlocArray[0 + b*4];
            self.Friend_1_Uni.text = self.frienduniArray[0 + b*4];
            self.Friend_1_Major.text = self.friendmajorArray[0 + b*4];
            let base64String = self.photoarray[0 + b*4];
            var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
            var decodedImage = UIImage(data: decodedData!)!
            self.Friend_1_Image.image = decodedImage
            self.Friend_1_Image.contentMode = .ScaleAspectFit
            self.Friend_2.text = self.friendsArray[1 + b*4];
            self.Friend_2_Loc.text = self.friendlocArray[1 + b*4];
            self.Friend_2_Uni.text = self.frienduniArray[1 + b*4];
            self.Friend_2_Major.text = self.friendmajorArray[1 + b*4];
            let base64String1 = self.photoarray[1 + b*4];
            var decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
            var decodedImage1 = UIImage(data: decodedData1!)!
            self.Friend_2_Image.image = decodedImage1
            self.Friend_2_Image.contentMode = .ScaleAspectFit
            self.Friend_3_Image.image = nil;
            self.Friend_4_Image.image = nil;
            conversation_info.friend_id1 = self.friendusernameArray[0 + b*4];
            conversation_info.chat_check1 = self.chatidArray[0 + b*4];
            conversation_info.friend_id2 = self.friendusernameArray[1 + b*4];
            conversation_info.chat_check2 = self.chatidArray[1 + b*4];
            self.Friend_1.textColor = UIColor.whiteColor();
            self.Friend_1_Loc.textColor = UIColor.whiteColor();
            self.Friend_1_Uni.textColor = UIColor.whiteColor();
            self.Friend_1_Major.textColor = UIColor.whiteColor();
            self.Friend_2.textColor = UIColor.whiteColor();
            self.Friend_2_Loc.textColor = UIColor.whiteColor();
            self.Friend_2_Uni.textColor = UIColor.whiteColor();
            self.Friend_2_Major.textColor = UIColor.whiteColor();
            self.Friend_3.textColor = UIColor.clearColor();
            self.Friend_3_Loc.textColor = UIColor.clearColor();
            self.Friend_3_Major.textColor = UIColor.clearColor();
            self.Friend_3_Uni.textColor = UIColor.clearColor();
            self.Friend_4.textColor = UIColor.clearColor();
            self.Friend_4_Loc.textColor = UIColor.clearColor();
            self.Friend_4_Major.textColor = UIColor.clearColor();
            self.Friend_4_Uni.textColor = UIColor.clearColor();
            self.Friend_3.text = "";
            self.Friend_3_Loc.text = "";
            self.Friend_3_Major.text = "";
            self.Friend_3_Uni.text = "";
            self.Friend_4.text = "";
            self.Friend_4_Loc.text = "";
            self.Friend_4_Major.text = "";
            self.Friend_4_Uni.text = "";
            self.Friend_1.sizeToFit()
            self.Friend_1_Loc.sizeToFit()
            self.Friend_1_Uni.sizeToFit()
            self.Friend_1_Major.sizeToFit()
            self.Friend_1.adjustsFontSizeToFitWidth = true
            self.Friend_1_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_1_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_1_Major.adjustsFontSizeToFitWidth = true
            self.Friend_2.sizeToFit()
            self.Friend_2_Loc.sizeToFit()
            self.Friend_2_Uni.sizeToFit()
            self.Friend_2_Major.sizeToFit()
            self.Friend_2.adjustsFontSizeToFitWidth = true
            self.Friend_2_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_2_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_2_Major.adjustsFontSizeToFitWidth = true
            self.Friend_3.sizeToFit()
            self.Friend_3_Loc.sizeToFit()
            self.Friend_3_Uni.sizeToFit()
            self.Friend_3_Major.sizeToFit()
            self.Friend_3.adjustsFontSizeToFitWidth = true
            self.Friend_3_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_3_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_3_Major.adjustsFontSizeToFitWidth = true
            self.Friend_4.sizeToFit()
            self.Friend_4_Loc.sizeToFit()
            self.Friend_4_Uni.sizeToFit()
            self.Friend_4_Major.sizeToFit()
            self.Friend_4.adjustsFontSizeToFitWidth = true
            self.Friend_4_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_4_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_4_Major.adjustsFontSizeToFitWidth = true

        }
        else if(remainder == 3 && b > 0){
            self.Friend_1.text = self.friendsArray[0 + b*4];
            self.Friend_1_Loc.text = self.friendlocArray[0 + b*4];
            self.Friend_1_Uni.text = self.frienduniArray[0 + b*4];
            self.Friend_1_Major.text = self.friendmajorArray[0 + b*4];
            let base64String = self.photoarray[0 + b*4];
            var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
            var decodedImage = UIImage(data: decodedData!)!
            self.Friend_1_Image.image = decodedImage
            self.Friend_1_Image.contentMode = .ScaleAspectFit
            self.Friend_2.text = self.friendsArray[1 + b*4];
            self.Friend_2_Loc.text = self.friendlocArray[1 + b*4];
            self.Friend_2_Uni.text = self.frienduniArray[1 + b*4];
            self.Friend_2_Major.text = self.friendmajorArray[1 + b*4];
            let base64String1 = self.photoarray[1 + b*4];
            var decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
            var decodedImage1 = UIImage(data: decodedData1!)!
            self.Friend_2_Image.image = decodedImage1
            self.Friend_2_Image.contentMode = .ScaleAspectFit
            self.Friend_3.text = self.friendsArray[2 + b*4];
            self.Friend_3_Loc.text = self.friendlocArray[2 + b*4];
            self.Friend_3_Uni.text = self.frienduniArray[2 + b*4];
            self.Friend_3_Major.text = self.friendmajorArray[2 + b*4];
            let base64String2 = self.photoarray[2 + b*4];
            var decodedData2 = NSData(base64EncodedString: base64String2, options: NSDataBase64DecodingOptions())
            var decodedImage2 = UIImage(data: decodedData2!)!
            self.Friend_3_Image.image = decodedImage2
            self.Friend_3_Image.contentMode = .ScaleAspectFit
            self.Friend_4_Image.image = nil;
            conversation_info.friend_id1 = self.friendusernameArray[0 + b*4];
            conversation_info.chat_check1 = self.chatidArray[0 + b*4];
            conversation_info.friend_id2 = self.friendusernameArray[1 + b*4];
            conversation_info.chat_check2 = self.chatidArray[1 + b*4];
            conversation_info.friend_id3 = self.friendusernameArray[2 + b*4];
            conversation_info.chat_check3 = self.chatidArray[2 + b*4];
            self.Friend_1.textColor = UIColor.whiteColor();
            self.Friend_1_Loc.textColor = UIColor.whiteColor();
            self.Friend_1_Uni.textColor = UIColor.whiteColor();
            self.Friend_1_Major.textColor = UIColor.whiteColor();
            self.Friend_2.textColor = UIColor.whiteColor();
            self.Friend_2_Loc.textColor = UIColor.whiteColor();
            self.Friend_2_Uni.textColor = UIColor.whiteColor();
            self.Friend_2_Major.textColor = UIColor.whiteColor();
            self.Friend_3.textColor = UIColor.whiteColor();
            self.Friend_3_Loc.textColor = UIColor.whiteColor();
            self.Friend_3_Major.textColor = UIColor.whiteColor();
            self.Friend_3_Uni.textColor = UIColor.whiteColor();
            self.Friend_4.textColor = UIColor.clearColor();
            self.Friend_4_Loc.textColor = UIColor.clearColor();
            self.Friend_4_Major.textColor = UIColor.clearColor();
            self.Friend_4_Uni.textColor = UIColor.clearColor();
            self.Friend_4.text = "";
            self.Friend_4_Loc.text = "";
            self.Friend_4_Major.text = "";
            self.Friend_4_Uni.text = "";
            self.Friend_1.sizeToFit()
            self.Friend_1_Loc.sizeToFit()
            self.Friend_1_Uni.sizeToFit()
            self.Friend_1_Major.sizeToFit()
            self.Friend_1.adjustsFontSizeToFitWidth = true
            self.Friend_1_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_1_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_1_Major.adjustsFontSizeToFitWidth = true
            self.Friend_2.sizeToFit()
            self.Friend_2_Loc.sizeToFit()
            self.Friend_2_Uni.sizeToFit()
            self.Friend_2_Major.sizeToFit()
            self.Friend_2.adjustsFontSizeToFitWidth = true
            self.Friend_2_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_2_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_2_Major.adjustsFontSizeToFitWidth = true
            self.Friend_3.sizeToFit()
            self.Friend_3_Loc.sizeToFit()
            self.Friend_3_Uni.sizeToFit()
            self.Friend_3_Major.sizeToFit()
            self.Friend_3.adjustsFontSizeToFitWidth = true
            self.Friend_3_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_3_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_3_Major.adjustsFontSizeToFitWidth = true
            self.Friend_4.sizeToFit()
            self.Friend_4_Loc.sizeToFit()
            self.Friend_4_Uni.sizeToFit()
            self.Friend_4_Major.sizeToFit()
            self.Friend_4.adjustsFontSizeToFitWidth = true
            self.Friend_4_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_4_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_4_Major.adjustsFontSizeToFitWidth = true

        }
        else if(remainder == 0 && b > 0){
            self.Friend_1.text = self.friendsArray[0 + b*4 - 4];
            self.Friend_1_Loc.text = self.friendlocArray[0 + b*4 - 4];
            self.Friend_1_Uni.text = self.frienduniArray[0 + b*4 - 4];
            self.Friend_1_Major.text = self.friendmajorArray[0 + b*4 - 4];
            let base64String = self.photoarray[0 + b*4 - 4];
            var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
            var decodedImage = UIImage(data: decodedData!)!
            self.Friend_1_Image.image = decodedImage
            self.Friend_1_Image.contentMode = .ScaleAspectFit
            self.Friend_2.text = self.friendsArray[1 + b*4 - 4];
            self.Friend_2_Loc.text = self.friendlocArray[1 + b*4 - 4];
            self.Friend_2_Uni.text = self.frienduniArray[1 + b*4 - 4];
            self.Friend_2_Major.text = self.friendmajorArray[1 + b*4 - 4];
            let base64String1 = self.photoarray[1 + b*4 - 4];
            var decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
            var decodedImage1 = UIImage(data: decodedData1!)!
            self.Friend_2_Image.image = decodedImage1
            self.Friend_2_Image.contentMode = .ScaleAspectFit
            self.Friend_3.text = self.friendsArray[2 + b*4 - 4];
            self.Friend_3_Loc.text = self.friendlocArray[2 + b*4 - 4];
            self.Friend_3_Uni.text = self.frienduniArray[2 + b*4 - 4];
            self.Friend_3_Major.text = self.friendmajorArray[2 + b*4 - 4];
            let base64String2 = self.photoarray[2 + b*4 - 4];
            var decodedData2 = NSData(base64EncodedString: base64String2, options: NSDataBase64DecodingOptions())
            var decodedImage2 = UIImage(data: decodedData2!)!
            self.Friend_3_Image.image = decodedImage2
            self.Friend_3_Image.contentMode = .ScaleAspectFit
            self.Friend_4.text = self.friendsArray[3 + b*4 - 4];
            self.Friend_4_Loc.text = self.friendlocArray[3 + b*4 - 4];
            self.Friend_4_Uni.text = self.frienduniArray[3 + b*4 - 4];
            self.Friend_4_Major.text = self.friendmajorArray[3 + b*4 - 4];
            let base64String3 = self.photoarray[3 + b*4 - 4];
            var decodedData3 = NSData(base64EncodedString: base64String3, options: NSDataBase64DecodingOptions())
            var decodedImage3 = UIImage(data: decodedData3!)!
            self.Friend_4_Image.image = decodedImage3
            self.Friend_4_Image.contentMode = .ScaleAspectFit
            conversation_info.friend_id1 = self.friendusernameArray[0 + b*4-4];
            conversation_info.chat_check1 = self.chatidArray[0 + b*4-4];
            conversation_info.friend_id2 = self.friendusernameArray[1 + b*4-4];
            conversation_info.chat_check2 = self.chatidArray[1 + b*4-4];
            conversation_info.friend_id3 = self.friendusernameArray[2 + b*4-4];
            conversation_info.chat_check3 = self.chatidArray[2 + b*4-4];
            conversation_info.friend_id4 = self.friendusernameArray[3 + b*4-4];
            conversation_info.chat_check4 = self.chatidArray[3 + b*4-4];
            self.Friend_1.textColor = UIColor.whiteColor();
            self.Friend_1_Loc.textColor = UIColor.whiteColor();
            self.Friend_1_Uni.textColor = UIColor.whiteColor();
            self.Friend_1_Major.textColor = UIColor.whiteColor();
            self.Friend_2.textColor = UIColor.whiteColor();
            self.Friend_2_Loc.textColor = UIColor.whiteColor();
            self.Friend_2_Uni.textColor = UIColor.whiteColor();
            self.Friend_2_Major.textColor = UIColor.whiteColor();
            self.Friend_3.textColor = UIColor.whiteColor();
            self.Friend_3_Loc.textColor = UIColor.whiteColor();
            self.Friend_3_Major.textColor = UIColor.whiteColor();
            self.Friend_3_Uni.textColor = UIColor.whiteColor();
            self.Friend_4.textColor = UIColor.whiteColor();
            self.Friend_4_Loc.textColor = UIColor.whiteColor();
            self.Friend_4_Major.textColor = UIColor.whiteColor();
            self.Friend_4_Uni.textColor = UIColor.whiteColor();
            self.Friend_1.sizeToFit()
            self.Friend_1_Loc.sizeToFit()
            self.Friend_1_Uni.sizeToFit()
            self.Friend_1_Major.sizeToFit()
            self.Friend_1.adjustsFontSizeToFitWidth = true
            self.Friend_1_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_1_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_1_Major.adjustsFontSizeToFitWidth = true
            self.Friend_2.sizeToFit()
            self.Friend_2_Loc.sizeToFit()
            self.Friend_2_Uni.sizeToFit()
            self.Friend_2_Major.sizeToFit()
            self.Friend_2.adjustsFontSizeToFitWidth = true
            self.Friend_2_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_2_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_2_Major.adjustsFontSizeToFitWidth = true
            self.Friend_3.sizeToFit()
            self.Friend_3_Loc.sizeToFit()
            self.Friend_3_Uni.sizeToFit()
            self.Friend_3_Major.sizeToFit()
            self.Friend_3.adjustsFontSizeToFitWidth = true
            self.Friend_3_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_3_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_3_Major.adjustsFontSizeToFitWidth = true
            self.Friend_4.sizeToFit()
            self.Friend_4_Loc.sizeToFit()
            self.Friend_4_Uni.sizeToFit()
            self.Friend_4_Major.sizeToFit()
            self.Friend_4.adjustsFontSizeToFitWidth = true
            self.Friend_4_Loc.adjustsFontSizeToFitWidth = true
            self.Friend_4_Uni.adjustsFontSizeToFitWidth = true
            self.Friend_4_Major.adjustsFontSizeToFitWidth = true

        }
      }
        
        /*if(self.imagecounter == 1){
        let url = NSURL(string: "https://media.licdn.com/media/AAEAAQAAAAAAAAR7AAAAJGU2YjA0NGI2LWMxZTItNDUxZS05ZGQ3LTk2MTVlNjgwNzU4NQ.jpg");
        self.Friend_1_Image.setImageWithUrl(url!, placeHolderImage: nil);
        let url1 = NSURL(string: "https://media.licdn.com/media/p/1/000/188/24d/122c234.jpg");
        self.Friend_2_Image.setImageWithUrl(url1!, placeHolderImage: nil);
        let url2 = NSURL(string: "https://media.licdn.com/media/AAEAAQAAAAAAAAV4AAAAJGZjM2YzODdmLWE5MDUtNDIxYS05OGQ5LTE0ODhkYmU4OWEzOA.jpg");
        self.Friend_3_Image.setImageWithUrl(url2!, placeHolderImage: nil);
        }
        let url3 = NSURL(string: "https://media.licdn.com/media/AAEAAQAAAAAAAAV7AAAAJGJmZjU4MDJkLTBlMTQtNDQxMi04OWNjLTNhMjYyZDM3MjU3YQ.jpg");
        self.Friend_4_Image.setImageWithUrl(url3!, placeHolderImage: nil);*/
        
    }
    
    
    override func viewDidLoad() {
        
        self.Chatroom_title.backgroundColor = UIColor.clearColor();
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.endEditing(true)

        let hours = hour();
        let minutes = minute();
        let hour_i = hour_int();
        let minute_i = minute_Int();
        
        if(hour_i > 6 && hour_i < 12){
            
            if(minute_i < 10){
                self.Time_Greetings.text = "Good Morning, the time is " + hours + " : " + "0" + minutes;
            }
            else{
                self.Time_Greetings.text = "Good Morning, the time is " + hours + " : " + minutes;
            }
            
            Time_Greetings.textColor = UIColor.whiteColor();
            
            Bkground_Image.image = UIImage(named: "Night_Sky_Pond.jpg");
            
            //Setting the User ID to login user id
            self.User_ID.text = "Welcome to Simple, " + login_user.Profile_Name;
            self.User_ID.textColor = UIColor.whiteColor();
        }
        else if(hour_i >= 12 && hour_i <= 18){
            
            if(minute_i < 10){
                self.Time_Greetings.text = "Good Afternoon, the time is " + hours + " : " + "0" + minutes;
            }
            else{
                self.Time_Greetings.text = "Good Afternoon, the time is " + hours + " : " + minutes;
            }
            
            let random = arc4random_uniform(2);
            
            if(random == 0){
                Bkground_Image.image = UIImage(named: "night_sky.jpg");
            }
            
            if(random == 1){
                Bkground_Image.image = UIImage(named: "night_sky.jpg");
            }
            
            //Setting the User ID to login user id
            self.User_ID.text = "Welcome to Simple, " + login_user.Profile_Name;
            self.User_ID.textColor = UIColor.blackColor();
        }
        else{
            
            if(minute_i < 10){
                self.Time_Greetings.text = "Good Evening, the time is " + hours + " : " + "0" + minutes;
            }
            else{
                self.Time_Greetings.text = "Good Evening, the time is " + hours + " : " + minutes;
            }
            
            
            let random = arc4random_uniform(2);
            
            if(random == 0){
                Bkground_Image.image = UIImage(named: "night_sky.jpg");
            }
            else if(random == 1){
                Bkground_Image.image = UIImage(named: "Night_Sky_Pond.jpg");
            }
            else if(random == 2){
                Bkground_Image.image = UIImage(named: "Night_Sky_Pond.jpg");
            }
            
            //Setting the User ID to login user id
            self.User_ID.text = "Welcome to Simple, " + login_user.Profile_Name;
            self.User_ID.textColor = UIColor.whiteColor();
        }
        
        let loginid = "https://simpleplus.firebaseio.com/friends/" + login_user.uid + "_fd";
        let rref = Firebase(url:loginid);

        rref.observeEventType(.Value, withBlock: { snapshot in
            for index in snapshot.children.allObjects as! [FDataSnapshot]{
                //Retrieve information from firebase
                let friends_name:String? = index.value["Profile_Name"] as? String
                let friends_loc:String? = index.value["location"] as? String
                let friends_uni:String? = index.value["Education"] as? String
                let friends_major:String? = index.value["Major"] as? String
                let friends_id:String? = index.value["Email"] as? String
                let friends_username:String? = index.value["username"] as? String
                let friends_photo:String? = index.value["Photo"] as? String
                let chat_id:Int? = index.value["Chatid"] as? Int
                
                print(friends_name);
                
                if(friends_name != nil){
                        self.friendsArray.append(friends_name!);
                        self.friendlocArray.append(friends_loc!);
                        self.frienduniArray.append(friends_uni!);
                        self.friendmajorArray.append(friends_major!);
                        self.friendidArray.append(friends_id!);
                        self.friendusernameArray.append(friends_username!);
                        self.photoarray.append(friends_photo!);
                        self.chatidArray.append(chat_id!);
                }
            }
            
            self.Friend_1.textColor = UIColor.clearColor();
            self.Friend_1_Loc.textColor = UIColor.clearColor();
            self.Friend_2.textColor = UIColor.clearColor();
            self.Friend_2_Loc.textColor = UIColor.clearColor();
            self.Friend_3.textColor = UIColor.clearColor();
            self.Friend_3_Loc.textColor = UIColor.clearColor();
            self.Friend_4.textColor = UIColor.clearColor();
            self.Friend_4_Loc.textColor = UIColor.clearColor();

            //Assigining friend's name
            let a = self.friendsArray.count;
            let remainder = a % 4;
            let b = a/4;
            
            if(self.friendsArray.count == 1){
                self.Friend_1.text = self.friendsArray[0];
                self.Friend_1_Loc.text = self.friendlocArray[0];
                self.Friend_1_Uni.text = self.frienduniArray[0];
                self.Friend_1_Major.text = self.friendmajorArray[0];
                let base64String = self.photoarray[0];
                var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
                var decodedImage = UIImage(data: decodedData!)!
                self.Friend_1_Image.image = decodedImage
                self.Friend_1_Image.contentMode = .ScaleAspectFit
                self.Friend_1.textColor = UIColor.whiteColor();
                self.Friend_1_Loc.textColor = UIColor.whiteColor();
                self.Friend_1_Major.textColor = UIColor.whiteColor();
                self.Friend_1_Uni.textColor = UIColor.whiteColor();
                
                //Assigning information to friend's class
                conversation_info.friend_id1 = self.friendusernameArray[0];
                
                //Add in Check ID
                conversation_info.chat_check1 = self.chatidArray[0];
            }
            else if(self.friendsArray.count == 2){
                
                self.Friend_1.text = self.friendsArray[0];
                self.Friend_1_Loc.text = self.friendlocArray[0];
                self.Friend_1_Uni.text = self.frienduniArray[0];
                self.Friend_1_Major.text = self.friendmajorArray[0];
                let base64String = self.photoarray[0];
                var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
                var decodedImage = UIImage(data: decodedData!)!
                self.Friend_1_Image.image = decodedImage
                self.Friend_1_Image.contentMode = .ScaleAspectFit
                self.Friend_2.text = self.friendsArray[1];
                self.Friend_2_Loc.text = self.friendlocArray[1];
                self.Friend_2_Uni.text = self.frienduniArray[1];
                self.Friend_2_Major.text = self.friendmajorArray[1];
                let base64String1 = self.photoarray[1];
                var decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
                var decodedImage1 = UIImage(data: decodedData1!)!
                self.Friend_2_Image.image = decodedImage1
                self.Friend_2_Image.contentMode = .ScaleAspectFit
                self.Friend_1.textColor = UIColor.whiteColor();
                self.Friend_1_Loc.textColor = UIColor.whiteColor();
                self.Friend_1_Major.textColor = UIColor.whiteColor();
                self.Friend_1_Uni.textColor = UIColor.whiteColor();
                self.Friend_2.textColor = UIColor.whiteColor();
                self.Friend_2_Loc.textColor = UIColor.whiteColor();
                self.Friend_2_Major.textColor = UIColor.whiteColor();
                self.Friend_2_Uni.textColor = UIColor.whiteColor();
                
                //Assigning information to friend's class
                conversation_info.friend_id1 = self.friendusernameArray[0];
                conversation_info.friend_id2 = self.friendusernameArray[1];
                
                //Add in Check ID
                conversation_info.chat_check1 = self.chatidArray[0];
                conversation_info.chat_check2 = self.chatidArray[1];
                
            }
            else if(self.friendsArray.count == 3){
                
                self.Friend_1.text = self.friendsArray[0];
                self.Friend_1_Loc.text = self.friendlocArray[0];
                self.Friend_1_Uni.text = self.frienduniArray[0];
                self.Friend_1_Major.text = self.friendmajorArray[0];
                let base64String = self.photoarray[0];
                var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
                var decodedImage = UIImage(data: decodedData!)!
                self.Friend_1_Image.image = decodedImage
                self.Friend_1_Image.contentMode = .ScaleAspectFit
                self.Friend_2.text = self.friendsArray[1];
                self.Friend_2_Loc.text = self.friendlocArray[1];
                self.Friend_2_Uni.text = self.frienduniArray[1];
                self.Friend_2_Major.text = self.friendmajorArray[1];
                let base64String1 = self.photoarray[1];
                var decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
                var decodedImage1 = UIImage(data: decodedData1!)!
                self.Friend_2_Image.image = decodedImage1
                self.Friend_2_Image.contentMode = .ScaleAspectFit
                self.Friend_3.text = self.friendsArray[2];
                self.Friend_3_Loc.text = self.friendlocArray[2];
                self.Friend_3_Uni.text = self.frienduniArray[2];
                self.Friend_3_Major.text = self.friendmajorArray[2];
                let base64String2 = self.photoarray[2];
                var decodedData2 = NSData(base64EncodedString: base64String2, options: NSDataBase64DecodingOptions())
                var decodedImage2 = UIImage(data: decodedData2!)!
                self.Friend_3_Image.image = decodedImage2
                self.Friend_3_Image.contentMode = .ScaleAspectFit
                self.Friend_1.textColor = UIColor.whiteColor();
                self.Friend_1_Loc.textColor = UIColor.whiteColor();
                self.Friend_1_Major.textColor = UIColor.whiteColor();
                self.Friend_1_Uni.textColor = UIColor.whiteColor();
                self.Friend_2.textColor = UIColor.whiteColor();
                self.Friend_2_Loc.textColor = UIColor.whiteColor();
                self.Friend_2_Major.textColor = UIColor.whiteColor();
                self.Friend_2_Uni.textColor = UIColor.whiteColor();
                self.Friend_3.textColor = UIColor.whiteColor();
                self.Friend_3_Loc.textColor = UIColor.whiteColor();
                self.Friend_3_Major.textColor = UIColor.whiteColor();
                self.Friend_3_Uni.textColor = UIColor.whiteColor();
                
                //Assigning information to friend's class
                conversation_info.friend_id1 = self.friendusernameArray[0];
                conversation_info.friend_id2 = self.friendusernameArray[1];
                conversation_info.friend_id3 = self.friendusernameArray[2];
                
                //Add in Check ID
                conversation_info.chat_check1 = self.chatidArray[0];
                conversation_info.chat_check2 = self.chatidArray[1];
                conversation_info.chat_check3 = self.chatidArray[2];
                
            }
            else if((remainder == 0 && b > 0) || (remainder == 1 && b > 0) || (remainder == 2 && b > 0) || (remainder == 3 && b > 0)){
                
                self.Friend_1.text = self.friendsArray[0];
                self.Friend_1_Loc.text = self.friendlocArray[0];
                self.Friend_1_Uni.text = self.frienduniArray[0];
                self.Friend_1_Major.text = self.friendmajorArray[0];
                let base64String = self.photoarray[0];
                var decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions())
                var decodedImage = UIImage(data: decodedData!)!
                self.Friend_1_Image.image = decodedImage
                self.Friend_1_Image.contentMode = .ScaleAspectFit
                self.Friend_2.text = self.friendsArray[1];
                self.Friend_2_Loc.text = self.friendlocArray[1];
                self.Friend_2_Uni.text = self.frienduniArray[1];
                self.Friend_2_Major.text = self.friendmajorArray[1];
                let base64String1 = self.photoarray[1];
                var decodedData1 = NSData(base64EncodedString: base64String1, options: NSDataBase64DecodingOptions())
                var decodedImage1 = UIImage(data: decodedData1!)!
                self.Friend_2_Image.image = decodedImage1
                self.Friend_2_Image.contentMode = .ScaleAspectFit
                self.Friend_3.text = self.friendsArray[2];
                self.Friend_3_Loc.text = self.friendlocArray[2];
                self.Friend_3_Uni.text = self.frienduniArray[2];
                self.Friend_3_Major.text = self.friendmajorArray[2];
                let base64String2 = self.photoarray[2];
                var decodedData2 = NSData(base64EncodedString: base64String2, options: NSDataBase64DecodingOptions())
                var decodedImage2 = UIImage(data: decodedData2!)!
                self.Friend_3_Image.image = decodedImage2
                self.Friend_3_Image.contentMode = .ScaleAspectFit
                self.Friend_4.text = self.friendsArray[3];
                self.Friend_4_Loc.text = self.friendlocArray[3];
                self.Friend_4_Uni.text = self.frienduniArray[3];
                self.Friend_4_Major.text = self.friendmajorArray[3];
                let base64String3 = self.photoarray[3];
                var decodedData3 = NSData(base64EncodedString: base64String3, options: NSDataBase64DecodingOptions())
                var decodedImage3 = UIImage(data: decodedData3!)!
                self.Friend_4_Image.image = decodedImage3
                self.Friend_4_Image.contentMode = .ScaleAspectFit
                self.Friend_1.textColor = UIColor.whiteColor();
                self.Friend_1_Loc.textColor = UIColor.whiteColor();
                self.Friend_1_Major.textColor = UIColor.whiteColor();
                self.Friend_1_Uni.textColor = UIColor.whiteColor();
                self.Friend_2.textColor = UIColor.whiteColor();
                self.Friend_2_Loc.textColor = UIColor.whiteColor();
                self.Friend_2_Major.textColor = UIColor.whiteColor();
                self.Friend_2_Uni.textColor = UIColor.whiteColor();
                self.Friend_3.textColor = UIColor.whiteColor();
                self.Friend_3_Loc.textColor = UIColor.whiteColor();
                self.Friend_3_Major.textColor = UIColor.whiteColor();
                self.Friend_3_Uni.textColor = UIColor.whiteColor();
                self.Friend_4.textColor = UIColor.whiteColor();
                self.Friend_4_Loc.textColor = UIColor.whiteColor();
                self.Friend_4_Major.textColor = UIColor.whiteColor();
                self.Friend_4_Uni.textColor = UIColor.whiteColor();
                
                //Assigning information to friend's class
                conversation_info.friend_id1 = self.friendusernameArray[0];
                conversation_info.friend_id2 = self.friendusernameArray[1];
                conversation_info.friend_id3 = self.friendusernameArray[2];
                conversation_info.friend_id4 = self.friendusernameArray[3];
                
                //Add in Check ID
                conversation_info.chat_check1 = self.chatidArray[0];
                conversation_info.chat_check2 = self.chatidArray[1];
                conversation_info.chat_check3 = self.chatidArray[2];
                conversation_info.chat_check4 = self.chatidArray[3];
            }
        })
            //Testing with erik's photo online
            /*let url = NSURL(string: "https://media.licdn.com/media/p/6/005/0a0/376/1c3abce.jpg")
            let url1 = NSURL(string: "https://media.licdn.com/media/AAEAAQAAAAAAAAjlAAAAJDZkZmE3MDBjLWU3MWEtNGFkNC1hMWQ3LWM0NGZjN2JmMzQyMw.jpg")
            let url2 = NSURL(string:"https://media.licdn.com/media/p/4/000/176/03c/02baf1e.jpg")
            let url3 = NSURL(string:"https://media.licdn.com/media/p/7/005/01d/2f5/3d52f84.jpg")
            self.Friend_1_Image.setImageWithUrl(url!, placeHolderImage: nil);
            self.Friend_2_Image.setImageWithUrl(url1!, placeHolderImage: nil);
            self.Friend_3_Image.setImageWithUrl(url2!, placeHolderImage: nil);
            self.Friend_4_Image.setImageWithUrl(url3!, placeHolderImage: nil);*/
        
        self.Friend_1.sizeToFit()
        self.Friend_1_Loc.sizeToFit()
        self.Friend_1_Uni.sizeToFit()
        self.Friend_1_Major.sizeToFit()
        self.Friend_1.adjustsFontSizeToFitWidth = true
        self.Friend_1_Loc.adjustsFontSizeToFitWidth = true
        self.Friend_1_Uni.adjustsFontSizeToFitWidth = true
        self.Friend_1_Major.adjustsFontSizeToFitWidth = true
        self.Friend_2.sizeToFit()
        self.Friend_2_Loc.sizeToFit()
        self.Friend_2_Uni.sizeToFit()
        self.Friend_2_Major.sizeToFit()
        self.Friend_2.adjustsFontSizeToFitWidth = true
        self.Friend_2_Loc.adjustsFontSizeToFitWidth = true
        self.Friend_2_Uni.adjustsFontSizeToFitWidth = true
        self.Friend_2_Major.adjustsFontSizeToFitWidth = true
        self.Friend_3.sizeToFit()
        self.Friend_3_Loc.sizeToFit()
        self.Friend_3_Uni.sizeToFit()
        self.Friend_3_Major.sizeToFit()
        self.Friend_3.adjustsFontSizeToFitWidth = true
        self.Friend_3_Loc.adjustsFontSizeToFitWidth = true
        self.Friend_3_Uni.adjustsFontSizeToFitWidth = true
        self.Friend_3_Major.adjustsFontSizeToFitWidth = true
        self.Friend_4.sizeToFit()
        self.Friend_4_Loc.sizeToFit()
        self.Friend_4_Uni.sizeToFit()
        self.Friend_4_Major.sizeToFit()
        self.Friend_4.adjustsFontSizeToFitWidth = true
        self.Friend_4_Loc.adjustsFontSizeToFitWidth = true
        self.Friend_4_Uni.adjustsFontSizeToFitWidth = true
        self.Friend_4_Major.adjustsFontSizeToFitWidth = true
        
        
    }

    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    func loadDestinationVC(){
        self.performSegueWithIdentifier("Show_Chat_Detail", sender: nil)
    }
    
    func loadDestinationVC1(){
        self.performSegueWithIdentifier("Friend_Profile", sender: nil)
    }
    
    
    //Functions that will be used to display the time
    func hour() -> String
    {
        //Get Hour
        let date:NSDate = NSDate();
        let calendar: NSCalendar = NSCalendar.currentCalendar();
        let components:NSDateComponents = calendar.components(
            NSCalendarUnit.NSHourCalendarUnit, fromDate: date)
        let hours = components.hour
        let hour = String(hours);
        //Return Hour
        return hour
    }
    
    func hour_int() -> Int
    {
        //Get Hour
        let date:NSDate = NSDate();
        let calendar: NSCalendar = NSCalendar.currentCalendar();
        let components:NSDateComponents = calendar.components(
            NSCalendarUnit.NSHourCalendarUnit, fromDate: date)
        let hours = components.hour
        let hour = Int(hours);
        //Return Hour
        return hour
    }
    
    
    func minute() -> String
    {
        //Get Minute
        let date:NSDate = NSDate();
        let calendar: NSCalendar = NSCalendar.currentCalendar();
        let components:NSDateComponents = calendar.components(
            NSCalendarUnit.NSMinuteCalendarUnit, fromDate: date)
        let minutes = components.minute
        let minute = String(minutes);
        //Return Minute
        return minute
    }
    
    func minute_Int() -> Int
    {
        //Get Minute
        let date:NSDate = NSDate();
        let calendar: NSCalendar = NSCalendar.currentCalendar();
        let components:NSDateComponents = calendar.components(
            NSCalendarUnit.NSMinuteCalendarUnit, fromDate: date)
        let minutes = components.minute
        let minute = Int(minutes);
        //Return Minute
        return minute
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
};

