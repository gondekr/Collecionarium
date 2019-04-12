//
//  UserCollectionVC.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/12/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import UIKit
import Parse

class UserCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, IParseDelegate {
    
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userImg: DesignImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let iParse = ItemParse.sharedInstance
    
    var items: [PFObject] = []
    var user: PFObject? {
        didSet {
            do { try user?.fetchIfNeeded() }
            catch { print("Não fetchou o usuário") }
        }
    }
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    var userColl: PFObject? {
        didSet {
            do {
                try userColl?.fetchIfNeeded()
                self.navigationItem.title = userColl!["name"] as? String
            }
            catch { print("Não fetchou a coleção") }
            load()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoading()
        loadingView.hidden = false
        activity.startAnimating()
        
        userNameLbl.text = user!["username"] as? String
        userEmailLbl.text = user!["email"] as? String
        btnEmail.enabled = (user!["emailVerified"] as? String) != nil
        userImg.image = UIImage(named: "noimage")
        let photo = user!["image"]
        if photo != nil {
            (photo as! PFFile).getDataInBackgroundWithBlock { (data, error) -> Void in
                if error == nil {
                    self.userImg.image = UIImage(data: data!)
                }
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        iParse.delegate = self
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRectMake(0, 0, view.frame.width, collectionView.frame.height))
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
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func load() {
        iParse.getAllByCollection(userColl!)
        self.navigationItem.title = userColl!["name"] as? String
    }
    
    // MARK: - Parse Delegate
    func didGetItems(objs: [PFObject]) {
        items = objs
        collectionView.reloadData()
        endRefresh()
    }
    
    func didFinishWithError(msg: String) {
        print(msg)
        endRefresh()
    }

    // MARK: - Collection View
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseID.item, forIndexPath: indexPath) as! ItemCell
        
        cell.cloudItem = items[indexPath.row]
        cell.titleIndex = userColl!["titleIndex"] as? Int
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 160, height: ((userColl!["titleIndex"] as! Int) == -1 ? 160 : 190))
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "userItemInfo" {
            let itemInfo = segue.destinationViewController as! UserItemVC
            let index = collectionView.indexPathsForSelectedItems()?.first?.row
            itemInfo.item = items[index!]
            itemInfo.coll = userColl
            itemInfo.trade = false
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
