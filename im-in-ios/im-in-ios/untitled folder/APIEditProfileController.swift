//
//    APIController.swift
//  
//    Created by fahia mohamed on 2014-08-14.
//    Copyright (c) 2014 fahia mohamed. All rights reserved.
//  
// 

 import Foundation
 
 protocol APIEditProfileViewControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
 }
 
 class APIEditProfileViewController {
     
     var delegate: APIEditProfileViewControllerProtocol?
     
     init() {
         
     }
     
     func sendEditProfileInfo(info: NSDictionary) {
         var request = NSMutableURLRequest(URL: NSURL(string: "http://10.0.2.26:3000/users/edit"))
         var session = NSURLSession.sharedSession()
         request.HTTPMethod = "POST"
         
         var params = ["username": info.objectForKey("username"), "email": info.objectForKey("email"), "phone": info.objectForKey("phone_number")] as Dictionary
         
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