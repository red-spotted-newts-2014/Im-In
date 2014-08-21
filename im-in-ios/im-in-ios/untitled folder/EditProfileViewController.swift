////
////  ViewController.swift
////  Im_in
////
////  Created by fahia mohamed on 2014-08-14.
////  Copyright (c) 2014 fahia mohamed. All rights reserved.
////
//
//import UIKit
//
//class EditProfileViewController: UIViewController, APIEditProfileViewControllerProtocol, NSURLConnectionDataDelegate, NSURLConnectionDelegate {
//    
//    var apiCtrl = APIEditProfileViewController()
//    
//    @IBOutlet weak var firstNameField: UITextField!
//    @IBOutlet weak var lastNameField: UITextField!
//    @IBOutlet weak var usernameField: UITextField!
//    @IBOutlet weak var phoneNumberField: UITextField!
//    @IBOutlet weak var emailField: UITextField!
//    @IBOutlet weak var editProfileButton: UIButton!
//
//    func didReceiveAPIResults(results: NSDictionary) {
//        println("EditProfileViewController#didReceiveAPIResults")
//    }
//    
//    @IBAction func buttonPressed(sender: AnyObject) {
//        println("pressed")
//        var params = ["username": usernameField.text, "first_name": firstNameField.text, "last_name": lastNameField.text, "phone_number": phoneNumberField.text, "email": emailField.text] as Dictionary
//        apiCtrl.sendEditProfileInfo(params)
//    }
//    
//}
