//
//  ViewController.swift
//  Im_in
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, APILogInControllerProtocol, NSURLConnectionDataDelegate, NSURLConnectionDelegate {
    
    var apiCtrl = APILogInController()
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("LogInViewController#didReceiveAPIResults")
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        println("pressed")
        var params = ["username": usernameField.text, "password": passwordField.text] as Dictionary
        apiCtrl.sendLogInInfo(params)
    }
    
}


