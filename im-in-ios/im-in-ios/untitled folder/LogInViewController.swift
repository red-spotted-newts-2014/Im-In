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
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("LogInViewController#didReceiveAPIResults")
    }
    @IBOutlet weak var incorrectEntry: UITextField!
    
    @IBAction func loginButton(sender: AnyObject) {
        var usr = "usr"
        var pass = "pass"
        
        if usernameField.text == usr &&
            passwordField.text == pass
        {
            
            usernameField.resignFirstResponder()
            passwordField.resignFirstResponder()
            
        }
        else
        {
            incorrectEntry.text = "Incorrect username/password"
            usernameField.resignFirstResponder()
            passwordField.resignFirstResponder()
    }
//    @IBAction func buttonPressed(sender: AnyObject) {
//        println("pressed")
//        var params = ["username": usernameField.text, "password": passwordField.text] as Dictionary
//        apiCtrl.sendLogInInfo(params)
    }
    
    
}


