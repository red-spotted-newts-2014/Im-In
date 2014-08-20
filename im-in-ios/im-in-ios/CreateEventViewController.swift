//
//  AddEventViewController.swift
//  im-in-ios
//
//  Created by joel yawili on 8/18/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UITextFieldDelegate
//, APIAddEventControllerProtocol, NSURLConnectionDataDelegate, NSURLConnectionDelegate


{
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        let touch = event.allTouches().anyObject() as UITouch
        if nameTextField.isFirstResponder() && touch.view != nameTextField {
            nameTextField.resignFirstResponder()}
            
        else if descTextField.isFirstResponder() && touch.view != descTextField {
            descTextField.resignFirstResponder()}
            
        else if venueTextField.isFirstResponder() && touch.view != venueTextField {
            venueTextField.resignFirstResponder()}
            
        else if locationTextField.isFirstResponder() && touch.view != locationTextField {
            locationTextField.resignFirstResponder()}
        
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func viewDidLoad() {
        startTextField.hidden = true
        
        endTextField.hidden = true
        
        startTextField.userInteractionEnabled = false
        
        endTextField.userInteractionEnabled = false
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        endDatePicker.hidden = true
        startDatePicker.hidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var descTextField: UITextView!
    
    
    @IBOutlet var venueTextField: UITextField!
    
    @IBOutlet var locationTextField: UITextField!
    
    @IBOutlet var startTextField: UITextField!
    
    @IBOutlet var endTextField: UITextField!
    
    @IBOutlet var startDatePicker: UIDatePicker!
    
    @IBOutlet var endDatePicker: UIDatePicker!
    
    @IBAction func startDateButton(sender: AnyObject) {
        hideEndDatePicker()
        showStartDatePicker()
    }
    
    @IBAction func endDateButton(sender: AnyObject) {
        hideStartDatePicker()
        showEndDatePicker()
    }
    
    @IBAction func confirmDates(sender: AnyObject) {
        startTextField.hidden = false
        
        endTextField.hidden = false
        
        startTextField.text = "\(startDatePicker.date)"
        endTextField.text = "\(endDatePicker.date)"
        
        startDatePicker.hidden = true
        endDatePicker.hidden = true

    }
 
    
    func showStartDatePicker() {
            println("showing Start Date Picker")
            self.view.addSubview(startDatePicker)
            startDatePicker.frame = CGRectMake(0,100,320, 50);
            UIView.animateWithDuration(1.0, animations: animStartDatePicker)
            startDatePicker.backgroundColor = UIColor( white:1, alpha:1)
            self.view.backgroundColor = UIColor(white:1, alpha: 1)
            hideEndDatePicker()
    };
    
    func showEndDatePicker() {
        println("showing End Date Picker")
        self.view.addSubview(endDatePicker)
        endDatePicker.frame = CGRectMake(0,100,320, 50);
        UIView.animateWithDuration(1.0, animations: animEndDatePicker)
        endDatePicker.backgroundColor = UIColor( white:1, alpha:1)
        self.view.backgroundColor = UIColor(white:1, alpha: 1)
        hideStartDatePicker()
    };
    



    var params: NSDictionary?
    
    
    var inviteFriendsCtrl = FollowersViewController()
//    var newEventId: NSString!
//    var apiCtrl = APIAddEventController()

//    func didReceiveAPIResults(results: AnyObject!) {
//        println("AddEventViewController#didReceiveAPIResults")
//        newEventId = results.objectForKey("id").stringValue as String
//        println(newEventId)
////        println(results)
//    }
    
  
    
    
    @IBAction func addEventButton(sender: AnyObject) {
        println("print this SHIT!")
        params = ["name": nameTextField.text, "description": descTextField.text, "start_time": startTextField.text, "end_time": endTextField.text, "venue": venueTextField.text, "location": locationTextField.text] as Dictionary
//        apiCtrl.delegate = self
//        apiCtrl.sendCreateEventInfo(params)
        println(params)
        
//        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//
//        var eventList:NSMutableArray! = userDefaults.objectForKey("eventList") as? NSMutableArray
//
//        var dataSet:NSMutableDictionary = NSMutableDictionary()
//        dataSet.setObject(nameTextField.text, forKey: "name")
//        dataSet.setObject(descTextField.text, forKey: "description")
//        dataSet.setObject(startTextField.text, forKey: "start_time")
//        dataSet.setObject(endTextField.text, forKey: "end_time")
//        dataSet.setObject(venueTextField.text, forKey: "venue")
//        dataSet.setObject(locationTextField.text, forKey: "location")
//
//        if ((eventList) != nil){
//            var newMutableList:NSMutableArray = NSMutableArray();
//
//            for dict:AnyObject in eventList!{
//                newMutableList.addObject(dict as NSDictionary)
//            }
//
//            userDefaults.removeObjectForKey("eventList")
//            newMutableList.addObject(dataSet)
//            userDefaults.setObject(newMutableList, forKey: "eventList")
//
//
//        }else{
//            userDefaults.removeObjectForKey("eventList")
//            eventList = NSMutableArray()
//            eventList!.addObject(dataSet)
//            userDefaults.setObject(eventList, forKey: "eventList" )
//        }
//
//        userDefaults.synchronize()
//
//        self.navigationController.popToRootViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue!.identifier == "inviteFriendSegue"){
            var followersViewController:FollowersViewController = segue!.destinationViewController as FollowersViewController
            followersViewController.params = params
        }
    }
    
    
//
    
    
//    func textFieldShouldBeginEditing(textField: UITextField!) -> Bool {
//        if (textField ==  startTextField) {
//            showDatePicker()
//            var start_time_from_date_picker = startTextField
//            println("selected start time field")
//            println(startDatePicker.date)
//            return false;
//        }
//        else if( textField ==  endTextField){
//            showDatePicker()
//            var end_time_from_date_picker = endTextField
//            println("selected end time field")
//            println(endDatePicker.date)
//            return false;
//        }
//        else {
//        hideDatePicker()
//
//        return true;
//        }
//    }
    
//    func startDatePickerDidEndEditing(textField: UITextField!) -> Bool {
//        if (textField ==  startTextField) {
//            startTextField.text = "\(startTimeDatePicker.date)"
//            println("selected start time field")
//            println(startTimeDatePicker.date)
//            hideDatePicker();
//            return false;
//        }
//        else if( textField ==  endTextField){
//            showDatePicker();
//            var end_time_from_date_picker = endTextField
//            println("selected end time field")
//            return false;
//        }
//        else {
//            hideDatePicker()
//
//            return true;
//        }
//    }
    
    
    func animStartDatePicker() {
        startDatePicker.backgroundColor = UIColor( white:1, alpha:1)
        self.view.backgroundColor = UIColor(white:1, alpha: 1)
    }
    
    func animEndDatePicker() {
        endDatePicker.backgroundColor = UIColor( white:1, alpha:1)
        self.view.backgroundColor = UIColor(white:1, alpha: 1)
    }
    
    
    func hideStartDatePicker() {
        startDatePicker.frame = CGRectMake(0,-250,320,260)
        
    }
    
    func hideEndDatePicker() {
        endDatePicker.frame = CGRectMake(0,-250,320,260)
    }
    
}
    


