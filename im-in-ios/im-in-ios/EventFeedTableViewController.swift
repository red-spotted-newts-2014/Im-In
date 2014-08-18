//
//  EventFeedTableViewController.swift
//  im-in-ios
//
//  Created by joel yawili on 8/17/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class EventFeedTableViewController: UITableViewController {
    
    

    
    var events:NSMutableArray = NSMutableArray();
    
    override func viewDidAppear(animated: Bool) {
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var eventListFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("eventList") as? NSMutableArray
        
        if ((eventListFromUserDefaults) != nil){
            events = eventListFromUserDefaults!
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView!.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var event:NSDictionary = events.objectAtIndex(indexPath.row) as NSDictionary
        cell.textLabel.text = event.objectForKey("name") as String
        
        return cell
        
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue!.identifier == "showDetails"){
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()
            var eventDetailViewController:EventDetailViewController = segue!.destinationViewController as EventDetailViewController
            eventDetailViewController.eventData = events.objectAtIndex(selectedIndexPath.row) as NSDictionary
        }
    }
    
}



    


