//
//  APIController.swift
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import Foundation

protocol APIAddEventControllerProtocol {
    func didReceiveAPIResults(results: AnyObject!)
}

class APIAddEventController {
    
    var delegate: APIAddEventControllerProtocol?
    var param: NSDictionary?
    
    init() {
        
    }
    
    func sendCreateEventInfo(info: NSDictionary) {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/events"))
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var params = ["name": info.objectForKey("name"),"description": info.objectForKey("description"), "start_time": info.objectForKey("start_time"), "end_time": info.objectForKey("end_time"), "venue": info.objectForKey("venue"), "location": info.objectForKey("location")] as Dictionary
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as AnyObject!
            
//            if(err) {
//                println(err!.localizedDescription)
//            }
//            else {
//                var success = json["success"] as? Int
//                println("Succes: \(success)")
//            }
            self.delegate?.didReceiveAPIResults(json)
        })
        
        task.resume()
    }
    
    func sendInviteInfo(users: NSMutableArray, params: NSDictionary) {
        println("at the api")
//        println(users)
//        println(params)
        var param = ["event":params, "users":users]
        println("******")
        println(param)
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/events/create_ios"))
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"

//        var params = ["name": info.objectForKey("name"),"description": info.objectForKey("description"), "start_time": info.objectForKey("start_time"), "end_time": info.objectForKey("end_time"), "venue": info.objectForKey("venue"), "location": info.objectForKey("location")] as Dictionary

        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(param, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("\(countElements(param))", forHTTPHeaderField: "Content-Length")

        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        connection.start()
        println("Sending request")
    }
}