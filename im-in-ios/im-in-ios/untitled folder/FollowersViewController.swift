import UIKit

class FollowersViewController: UIViewController, APIFollowersControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APIFollowersController()
    var followers: NSArray!
    var postInvitations: NSArray!
    var newEventId: NSString!

    func didReceiveAPIResults(results: NSDictionary) {
        println("FollowersViewController#didReceiveAPIResults")
        followers = results.objectForKey("followers") as? NSArray
        println(followers)
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        })
        println("lets double check this")
        println(newEventId)
    }
    
    @IBAction func inviteFriendsButton(sender: AnyObject) {
        println("********HERE**********")
        for index in 0...(followers.count-1) {
//        for user in followers {
            var user = followers[index] as NSDictionary
            if (user.objectForKey("invite") as NSString == "true") {
//                print(user)
                println(user)
                println(newEventId)
//                apiCtrl.sendInviteInfo(user)
            }
        }
        println(postInvitations)
    }

    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println("FollowersViewController#tableView (count)")
        if followers == nil {
            return 0
        }
        return followers.count;
    }
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
 
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "MyTestCell")
        followers[indexPath.row].setValuesForKeysWithDictionary(["invite": "pending"])
        cell.textLabel.text = followers[indexPath.row].objectForKey("username") as? String
        println(followers[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath((tableView.indexPathForSelectedRow()), animated: Bool())
        
        var cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath);
        
        if (cell.accessoryType == UITableViewCellAccessoryType.None) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            followers[indexPath.row].setValuesForKeysWithDictionary(["invite": "true"])
        } else if (cell.accessoryType == UITableViewCellAccessoryType.Checkmark) {
            cell.accessoryType = UITableViewCellAccessoryType.None;
            followers[indexPath.row].setValuesForKeysWithDictionary(["invite": "false"])
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        println("FollowersViewController#viewDidLoad")
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        
        apiCtrl.delegate = self
        apiCtrl.loadAllEvents()
    }
    
}


