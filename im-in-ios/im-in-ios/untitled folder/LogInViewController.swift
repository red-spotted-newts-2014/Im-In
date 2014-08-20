//
//  ViewController.swift
//  Im_in
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import UIKit

class LogInViewController: GlobalController, APILogInControllerProtocol, NSURLConnectionDataDelegate, NSURLConnectionDelegate {
    
    var apiCtrl = APILogInController()
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("LogInViewController#didReceiveAPIResults")
        println("************")
        println(results)
    }
    @IBOutlet weak var incorrectEntry: UITextField!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        

        println("pressed")

        var params = ["username": usernameField.text, "password": passwordField.text] as Dictionary
        apiCtrl.delegate? = self
        apiCtrl.sendLogInInfo(params)
    }
}


