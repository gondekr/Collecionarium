//
//  PhotosTableViewCell.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/21/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

class PhotosTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        NSNotificationCenter.defaultCenter().addObserverForName("photoUpdated", object: nil, queue: .mainQueue()) { (notif: NSNotification) -> Void in
            let uInfo = notif.userInfo as! [String: NSArray]
            self.photos = uInfo["photos"]!
        }
        // Initialization code
    }
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Public API
    var itemType: ObjectType?
    var photos = [] {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.reloadData()
        }
    }
    
    // MARK: - Collection View data source
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count + 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.item != photos.count {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseID.photo, forIndexPath: indexPath) as! ItemPhotoCell
            
            if itemType == .Cloud {
                cell.photo = photos[indexPath.item] as! PFFile
            }
            else {
                cell.photo = photos[indexPath.item] as! NSData
            }
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseID.addNewPhoto, forIndexPath: indexPath)
            
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.item == photos.count {
            NSNotificationCenter.defaultCenter().postNotificationName("AddPhoto", object: nil)
        }
    }
}