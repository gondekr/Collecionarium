//
//  UserItemVC.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/12/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import UIKit
import Parse
import MessageUI

class UserItemVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var getBtn: DesignButton!
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    var item: PFObject?
    var user: PFObject!
    var coll: PFObject?
    
    var fields: [String]! = []
    var values: [String]! = []
    var photos: [PFFile]! = []
    var trade: Bool! = false
    
    func configureLoading() {
        loadingView = UIView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.hidden = true
        self.collectionView.addSubview(loadingView)
    }
    
    func endRefresh() {
        loadingView.hidden = true
        activity.stopAnimating()
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoading()
        loadingView.hidden = false
    
        activity.startAnimating()
        do {
            try item?.fetchIfNeeded()
            values = item!["values"] as! [String]
            photos = item!["photos"] as! [PFFile]
            try coll?.fetchIfNeeded()
            fields = coll!["fields"] as! [String]
            user = coll!["user"] as! PFObject
            try user.fetchIfNeeded()
            pageIndicator.numberOfPages = photos.count
            pageIndicator.currentPage = 0
            endRefresh()
        }
        catch {
            print("Não fetchou alguma coisa")
            fields = []
            values = []
            endRefresh()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        getBtn.hidden = !trade
    }

    @IBAction func sendEmail(sender: AnyObject) {
        let mail = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mail, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([user["email"] as! String])
        mailComposerVC.setSubject("EU QUERO! - Collecionarium")
        mailComposerVC.setMessageBody("Estou interessado no seu item e gostaria de obter mais informações", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .Alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Scroll View
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageIndicator.currentPage = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
    }
    
    // MARK: - Table View
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("INFORMATIONS", comment: "")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userItemInfoCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = fields[indexPath.row]
        cell.detailTextLabel?.text = values[indexPath.row]
        
        return cell
    }
    
    // MARK: - Collection View
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! UserItemPhotoCell
        
        cell.photo = photos[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let x = (collectionView.frame.size.width - collectionView.frame.height)/2
        return UIEdgeInsets(top: 0, left: x, bottom: 0, right: x)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return collectionView.frame.width-collectionView.frame.height
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let x = collectionView.frame.height
        return CGSize(width: x, height: x)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
