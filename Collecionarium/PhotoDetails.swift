//
//  PhotoDetails.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/31/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

class PhotoDetails: UIViewController {
    
    let iMan = ItemManager.sharedInstance
    
    @IBOutlet weak var btnL: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnR: UIButton!
    
    var photos = []
    var subs = []
    var index: Int = 0

    var itemType: ObjectType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateImg()
    }
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func left(sender: AnyObject) {
        index--
        updateImg()
    }
    
    @IBAction func right(sender: AnyObject) {
        index++
        updateImg()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.clearColor()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)
    }
    
    func updateImg() {
        if itemType == .Cloud {
            photos[index].getDataInBackgroundWithBlock({ (data, error) -> Void in
                if error == nil {
                    self.img.image = UIImage(data: data!)
                }
            })

        } else {
            img.image = UIImage(data: photos[index] as! NSData)
        }
        
        btnR.alpha = 0.75
        btnL.alpha = 0.75
        if index == photos.count - 1 {
            btnR.alpha = 0
        }
        if index == 0 {
            btnL.alpha = 0
        }
        if subs.count != 0 {
            self.navigationItem.title = "\(subs[index])"
        }
    }
    
    @IBAction func deletePhoto(sender: AnyObject) {
        let alert = UIAlertController(title: NSLocalizedString("DELETE_PHOTO", comment: ""), message: NSLocalizedString("DEL_PHOTO_CONFIRM", comment: ""), preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .Cancel, handler: { (al: UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("YES", comment: ""), style: .Destructive, handler: { (al: UIAlertAction) -> Void in
            
            if self.itemType == .Cloud {
                var ph = self.photos as! [PFFile]
                ph.removeAtIndex(self.index)
                self.photos = ph
            }
            else {
                var ph = self.photos as! [NSData]
                ph.removeAtIndex(self.index)
                self.photos = ph
            }
            
            NSNotificationCenter.defaultCenter().postNotificationName("photoUpdated", object: nil, userInfo: ["photos":self.photos])
            if self.index == self.photos.count {
                self.index--
            }
            if self.photos.count == 0 {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else {
                self.updateImg()
            }
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionClick(sender: AnyObject) {
        let activity = UIActivityViewController(activityItems: [img.image!], applicationActivities: nil)
        self.presentViewController(activity, animated: true, completion: nil)
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
//        
//        alert.addAction(UIAlertAction(title: "Cancelar", style: .Cancel, handler: { (al: UIAlertAction) -> Void in
//            self.dismissViewControllerAnimated(true, completion: nil)
//        }))
//        alert.addAction(UIAlertAction(title: "Definir como capa do item", style: .Default, handler: { (al: UIAlertAction) -> Void in
//            self.item = self.iMan.defineCover(self.item, photoIndex: self.index)
//            NSNotificationCenter.defaultCenter().postNotificationName("photoUpdated", object: nil, userInfo: ["item":self.item])
//        }))
//        alert.addAction(UIAlertAction(title: "Editar legenda", style: .Default, handler: { (al: UIAlertAction) -> Void in
//            let alertSub = UIAlertController(title: "Editar legenda", message: "Digite a nova legenda para a foto", preferredStyle: .Alert)
//            alertSub.addTextFieldWithConfigurationHandler({ (txt: UITextField) -> Void in
//                txt.placeholder = "Legenda"
//                txt.secureTextEntry = false
//                txt.autocapitalizationType = .Sentences
//            })
//            alertSub.addAction(UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil))
//            alertSub.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (al: UIAlertAction) -> Void in
//                var sub = (alertSub.textFields?.first as UITextField!).text
//                if sub == "" {
//                    sub = "Sem legenda"
//                }
//                self.item = self.iMan.changeSub(self.item, photoIndex: self.index, sub: sub!)
//                NSNotificationCenter.defaultCenter().postNotificationName("photoUpdated", object: nil, userInfo: ["item":self.item])
//                self.updateImg(self.item)
//            }))
//            
//            self.presentViewController(alertSub, animated: true, completion: nil)
//        }))
//        alert.popoverPresentationController?.sourceView = sender.view
//        self.presentViewController(alert, animated: true, completion: nil)
    }
}
