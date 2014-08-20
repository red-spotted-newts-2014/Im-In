//
//  ViewController.swift
//  Im_in
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, APISignUpControllerProtocol, NSURLConnectionDataDelegate, NSURLConnectionDelegate {
    
    var apiCtrl = APISignUpController()
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        let touch = event.allTouches().anyObject() as UITouch
        if usernameField.isFirstResponder() && touch.view != usernameField {
            usernameField.resignFirstResponder()}
            
        else if passwordField.isFirstResponder() && touch.view != passwordField {
            passwordField.resignFirstResponder()}
        
        else if emailField.isFirstResponder() && touch.view != emailField {
            emailField.resignFirstResponder()}
        
        super.touchesBegan(touches, withEvent: event)
    }

    
    func didReceiveAPIResults(results: NSDictionary) {
        println("SignUpViewController#didReceiveAPIResults")
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        println("pressed")
        var params = ["username": usernameField.text, "email": emailField.text, "password": passwordField.text] as Dictionary
        apiCtrl.sendSignUpInfo(params)
    }
    
}


