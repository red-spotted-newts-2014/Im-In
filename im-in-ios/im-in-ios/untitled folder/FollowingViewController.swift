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
class FollowingViewController: UIViewController, APIFollowingControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APIFollowingController()
    var follows: NSArray!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("FollowingViewController#didReceiveAPIResults")
        //        println(results)
        follows = results.objectForKey("following") as? NSArray
        //        println("****")
        println(follows)
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        })
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        //apiCtrl.loadAllEvents()
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println("FollowingViewController#tableView (count)")
        if follows == nil {
            return 0
        }
        return follows.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        println("FollowingViewController#tableView")
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "MyTestCell")
        //        println("***")
        
        //        cell.textLabel.text = "Row #\(indexPath.row)"
        cell.textLabel.text = follows[indexPath.row].objectForKey("username") as? String
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("FollowingViewController#viewDidLoad")
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


