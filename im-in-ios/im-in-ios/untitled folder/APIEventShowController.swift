//
//  APIController.swift
//  helloworld
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import Foundation

protocol APIEventShowControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class APIEventShowController {
    
    var delegate: APIEventShowControllerProtocol?
    
    init() {
        
    }
    
    func sendLogInInfo(info: NSDictionary) {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/users/login_ios"))
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
    
}