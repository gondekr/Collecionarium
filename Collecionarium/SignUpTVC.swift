//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

@objc protocol SignUpDelegate {
    @objc optional func didSignUp(user: String)
}

class SignUpTVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPass1: UITextField!
    @IBOutlet weak var txtPass2: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!

    var delegate: SignUpDelegate?
    
    @IBOutlet weak var photoBtn: DesignButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoading()
    }
    
    @IBAction func saveBtn(sender: AnyObject) {
        save()
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.isHidden = true
        self.tableView.addSubview(loadingView)
    }
    
    func endRefresh(error: Bool) {
        loadingView.isHidden = true
        activity.stopAnimating()
//        if !error {
//            delegate?.didSignUp!(txtUsername.text!)
//            self.dismissViewControllerAnimated(true, completion: nil)
//        }
    }
    
    func didSignUp(username: String) {
//        let alert = UIAlertController(title: NSLocalizedString("SUCCESS", comment: ""), message: NSLocalizedString("USER_CREATED", comment: ""), preferredStyle: .Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
//            self.endRefresh(false)
//        }))
//        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func didSignUpWithError(error: String) {
//        let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: "\(error)", preferredStyle: .Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
//            self.endRefresh(true)
//        }))
//        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func cancelBtn(sender: AnyObject) {
//        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addBtn(sender: AnyObject) {
        pickImage()
    }
    
    func save() {
//        if txtPass1.text == txtPass2.text {
//            if txtPass1.text?.characters.count >= 6 {
//                loadingView.hidden = false
//                activity.startAnimating()
//                uParse.delegate = self
//                uParse.newUser(txtUsername.text!, pass: txtPass1.text!, email: txtEmail.text!, photo: photo)
//            }
//            else {
//                let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("PASSWORD_6", comment: ""), preferredStyle: .Alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//                self.presentViewController(alert, animated: true, completion: nil)
//            }
//        }
//        else {
//            let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("PASSWORD_MATCH", comment: ""), preferredStyle: .Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
    }
    
    // MARK: TextField
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        switch textField.tag {
        case 0: txtEmail.becomeFirstResponder()
        case 1: txtPass1.becomeFirstResponder()
        case 2: txtPass2.becomeFirstResponder()
        case 3: save()
        default: break
        }
        return true
    }
    
    // MARK: - Image Picker
    func pickImage() {
//        let imgPicker = UIImagePickerController()
//        imgPicker.delegate = self
//        imgPicker.editing = true
//        imgPicker.allowsEditing = true
//
//        let aSheet = UIAlertController(title: NSLocalizedString("ADD_PHOTO", comment: ""), message: NSLocalizedString("PHOTO_SOURCE", comment: ""), preferredStyle: .ActionSheet)
//        aSheet.addAction(UIAlertAction(title: NSLocalizedString("CAMERA", comment: ""), style: .Default, handler: { (al: UIAlertAction) -> Void in
//            imgPicker.sourceType = .Camera
//            imgPicker.showsCameraControls = true
//            self.presentViewController(imgPicker, animated: true, completion: nil)
//        }))
//        aSheet.addAction(UIAlertAction(title: NSLocalizedString("PHOTO_LIBRARY", comment: ""), style: .Default, handler: { (al: UIAlertAction) -> Void in
//            imgPicker.sourceType = .PhotoLibrary
//            self.presentViewController(imgPicker, animated: true, completion: nil)
//        }))
//        aSheet.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .Cancel, handler: nil))
//        aSheet.popoverPresentationController?.sourceView = tableView.viewWithTag(0)
//        self.presentViewController(aSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        guard let img = info[UIImagePickerControllerEditedImage] else {
//            return
//        }
//
//        let jpegData = UIImageJPEGRepresentation(img as! UIImage, 0.0)
//
//        photo = PFFile(data: jpegData!)
//        photoBtn.setBackgroundImage(UIImage(data: jpegData!), forState: .Normal)
//        photoBtn.setTitle("", forState: .Normal)
//
//        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
