//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class UserTVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var userImg: DesignButton!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var cloudBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if user == nil {
//            cloudBtn.enabled = false
//        }
//        lblUsername.text = user?.username
//        lblEmail.text = user?.email
//        if user?["image"] != nil {
//            (user!["image"] as! PFFile).getDataInBackgroundWithBlock { (data, error) -> Void in
//                if error == nil {
//                    self.userImg.setBackgroundImage(UIImage(data: data!), forState: .Normal)
//                }
//            }
//        }
    }
    
    @IBAction func resetLocal(sender: AnyObject) {
        let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: "Do you really want to do it?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "YES", style: .destructive, handler: { (action) -> Void in
            CollectionManager.sharedInstance.resetLocal()
            let success = UIAlertController(title: NSLocalizedString("SUCCESS", comment: ""), message: "Local data successfully erased", preferredStyle: .alert)
            success.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(success, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func resetCloud(sender: AnyObject) {

    }

    @IBAction func logout(sender: AnyObject) {
        let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("LOGOUT", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("YES", comment: ""), style: .destructive, handler: { (al: UIAlertAction) -> Void in
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "LoginVC")
            self.dismiss(animated: true, completion: nil)
            self.present(vc, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("NO", comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeImg(sender: AnyObject) {
        pickImage()
    }
        
    // MARK: - Image Picker
    func pickImage() {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.isEditing = true
        imgPicker.allowsEditing = true
        
        let aSheet = UIAlertController(title: NSLocalizedString("ADD_PHOTO", comment: ""), message: NSLocalizedString("PHOTO_SOURCE", comment: ""), preferredStyle: .actionSheet)
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("CAMERA", comment: ""), style: .default, handler: { (al: UIAlertAction) -> Void in
            imgPicker.sourceType = .camera
            imgPicker.showsCameraControls = true
            self.present(imgPicker, animated: true, completion: nil)
        }))
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("PHOTO_LIBRARY", comment: ""), style: .default, handler: { (al: UIAlertAction) -> Void in
            imgPicker.sourceType = .photoLibrary
            self.present(imgPicker, animated: true, completion: nil)
        }))
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .cancel, handler: nil))
        aSheet.popoverPresentationController?.sourceView = tableView.viewWithTag(0)
        self.present(aSheet, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let img = info[.editedImage] else {
            return
        }
        
//        let finalImg = Toucan(image: img as! UIImage).resize(size: CGSize(width: 300, height: 300), fitMode: Toucan.Resize.FitMode.Crop).image
//
//        let jpegData = finalImg.jpegData(compressionQuality: 0.0)

        dismiss(animated: true, completion: nil)
    }
}
