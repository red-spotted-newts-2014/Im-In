//
//  ViewController.swift
//  Im_in
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import UIKit

//
//, APIControllerProtocol
class FriendsAttendingViewController: UIViewController, APIFriendsAttendingControllerProtocol, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APIFriendsAttendingController()
    var attending: NSArray!
    var eventID: NSString!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("FriendsAttendingViewController#didReceiveAPIResults")
        println(results)
        attending = results.objectForKey("friends") as? NSArray
        //        println("****")
        println(attending)
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        })
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        //apiCtrl.loadAllEvents()
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println("FriendsAttendingViewController#tableView (count)")
        if attending == nil {
            return 0
        }
        return attending.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        println("FriendsAttendingViewController#tableView")
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "MyTestCell")
        //        println("***")
        
        //        cell.textLabel.text = "Row #\(indexPath.row)"
        cell.textLabel.text = attending[indexPath.row].objectForKey("username") as? String
        
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var refreshControl:UIRefreshControl!  // An optional variable
    
    
    func refresh(sender:AnyObject)
    {
        // Code to refresh table view
        apiCtrl.delegate = self
        println(eventID)
        apiCtrl.loadAllEvents(eventID)
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("FriendsAttendingViewController#viewDidLoad")
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        println(eventID)
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents(eventID)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue!.identifier == "test"){
            println("here")
            println(self.tableView.indexPathForSelectedRow())
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()
            var friendsAttendingViewController:FriendsProfileViewController = segue!.destinationViewController as FriendsProfileViewController
            friendsAttendingViewController.friendData = attending.objectAtIndex(selectedIndexPath.row) as NSDictionary
        }
    }
}


