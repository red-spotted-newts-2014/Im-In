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
    
    func sendInvitationStatusInfo(info: AnyObject) {
        var eventId = info.objectForKey("eventId") as String
        var invitationId = info.objectForKey("invitationId") as String
        println("http://10.0.2.26:3000/events/" + eventId + "/invitations/" + invitationId)
        var request = NSMutableURLRequest(URL: NSURL(string: "http://10.0.2.26:3000/events/" + eventId + "/invitations/" + invitationId))
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "PATCH"
        
        var params = ["status": info.objectForKey("invitationStatus")] as Dictionary
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