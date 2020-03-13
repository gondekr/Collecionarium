//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

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
    
    override func viewWillAppear(_ animated: Bool) {
        txtPass.text = ""
//        UIApplication.shared.setStatusBarStyle(.default, animated: true)
    }
    
    func didSignUp(user: String) {
        txtUser.text = user
    }
    
    func login() {
        // Login
//        if success {
//            self.performSegueWithIdentifier("Login", sender: nil)
//            UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
//        }
//        else {
//            let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("INVALID_LOGIN", comment: ""), preferredStyle: .Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
    }
    
    // MARK: Text Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            txtPass.becomeFirstResponder()
        }
        else {
            login()
        }
        return true
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Login" {
            print("Login com sucesso")
        }
        else if segue.identifier == "SignUp" {
            ((segue.destination as! UINavigationController).viewControllers.first as! SignUpTVC).delegate = self
//            UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtUser.resignFirstResponder()
        txtPass.resignFirstResponder()
    }
}
