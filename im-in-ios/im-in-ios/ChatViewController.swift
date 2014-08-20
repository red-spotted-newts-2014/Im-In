//
//  ChatViewController.swift
//  im-in-ios
//
//  Created by Christian Moon on 8/19/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//


import UIKit

class ChatViewController: GlobalController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    var chat: NSMutableArray = NSMutableArray()
    var firebase: Firebase?
    var name: String = "stella"
    var urlPath: String = ""
    var eventId: String = ""
    var eventName: String = ""
    
    @IBOutlet var msgInput: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        urlPath = "https://amber-inferno-1117.firebaseio.com/" + eventId
        firebase = Firebase(url: urlPath)
        nameLabel.text = eventName + " " + eventId
        
        var snapshot: FDataSnapshot = FDataSnapshot()
        
        self.firebase!.observeEventType(FEventTypeChildAdded, withBlock: {snapshot in
            println(snapshot)
            self.chat.addObject(snapshot.value)
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.endEditing(true)
        
        self.firebase!.childByAutoId().setValue(["name": self.name, "text": msgInput.text])
        
        textField.text = ""
        return false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.chat.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        var rowData: NSDictionary = self.chat[indexPath.row] as NSDictionary
        cell.textLabel.text = rowData["text"] as String
        cell.detailTextLabel.text = rowData["name"] as String
        
        return cell
    }

}