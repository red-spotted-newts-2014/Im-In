//
//  ViewController.swift
//  Im_in
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import UIKit

//
//, APIControllerProtocol
class FriendsProfileViewController: UIViewController {
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var emailField: UITextField!

    
    var friendData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.userInteractionEnabled = false
        lastNameField.userInteractionEnabled = false
        usernameField.userInteractionEnabled = false
        phoneField.userInteractionEnabled = false
        emailField.userInteractionEnabled = false
        
        
        firstNameField.text = friendData.objectForKey("first_name") as String
        lastNameField.text = friendData.objectForKey("last_name") as String
        usernameField.text = friendData.objectForKey("username") as String
        phoneField.text = friendData.objectForKey("phone_number") as String
        emailField.text = friendData.objectForKey("email") as String

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


