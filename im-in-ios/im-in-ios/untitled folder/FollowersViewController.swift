import UIKit

class FollowersViewController: UIViewController, APIFollowersControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    var apiCtrl = APIFollowersController()
    var apiPOSTCtrl = APIAddEventController()
    var followers: NSArray!
    
    var params: NSDictionary!

    func didReceiveAPIResultsFollowers(results: NSDictionary) {
        println("FollowersViewController#didReceiveAPIResults")
        followers = results.objectForKey("followers") as? NSArray
        println(followers)
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        })
    }
    
    @IBAction func inviteFriendsButton(sender: AnyObject) {
        var users: NSMutableArray = []
        println("********HERE**********")
        if followers.count > 0 {
            for index in 0...(followers.count-1) {
                var user = followers[index] as NSDictionary
                if (user.objectForKey("invite") as NSString == "true") {
                    println(user)
                    users.addObject(user)
                }
            }
        }
        apiPOSTCtrl.sendInviteInfo(users, params: params)
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

