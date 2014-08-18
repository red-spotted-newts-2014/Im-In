import UIKit

// APIControllerProtocol
class InvitedEventViewController: UIViewController, APIInvitedEventControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var events:NSMutableArray = NSMutableArray();
    var apiCtrl = APIInvitedEventController()
    var invitedEvents: NSArray!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("EventViewController#didReceiveAPIResults")
        //       println(results)
        invitedEvents = results.objectForKey("invited_events") as? NSArray
        //       println("****")
        println(invitedEvents)
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        })
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println("EventViewController#tableView (count)")
        if invitedEvents == nil {
            return 0
        }
        return invitedEvents.count;
        
        
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    //Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        //
        println("EventViewController#tableView")
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "MyTestCell")
        //       println("***")
        
        //       cell.textLabel.text = "Row #\(indexPath.row)"
        cell.textLabel.text = invitedEvents[indexPath.row].objectForKey("name") as? String
        cell.detailTextLabel.text = invitedEvents[indexPath.row].objectForKey("venue") as? String
        //
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //      Dispose of any resources that can be recreated.
    }
    
    var refreshControl:UIRefreshControl!  // An optional variable
    
    
    func refresh(sender:AnyObject)
    {
        // Code to refresh table view
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("EventViewController#viewDidLoad")
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
    }
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        if (segue!.identifier == "showInvited"){
//            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()
//            var invitedEventViewController:EventShowViewController = segue!.destinationViewController as EventShowViewController
//            invitedEventViewController.eventData = invitedEvents.objectAtIndex(selectedIndexPath.row) as NSDictionary
//        }else{
//            
//            
//        }
//    }
    
}
