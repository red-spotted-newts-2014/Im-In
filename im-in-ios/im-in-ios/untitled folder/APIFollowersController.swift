//
//  APIController.swift
//  helloworld
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import Foundation

protocol APIFollowersControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class APIFollowersController {
    
    var delegate: APIFollowersControllerProtocol?
    
    init() {
        
    }
    
    func loadAllEvents() {
        println("APIController#loadAllEvents")
        let urlPath = "http://localhost:3000/users/1/followers.json"
        let url: NSURL = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
            self.delegate?.didReceiveAPIResults(jsonResult) // THIS IS THE NEW LINE!!
        })
        task.resume()
    }
    
//    func sendInviteInfo(info: NSDictionary) {
//        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/events"))
//        var session = NSURLSession.sharedSession()
//        request.HTTPMethod = "POST"
//        
//        var params = ["name": info.objectForKey("name"),"description": info.objectForKey("description"), "start_time": info.objectForKey("start_time"), "end_time": info.objectForKey("end_time"), "venue": info.objectForKey("venue"), "location": info.objectForKey("location")] as Dictionary
//        
//        var err: NSError?
//        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue("\(countElements(params))", forHTTPHeaderField: "Content-Length")
//        
//        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
//        
//        connection.start()
//        println("Sending request")
//    }
    
}