//
//  ViewController.swift
//  Im_in
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, APICreateEventControllerProtocol, NSURLConnectionDataDelegate, NSURLConnectionDelegate {
    
    var apiCtrl = APICreateEventController()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var venueField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var startTimeField: UITextField!
    @IBOutlet weak var endTimeField: UITextField!
    @IBOutlet weak var notifyUserField: UITextField!
    @IBOutlet weak var notifyHoursUntilEventField: UITextField!
    @IBOutlet weak var createEventButton: UIButton!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("CreateEventViewController#didReceiveAPIResults")
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        println("pressed")
        var params = ["name": nameField.text, "description": descriptionField.text, "start_time": startTimeField.text, "end_time": endTimeField.text, "venue": venueField.text, "location": locationField.text, "notify_user?": notifyUserField.text, "notify_hours_until_event": notifyHoursUntilEventField.text ] as Dictionary
        apiCtrl.sendCreateEventInfo(params)
    }
    
}
