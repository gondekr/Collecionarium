//
//  PredefinedCollectionsView.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 9/29/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

class PredefinedCollectionsView: UICollectionViewController, UICollectionViewDelegateFlowLayout, PDCParseDelegate {

    var collections: [PFObject]! = []
    let pdcParse = PDCollectionParse.sharedInstance
    let cManager = CollectionManager.sharedInstance
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        
        pdcParse.delegate = self
        
        configureLoading()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        pdcParse.getAll()
        loadingView.hidden = false
        activity.startAnimating()
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.hidden = true
        self.collectionView?.addSubview(loadingView)
    }
    
    // MARK: - Parse Delegate 
    func didGetPDCollections(objs: [PFObject]) {
        collections = objs
        collectionView?.reloadData()
        activity.stopAnimating()
        loadingView.hidden = true
    }
    
    func didFinishWithError(msg: String) {
        print(msg)
        activity.stopAnimating()
        loadingView.hidden = true
    }

    // MARK: - Flow layout Delegate
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let x = self.view.frame.width/3 - 10
        return CGSize(width: x, height: x+30)
    }
    
    // MARK: - CollectionView Data Source
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count + 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PreDefCell", forIndexPath: indexPath) as! PreDefCell
        if indexPath.row == 0 {
            cell.name = NSLocalizedString("CUSTOM", comment: "")
            cell.imgName = "Custom"
        }
        else {
            cell.name = collections[indexPath.row-1]["name"] as! String
            cell.imgName = collections[indexPath.row-1]["imageName"] as! String
        }
        
        // Configure the cell
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            performSegueWithIdentifier("CustomCollection", sender: nil)
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "PreDefSegue" {
            let item = (collectionView?.indexPathsForSelectedItems()?.first?.item)!
            if item == 0 {
                return false
            }
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PreDefSegue" {
            let nColl = segue.destinationViewController as! NewCollectionTableView
            let item = (collectionView?.indexPathsForSelectedItems()?.first?.item)!
            nColl.preDefColl = collections[item-1]
        }
    }
}
