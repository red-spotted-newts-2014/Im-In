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
class ShowEventDetailsViewController: UIViewController, APIShowEventDetailsViewControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APIShowEventDetailsViewController()
    var details: NSArray!
    var users: NSArray! 
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("ShowEventDetailsViewController#didReceiveAPIResults")
                println(results)
        details = results.objectForKey("event") as? NSArray
        users = results.objectForKey("users") as? NSArray
        //        println("****")
        println(details)
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        })
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        //apiCtrl.loadAllEvents()
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println("ShowEventDetailsViewController#tableView (count)")
        if details == nil {
            return 0
        }
        return details.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        println("ShowEventDetailsViewController#tableView")
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: "MyTestCell")
        //        println("***")
        
        //        cell.textLabel.text = "Row #\(indexPath.row)"
        
        cell.textLabel.text = details[indexPath.row].objectForKey("description") as? String
        cell.detailTextLabel.text = details[indexPath.row].objectForKey("start_time") as? String
        //        cell.textLabel.text = users[indexPath.row].objectForKey("username") as? String USE FOR USERS DETAILS

        
        return cell
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("ShowEventDetailsViewController#viewDidLoad")
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


