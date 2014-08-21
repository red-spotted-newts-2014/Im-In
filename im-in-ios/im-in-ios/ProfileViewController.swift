//
//  ProfileViewController.swift
//  im-in-ios
//
//  Created by Christian Moon on 8/19/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, APIProfileControllerProtocol {

    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    var profileData: NSDictionary!
    
    var apiCtrl = APIProfileController()
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("ProfileViewController#didReceiveAPIResults")
        println(results["user"])
        profileData = results["user"] as NSDictionary
        println(profileData)
    }
    
    func didLogOut(results: NSDictionary) {
        println("logged out")
        println(results)
    }
    
    @IBAction func logoutButton(sender: AnyObject) {
        apiCtrl.logout()
        dispatch_async(dispatch_get_main_queue(),{
            self.performSegueWithIdentifier("logoutSegue" as String, sender: self)
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.userInteractionEnabled = false
        lastNameField.userInteractionEnabled = false
        usernameField.userInteractionEnabled = false
        phoneField.userInteractionEnabled = false
        emailField.userInteractionEnabled = false
        
        apiCtrl.delegate = self
        apiCtrl.loadProfile()
        
        println(firstNameField.text)
        
//        firstNameField.text = profileData.objectForKey("first_name") as? String
//       lastNameField.text = profileData.objectForKey("last_name") as? String
//     usernameField.text = profileData.objectForKey("username") as? String
//       phoneField.text = profileData.objectForKey("phone_number") as? String
//      emailField.text = profileData.objectForKey("email") as? String
//
        
//        firstNameField.text = profileData["first_name"].stringValue
//        lastNameField.text = profileData["last_name"].stringValue
//        usernameField.text = profileData["username"].stringValue
//        phoneField.text = profileData["phone_number"].stringValue
//        emailField.text = profileData["email"].stringValue
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



