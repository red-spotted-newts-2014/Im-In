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
    
    func sendLogInInfo(info: NSDictionary) {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://10.0.2.26:3000/users/login_ios"))
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var params = ["username": info.objectForKey("username"),"password": info.objectForKey("password")] as Dictionary
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("\(countElements(params))", forHTTPHeaderField: "Content-Length")
        
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        connection.start()
        println("Sending request")
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        println("pressed")
        var params = ["username": usernameField.text, "password": passwordField.text] as Dictionary
        apiCtrl.sendLogInInfo(params)
    }
}


