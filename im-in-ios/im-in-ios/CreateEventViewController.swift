//
//  AddEventViewController.swift
//  im-in-ios
//
//  Created by joel yawili on 8/18/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController
    //, APIAddEventControllerProtocol, NSURLConnectionDataDelegate, NSURLConnectionDelegate
{
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descTextField: UITextView!
    @IBOutlet var venueTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var startTextField: UITextField!
    @IBOutlet var endTextField: UITextField!
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
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
    
    
}



