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
class ViewController: UIViewController, APIControllerProtocol, UITableViewDataSource, UITableViewDelegate {
                            
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APIController()
    
    func didReceiveAPIResults(results: NSDictionary) {
        println(results)
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        apiCtrl.searchItunesFor("steven")
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        return nil;
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

