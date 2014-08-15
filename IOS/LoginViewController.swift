import UIKit

class LoginViewController: UIViewController {
                            
    @IBOutlet weak var theTextfieldUsername: UITextField!
    
    @IBOutlet weak var theTextfieldPassword: UITextField!
    
    @IBOutlet weak var theLabel: UILabel!
    
    @IBAction func theVerifyMethod(sender: AnyObject) {
        var user = "u"
        var password = "p"   // <== PUT THIS INFO SOMEWHERE ELSE FOR SECURITY
        
        if theTextfieldUsername.text == user && theTextfieldPassword.text == password {
            theLabel.text = "Login Successful"
            theLabel.textColor = UIColor.greenColor()
            theTextfieldUsername.resignFirstResponder()
            theTextfieldPassword.resignFirstResponder()
        }
        else {
            theLabel.text = "Login Failed"
            theLabel.textColor = UIColor.redColor()
            theTextfieldUsername.resignFirstResponder()
            theTextfieldPassword.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

