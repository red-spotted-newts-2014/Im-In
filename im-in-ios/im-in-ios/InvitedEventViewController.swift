import UIKit

// APIControllerProtocol
class InvitedEventViewController: UIViewController, APIInvitedEventControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var events: NSMutableArray = NSMutableArray();
    var apiCtrl = APIInvitedEventController()
    var invitedEvents: NSArray!
    var invitations: NSArray!
    
    func didReceiveAPIResults(results: NSDictionary) {
        println("EventViewController#didReceiveAPIResults")
        invitedEvents = results.objectForKey("invited_events") as? NSArray
        invitations = results.objectForKey("invitations") as? NSArray
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
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        //
        println("EventViewController#tableView")
        let cell = tableView!.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = invitedEvents[indexPath.row].objectForKey("name") as? String

        var eventId = invitedEvents[indexPath.row].objectForKey("id").stringValue as String
        var invitationEventId = invitations[indexPath.row].objectForKey("event_id").stringValue as String
        var status = invitations[indexPath.row].objectForKey("status") as String
        println(eventId)
        println(invitationEventId)
        println(status)
        
        if (status == "in") {
            cell.backgroundColor = UIColor.purpleColor()
        } else {
            cell.backgroundColor = UIColor.clearColor()
        }
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
        println("REFRESHED")
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue!.identifier == "showInvited"){
            println("here")
            println(self.tableView.indexPathForSelectedRow())
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()
            var invitedEventViewController:EventShowViewController = segue!.destinationViewController as EventShowViewController
            invitedEventViewController.eventData = invitedEvents.objectAtIndex(selectedIndexPath.row) as NSDictionary
            invitedEventViewController.invitationData = invitations.objectAtIndex(selectedIndexPath.row) as NSDictionary
        } else if (segue!.identifier == "toCreatedEvents") {
            println("to created events")
        }
    }

}
