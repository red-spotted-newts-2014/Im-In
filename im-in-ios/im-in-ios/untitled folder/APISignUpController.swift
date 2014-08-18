//
//  APIController.swift
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import Foundation

protocol APISignUpControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class APISignUpController {
    
    var delegate: APISignUpControllerProtocol?
    
    init() {
        
    }

    func sendSignUpInfo(info: NSDictionary) {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://10.0.2.26:3000/users"))
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var params = ["username": info.objectForKey("username"), "email": info.objectForKey("email"), "password": info.objectForKey("password")] as Dictionary
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("\(countElements(params))", forHTTPHeaderField: "Content-Length")

        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        connection.start()
        println("Sending request")
    }
}