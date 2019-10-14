//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit
import CoreData
import Social

class ItemsCollectionView: UICollectionViewController, UIGestureRecognizerDelegate, UICollectionViewDelegateFlowLayout {
    
    let iManager = ItemManager.sharedInstance
    var tutoView: UIView!
    var itemsRow: Int! = 2
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    // MARK: - Public API
    var localColl: Collection! {
        didSet {
            load()
            self.navigationItem.title = localColl.name
        }
    }
    
//    @IBAction func itemsPerRow(sender: UISegmentedControl) {
//        itemsRow = sender.selectedSegmentIndex + 1
//        collectionView?.reloadData()
//    }
    
    // MARK: Load the Collection
    func load() {
//        if cloudColl != nil {
//            iParse.getAllByCollection(cloudColl)
//        } else {
//            items = iManager.fetchItems(localColl)
//        }
        collectionView?.reloadData()
    }
    
    // MARK: - Gesture Recognizer
    @IBOutlet var lPress: UILongPressGestureRecognizer!
    @IBAction func handleEdit(sender: UILongPressGestureRecognizer) {
//        if sender.state == .Began {
//            let p = sender.locationInView(self.collectionView)
//            guard let indexPath = collectionView?.indexPathForItemAtPoint(p) else {
//                return
//            }
//
//            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
//            alert.addAction(UIAlertAction(title: NSLocalizedString("DELETE_ITEM", comment: ""), style: .Destructive, handler: { (al: UIAlertAction) -> Void in
//                if self.cloudColl != nil {
//                    self.iParse.deleteItem(self.items[(indexPath.item)] as! PFObject)
//                } else {
//                    self.iManager.deleteItem(self.items[(indexPath.item)] as! Item)
//                }
//                self.load()
//            }))
//            if self.cloudColl != nil {
//                let item = self.items[indexPath.item] as? PFObject
//                let forSale = item!["forSale"] as! Bool
//                let forTrade = item!["forTrade"] as! Bool
//                if forSale {
//                    alert.addAction(UIAlertAction(title: NSLocalizedString("REMOVE_SALE", comment: ""), style: .Default, handler: { (al: UIAlertAction) -> Void in
//
//                        self.eParse.deleteTradeEventOfItem(item!, trade: false)
//                        self.eventDeleted(1)
//                    }))
//                }
//                else {
//                    alert.addAction(UIAlertAction(title: NSLocalizedString("ADD_SALE", comment: ""), style: .Default, handler: { (al: UIAlertAction) -> Void in
//
//                        self.eParse.newEvent(1, txt: "ITEM_SALE", item: item, coll: self.cloudColl, img: (item!["photos"] as? [PFFile])?.first)
//                        self.eventAdded(1)
//                    }))
//                }
//                if forTrade {
//                    alert.addAction(UIAlertAction(title: NSLocalizedString("REMOVE_TRADE", comment: ""), style: .Default, handler: { (al: UIAlertAction) -> Void in
//
//                        self.eParse.deleteTradeEventOfItem(item!, trade: true)
//                        self.eventDeleted(0)
//                    }))
//                }
//                else {
//                    alert.addAction(UIAlertAction(title: NSLocalizedString("ADD_TRADE", comment: ""), style: .Default, handler: { (al: UIAlertAction) -> Void in
//                        self.eParse.newEvent(0, txt: "ITEM_TRADE", item: item, coll: self.cloudColl, img: (item!["photos"] as? [PFFile])?.first)
//                        self.eventAdded(0)
//                    }))
//                }
//                alert.addAction(UIAlertAction(title: NSLocalizedString("SHARE_FACEBOOK", comment: ""), style: .Default, handler: { (action) -> Void in
//                    let socialVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//                    socialVC.addImage((self.collectionView?.cellForItemAtIndexPath(indexPath) as! ItemCell).img.image)
//                    self.presentViewController(socialVC, animated: true, completion: nil)
//                }))
//            }
//            alert.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .Cancel, handler: { (al: UIAlertAction) -> Void in
//                self.dismissViewControllerAnimated(true, completion: nil)
//            }))
//            alert.popoverPresentationController?.sourceView = sender.view
//            self.presentViewController(alert, animated: true, completion: nil)
//        }

    }
    
    // Evento
    func eventAdded(type: Int) {
//        let alert = UIAlertController(title: NSLocalizedString("EVENT_ADDED", comment: ""), message: NSLocalizedString("ITEM_SALE", comment: ""), preferredStyle: .Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//        if type == 0 {
//            alert.message = NSLocalizedString("ITEM_TRADE", comment: "")
//        }
//        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func eventDeleted(type: Int) {
//        let alert = UIAlertController(title: NSLocalizedString("EVENT_REMOVED", comment: ""), message: NSLocalizedString("ITEM_REMOVED_FROM_TRADE", comment: ""), preferredStyle: .Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//        if type == 0 {
//            alert.message = NSLocalizedString("ITEM_REMOVED_FROM_TRADE", comment: "")
//        }
//        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Gesture recognizer
        lPress.delegate = self

        lPress.minimumPressDuration = 0.5
        self.collectionView?.addGestureRecognizer(lPress)
        
        tutoView = Tutorial(frame: CGRect(x: 0, y: 0, width: (collectionView?.frame.width)!, height: (collectionView?.frame.height)!-64), type: .Item)
        
        configureLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        load()
//        if cloudColl != nil {
//            iParse.delegate = self
//            loadingView.hidden = false
//            self.navigationItem.title = cloudColl["name"] as? String
//            activity.startAnimating()
//        }
//        else {
//            self.navigationItem.title = localColl.name
//        }
    }
    
    func noItems() {
//        if !self.view.subviews.contains(tutoView) {
//            if items.count == 0 {
//                self.view.addSubview(tutoView)
//            }
//        }
//        else {
//            if !(items.count == 0) {
//                tutoView.removeFromSuperview()
//            }
//        }
    }
    
    func endRefresh() {
        loadingView.isHidden = true
        activity.stopAnimating()
        collectionView!.reloadData()
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.isHidden = true
        self.view.addSubview(loadingView)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.collectionView?.indexPathsForSelectedItems() {
//                let detail = segue.destinationViewController as! DetailTableView
//                if cloudColl != nil {
//                    let item = items[indexPath.first!.row] as! PFObject
//                    detail.cloudColl = cloudColl
//                    detail.cloudItem = item
//                    detail.values = item["values"] as! [String]
//                } else {
//                    let item = items[indexPath.first!.row] as! Item
//                    detail.localColl = localColl
//                    detail.localItem = item
//                    detail.values = item.values
//                }
//            }
//        }
//        if segue.identifier == "addNewItem" {
//            let newItem = segue.destinationViewController as! DetailTableView
//            if cloudColl != nil {
//                newItem.cloudColl = cloudColl
//            } else {
//                newItem.localColl = localColl
//            }
//        }
    }
    
    // MARK: - Collection View
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseID.item, forIndexPath: indexPath) as! ItemCell
//        if cloudColl != nil {
//            cell.cloudItem = items[indexPath.row] as? PFObject
//            cell.titleIndex = cloudColl["titleIndex"] as? Int
//        } else {
//            cell.localItem = items[indexPath.row] as? Item
//            cell.titleIndex = localColl.titleIndex as? Int
//        }
        return UICollectionViewCell()
    }
}

