//
//  UserTVC.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/16/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import UIKit
import Parse

class UserTVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userImg: DesignButton!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var cloudBtn: UIButton!
    
    let user = PFUser.currentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if user == nil {
            cloudBtn.enabled = false
        }
        lblUsername.text = user?.username
        lblEmail.text = user?.email
        if user?["image"] != nil {
            (user!["image"] as! PFFile).getDataInBackgroundWithBlock { (data, error) -> Void in
                if error == nil {
                    self.userImg.setBackgroundImage(UIImage(data: data!), forState: .Normal)
                }
            }
        }
    }
    
    @IBAction func resetLocal(sender: AnyObject) {
        let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: "Do you really want to do it?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "YES", style: .Destructive, handler: { (action) -> Void in
            CollectionManager.sharedInstance.resetLocal()
            let success = UIAlertController(title: NSLocalizedString("SUCCESS", comment: ""), message: "Local data successfully erased", preferredStyle: .Alert)
            success.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(success, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "NO", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func resetCloud(sender: AnyObject) {
        let alert = UIAlertController(title: "Alert", message: "Do you really want to do it?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "YES", style: .Destructive, handler: { (action) -> Void in
            let authAlert = UIAlertController(title: "Authenticate", message: "Enter the password of \(self.user!.username!) to authorize this action", preferredStyle: .Alert)
            authAlert.addTextFieldWithConfigurationHandler({ (txt2: UITextField) -> Void in
                txt2.placeholder = "Password"
                txt2.secureTextEntry = true
                txt2.autocorrectionType = .No
                txt2.autocapitalizationType = .None
            })
            authAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
            authAlert.addAction(UIAlertAction(title: "Authorize", style: .Default, handler: { (action) -> Void in
                let pass = authAlert.textFields?.last?.text
                PFUser.logInWithUsernameInBackground(self.user!.username!, password: pass!, block: { (uss, error) -> Void in
                    if error == nil {
                        CollectionParse.sharedInstance.resetCloud(self.user!)
                        let success = UIAlertController(title: NSLocalizedString("SUCCESS", comment: ""), message: "Cloud data successfully erased", preferredStyle: .Alert)
                        success.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                        self.presentViewController(success, animated: true, completion: nil)
                    }
                    else {
                        let fail = UIAlertController(title: NSLocalizedString("ERROR", comment: ""), message: "Cloud data couldn't be erased", preferredStyle: .Alert)
                        fail.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                        self.presentViewController(fail, animated: true, completion: nil)
                    }
                })
            }))
            self.presentViewController(authAlert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "NO", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func logout(sender: AnyObject) {
        let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("LOGOUT", comment: ""), preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("YES", comment: ""), style: .Destructive, handler: { (al: UIAlertAction) -> Void in
            PFUser.logOut()
            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("LoginVC")
            self.dismissViewControllerAnimated(true, completion: nil)
            self.presentViewController(vc, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("NO", comment: ""), style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeImg(sender: AnyObject) {
        pickImage()
    }
        
    // MARK: - Image Picker
    func pickImage() {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.editing = true
        imgPicker.allowsEditing = true
        
        let aSheet = UIAlertController(title: NSLocalizedString("ADD_PHOTO", comment: ""), message: NSLocalizedString("PHOTO_SOURCE", comment: ""), preferredStyle: .ActionSheet)
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("CAMERA", comment: ""), style: .Default, handler: { (al: UIAlertAction) -> Void in
            imgPicker.sourceType = .Camera
            imgPicker.showsCameraControls = true
            self.presentViewController(imgPicker, animated: true, completion: nil)
        }))
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("PHOTO_LIBRARY", comment: ""), style: .Default, handler: { (al: UIAlertAction) -> Void in
            imgPicker.sourceType = .PhotoLibrary
            self.presentViewController(imgPicker, animated: true, completion: nil)
        }))
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .Cancel, handler: nil))
        aSheet.popoverPresentationController?.sourceView = tableView.viewWithTag(0)
        self.presentViewController(aSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let img = info[UIImagePickerControllerEditedImage] else {
            return
        }
        
        let finalImg = Toucan(image: img as! UIImage).resize(CGSize(width: 300, height: 300), fitMode: Toucan.Resize.FitMode.Crop).image
        
        let jpegData = UIImageJPEGRepresentation(finalImg, 0.0)
        
        let photo = PFFile(data: jpegData!)
        user!["image"] = photo
        user?.saveInBackground()
        userImg.setBackgroundImage(UIImage(data: jpegData!), forState: .Normal)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
