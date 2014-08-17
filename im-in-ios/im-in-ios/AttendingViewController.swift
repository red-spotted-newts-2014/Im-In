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
class AttendingViewController: UIViewController, APIAttendingControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APIAttendingController()
    var attending: NSArray!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("AttendingViewController#didReceiveAPIResults")
        //        println(results)
        attending = results.objectForKey("attending_events") as? NSArray
        //        println("****")
        println(attending)
        self.tableView.reloadData()
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        //apiCtrl.loadAllEvents()
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println("AttendingViewController#tableView (count)")
        if attending == nil {
            return 0
        }
        return attending.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        println("AttendingViewController#tableView")
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "MyTestCell")
        //        println("***")
        
        //        cell.textLabel.text = "Row #\(indexPath.row)"
        cell.textLabel.text = attending[indexPath.row].objectForKey("name") as? String
        cell.detailTextLabel.text = attending[indexPath.row].objectForKey("venue") as? String
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("AttendingViewController#viewDidLoad")
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


