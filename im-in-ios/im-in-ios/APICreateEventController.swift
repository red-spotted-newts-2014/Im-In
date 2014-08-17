//
//  APIController.swift
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import Foundation

protocol APICreateEventControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class APICreateEventController {
    
    var delegate: APICreateEventControllerProtocol?
    
    init() {
        
    }
    
    func sendCreateEventInfo(info: NSDictionary) {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/events"))
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var params = ["name": info.objectForKey("name"),"description": info.objectForKey("description"), "start_time": info.objectForKey("start_time"), "end_time": info.objectForKey("end_time"), "venue": info.objectForKey("venue"), "location": info.objectForKey("location"), "notify_user?": info.objectForKey("notify_user?"), "notify_hours_until_event": info.objectForKey("notify_hours_until_event")] as Dictionary
        
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