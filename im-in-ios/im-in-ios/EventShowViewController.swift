//
//  EventShowViewController2.swift
//  im-in-ios
//
//  Created by joel yawili on 8/17/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class EventShowViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descTextField: UITextView!
    @IBOutlet var venueTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var startTextField: UITextField!
    @IBOutlet var endTextField: UITextField!
    @IBOutlet var creatorField: UITextField!
    @IBOutlet var eventIDField: UITextField!
    var invitationStatus: String!
    var invitationId: String!
    var eventId: String!
    var info: NSDictionary!

    @IBOutlet var areuin: UIButton!
    @IBOutlet var chat: UIButton!
    
    var apiCtrl = APIEventShowController()
    var eventData:NSDictionary = NSDictionary()
    var invitationData:NSDictionary = NSDictionary()
    var invitedEventCtrl = InvitedEventViewController()
    
    
        @IBAction func areuin(sender: AnyObject) {
            if (invitationStatus == "pending") {
                areuin.backgroundColor = UIColor.lightGrayColor()
                areuin.setTitle("I'M IN", forState: .Normal)
                invitationStatus = "in"
                chat.hidden = false;
            } else if (invitationStatus == "in") {
                areuin.backgroundColor = UIColor.grayColor()
                areuin.setTitle("ARE YOU IN?", forState: .Normal)
                invitationStatus = "pending"
                chat.hidden = true;
            }
            info = ["eventId": eventId, "invitationId": invitationId, "invitationStatus": invitationStatus] as NSDictionary
            apiCtrl.sendInvitationStatusInfo(info)
        }
    
    

    
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
        eventIDField.text = eventData.objectForKey("id").stringValue as String
        eventId = eventIDField.text
        invitationStatus = invitationData.objectForKey("status") as String
        invitationId = invitationData.objectForKey("id").stringValue as String
        
        if (invitationStatus == "pending") {
            areuin.backgroundColor = UIColor.grayColor()
            areuin.setTitle("ARE YOU IN ?", forState: .Normal)
            chat.hidden = true;
        } else if (invitationStatus == "in") {
            areuin.backgroundColor = UIColor.lightGrayColor()
            areuin.setTitle("I'M IN", forState: .Normal)
            chat.hidden = false;
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue!.identifier == "toAttending"){
            var friendsAttendingViewController:FriendsAttendingViewController = segue!.destinationViewController as FriendsAttendingViewController
            friendsAttendingViewController.eventID = eventIDField.text
        } else if (segue!.identifier == "chatSegue"){
            var chatViewController:ChatViewController = segue!.destinationViewController as ChatViewController
            chatViewController.eventId = eventIDField.text
            chatViewController.eventName = nameTextField.text
        }
    }
}
