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
    
    var profileData: NSDictionary
    
    var apiCtrl = APIProfileViewController()
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("FollowingViewController#didReceiveAPIResults")
        profileData = results
        println(profileData)
//        dispatch_async(dispatch_get_main_queue(),{
//            self.tableView.reloadData()
//        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.userInteractionEnabled = false
        lastNameField.userInteractionEnabled = false
        usernameField.userInteractionEnabled = false
        phoneField.userInteractionEnabled = false
        emailField.userInteractionEnabled = false

        
        firstNameField.text = profileData.objectForKey("name") as String
        lastNameField.text = profileData.objectForKey("username") as String
        usernameField.text = profileData.objectForKey("description") as String
        phoneField.text = profileData.objectForKey("venue") as String
        emailField.text = profileData.objectForKey("location") as String
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



