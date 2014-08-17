//
//  APIController.swift
//  helloworld
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import Foundation

protocol APICreatedEventsControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class APICreatedEventsController {
    
    var delegate: APICreatedEventsControllerProtocol?
    
    init() {
        
    }
    
    func loadAllEvents() {
        println("APIController#loadAllEvents")
        let urlPath = "http://localhost:3000/users/1/created.json"
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
    
}