//
//  GlobalController.swift
//  im-in-ios
//
//  Created by Christian Moon on 8/19/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class GlobalController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(UIKeyboardWillShowNotification)
        NSNotificationCenter.defaultCenter().removeObserver(UIKeyboardWillHideNotification)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        self.moveView(notification.userInfo, up: true)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.moveView(notification.userInfo, up: false)
    }
    
    func moveView(userInfo: NSDictionary, up: Bool) {
        var keyboardEndFrame: CGRect = CGRect()
        userInfo[UIKeyboardFrameEndUserInfoKey].getValue(&keyboardEndFrame)
        
        var animationCurve: UIViewAnimationCurve = UIViewAnimationCurve.EaseOut
        userInfo[UIKeyboardAnimationCurveUserInfoKey].getValue(&animationCurve)
        
        var animationDuration: NSTimeInterval = NSTimeInterval()
        userInfo[UIKeyboardAnimationDurationUserInfoKey].getValue(&animationDuration)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(animationDuration)
        UIView.setAnimationCurve(animationCurve)
        
        var keyboardFrame: CGRect = self.view.convertRect(keyboardEndFrame, toView: nil)
        var y = keyboardFrame.size.height * (up ? -1 : 1)
        self.view.frame = CGRectOffset(self.view.frame, 0, y)
        
        UIView.commitAnimations()
    }

}