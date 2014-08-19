//
//  EventFeedTableViewController.swift
//  im-in-ios
//
//  Created by joel yawili on 8/17/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class EventFeedTableViewController: UITableViewController, APICreatedEventsControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableVIew: UITableView!
//    var events:NSMutableArray = NSMutableArray();
    var events: NSArray!
    var apiCtrl = APICreatedEventsController()
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("CreatedEventsViewController#didReceiveAPIResults")
        println(results)
        events = results.objectForKey("created_events") as? NSArray
        //        println("****")
//        println(events)
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        })
    }
    
//    override func viewDidAppear(animated: Bool) {
//        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        
//        var eventListFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("eventList") as? NSMutableArray
//        
//        if ((eventListFromUserDefaults) != nil){
//            events = eventListFromUserDefaults!
//        }
//        self.tableView.reloadData()
//    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println("CreatedEventsViewController#tableView (count)")
        if events == nil {
            return 0
        }
        return events.count;
    }
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView!.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var event:NSDictionary = events.objectAtIndex(indexPath.row) as NSDictionary
        cell.textLabel.text = event.objectForKey("name") as String
        
        return cell
        
    }
//    var refreshControl:UIRefreshControl!  // An optional variable
    
    
    func refresh(sender:AnyObject)
    {
        // Code to refresh table view
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("CreatedEventsViewController#viewDidLoad")
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue!.identifier == "showDetails"){
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()
            var eventDetailViewController:EventDetailViewController = segue!.destinationViewController as EventDetailViewController
            eventDetailViewController.eventData = events.objectAtIndex(selectedIndexPath.row) as NSDictionary
        }
    }
    
    
}



    


