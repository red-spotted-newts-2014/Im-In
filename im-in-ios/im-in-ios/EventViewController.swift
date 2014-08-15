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
class EventViewController: UIViewController, APIControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APIController()
    var invitedEvents: AnyObject!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println(results)
        invitedEvents = results.objectForKey("invited_events")
        println("****")
        println(invitedEvents)
    }
//    
//    var results: AnyObject! = ["user" : [String : AnyObject]()]
//    let responseDic = response as [String : AnyObject]
//    let userDic: [String : AnyObject] = responseDic["user"]! as [String : AnyObject]
//    
    @IBAction func buttonPressed(sender: AnyObject) {
        apiCtrl.loadAllEvents()
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
//        println("***")
        println(invitedEvents)
        cell.textLabel.text = "Row #\(indexPath.row)"
        cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCtrl.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


