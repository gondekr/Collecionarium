//
//  LoginViewController.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 10/21/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate, SignUpDelegate {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(sender: AnyObject) {
        login()
    }
    
    override func viewWillAppear(animated: Bool) {
        txtPass.text = ""
        UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: true)
    }
    
    func didSignUp(user: String) {
        txtUser.text = user
    }
    
    func login() {
        // Login
        let success = ParseUser.sharedInstance.login(txtUser.text!, pass: txtPass.text!)
        if success {
            self.performSegueWithIdentifier("Login", sender: nil)
            UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
        }
        else {
            let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("INVALID_LOGIN", comment: ""), preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: Text Field
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.tag == 0 {
            txtPass.becomeFirstResponder()
        }
        else {
            login()
        }
        return true
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Login" {
            print("Login com sucesso")
        }
        else if segue.identifier == "SignUp" {
            ((segue.destinationViewController as! UINavigationController).viewControllers.first as! SignUpTVC).delegate = self
            UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        txtUser.resignFirstResponder()
        txtPass.resignFirstResponder()
    }
    
}
