//
//  EventShowViewController2.swift
//  im-in-ios
//
//  Created by joel yawili on 8/17/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descTextField: UITextView!
    @IBOutlet var venueTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var startTextField: UITextField!
    @IBOutlet var endTextField: UITextField!
    
    var eventData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nsd = NSDateFormatter()
        
        nsd.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        var start_time = nsd.dateFromString(eventData.objectForKey("start_time") as String)
        var end_time = nsd.dateFromString(eventData.objectForKey("end_time") as String)
        
        let display = NSDateFormatter()
        display.dateFormat = "MMM,dd,yyyy, hh:mm a "
        var correct_start_time_format = display.stringFromDate(start_time)
        var correct_end_time_format = display.stringFromDate(end_time)
        
        nameTextField.userInteractionEnabled = false
        descTextField.userInteractionEnabled = false
        venueTextField.userInteractionEnabled = false
        locationTextField.userInteractionEnabled = false
        startTextField.userInteractionEnabled = false
        endTextField.userInteractionEnabled = false
        
        nameTextField.text = eventData.objectForKey("name") as String
        descTextField.text = eventData.objectForKey("description") as String
        venueTextField.text = eventData.objectForKey("venue") as String
        locationTextField.text = eventData.objectForKey("location") as String
        startTextField.text = correct_start_time_format
        endTextField.text = correct_end_time_format
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        if (segue!.identifier == "toChat"){
//            var chatViewController:ChatViewController = segue!.destinationViewController as ChatViewController
//            chatViewController.eventName = nameTextField.text
//        }
//    }

}



