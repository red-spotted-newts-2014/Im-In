//
//  EventShowViewController2.swift
//  im-in-ios
//
//  Created by joel yawili on 8/17/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descTextField: UITextView!
    @IBOutlet var venueTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var startTextField: UITextField!
    @IBOutlet var endTextField: UITextField!
    
    var eventData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.userInteractionEnabled = false
        descTextField.userInteractionEnabled = false
        venueTextField.userInteractionEnabled = false
        locationTextField.userInteractionEnabled = false
        startTextField.userInteractionEnabled = false
        endTextField.userInteractionEnabled = false
        
        nameTextField.text = eventData.objectForKey("name") as String
        descTextField.text = eventData.objectForKey("description") as String
        venueTextField.text = eventData.objectForKey("venue") as String
        locationTextField.text = eventData.objectForKey("location") as String
        startTextField.text = eventData.objectForKey("start_time") as String
        endTextField.text = eventData.objectForKey("end_time") as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}



