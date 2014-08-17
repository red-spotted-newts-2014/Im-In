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
class CreatedEventsViewController: UIViewController, APICreatedEventsControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APICreatedEventsController()
    var events: NSArray!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("CreatedEventsViewController#didReceiveAPIResults")
        //        println(results)
        events = results.objectForKey("created_events") as? NSArray
        //        println("****")
        println(events)
        self.tableView.reloadData()
    }

    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println("CreatedEventsViewController#tableView (count)")
        if events == nil {
            return 0
        }
        return events.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        println("CreatedEventsViewController#tableView")
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "MyTestCell")
        //        println("***")
        
        //        cell.textLabel.text = "Row #\(indexPath.row)"
        cell.textLabel.text = events[indexPath.row].objectForKey("name") as? String
        cell.detailTextLabel.text = events[indexPath.row].objectForKey("venue") as? String
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("CreatedEventsViewController#viewDidLoad")
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


