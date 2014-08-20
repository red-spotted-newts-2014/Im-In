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
    
    
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var descTextField: UITextView!
    @IBOutlet var venueTextField: UITextField!
    
    @IBOutlet var locationTextField: UITextField!
    
    @IBOutlet var startTexTField: UITextField!
    
    @IBOutlet var endTextField: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var endDatePicker: UIDatePicker!
    
    
    @IBAction func startDateButton(sender: AnyObject) {
        
                hideEndDatePicker()
                showDatePicker()
        datePicker.hidden = false
    }

    @IBAction func endDateButton(sender: AnyObject) {
        
                hideStartDatePicker()
                showEndDatePicker()
        
        endDatePicker.hidden = false
    }
    
    
    @IBAction func confirmDatesButton(sender: AnyObject) {
        
                startTexTField.hidden = false
        
                endTextField.hidden = false
        
                startTexTField.text = "\(datePicker.date)"
                endTextField.text = "\(endDatePicker.date)"
        
                datePicker.hidden = true
                endDatePicker.hidden = true
    }
    
    
    
    func showDatePicker() {
        println("showing Start Date Picker")
        self.view.addSubview(datePicker)
        datePicker.frame = CGRectMake(0,100,320, 50);
        UIView.animateWithDuration(1.0, animations: animStartDatePicker)
        datePicker.backgroundColor = UIColor( white:1, alpha:1)
        self.view.backgroundColor = UIColor(white:1, alpha: 1)
        endDatePicker.hidden = true
    }
    
    func showEndDatePicker() {
        println("showing End Date Picker")
        self.view.addSubview(endDatePicker)
        endDatePicker.frame = CGRectMake(0,100,320, 50);
        UIView.animateWithDuration(1.0, animations: animEndDatePicker)
        endDatePicker.backgroundColor = UIColor( white:1, alpha:1)
        self.view.backgroundColor = UIColor(white:1, alpha: 1)
        datePicker.hidden = false
    }
    
    
    
    
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
    
    override func viewDidLoad() {
        startTexTField.hidden = true
        
        endTextField.hidden = true
        
        startTexTField.userInteractionEnabled = false
        
        endTextField.userInteractionEnabled = false
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        hideEndDatePicker()
        hideStartDatePicker()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addEventButton(sender: AnyObject) {
        println("print this SHIT!")
        params = ["name": nameTextField.text, "description": descTextField.text, "start_time": startTexTField.text, "end_time": endTextField.text, "venue": venueTextField.text, "location": locationTextField.text] as Dictionary
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
    
    
        func textFieldShouldBeginEditing(textField: UITextField!) -> Bool {
            if (textField ==  startTexTField) {
                showDatePicker()
                hideEndDatePicker()
                var start_time_from_date_picker = startTexTField
                println("selected start time field")
                println(datePicker.date)
                return false;
            }
            else if( textField ==  endTextField){
                showEndDatePicker()
                hideStartDatePicker()
                var end_time_from_date_picker = endTextField
                println("selected end time field")
                println(endDatePicker.date)
                return false;
            }
            else {
    
            return true;
            }
        }
    
    //    func datePickerDidEndEditing(textField: UITextField!) -> Bool {
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
        datePicker.backgroundColor = UIColor( white:1, alpha:1)
        self.view.backgroundColor = UIColor(white:1, alpha: 1)
    }
    
    func animEndDatePicker() {
        endDatePicker.backgroundColor = UIColor( white:1, alpha:1)
        self.view.backgroundColor = UIColor(white:1, alpha: 1)
    }
    
    
    func hideStartDatePicker() {
        datePicker.frame = CGRectMake(0,-250,320,260)
        
    }
    
    func hideEndDatePicker() {
        endDatePicker.frame = CGRectMake(0,-250,320,260)
    }
    
    
    
    
    
    
}



