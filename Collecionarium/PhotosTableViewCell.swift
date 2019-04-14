//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    override func awakeFromNib() {
        super.awakeFromNib()
//
//        NotificationCenter.default.addObserver(forName: "photoUpdated", object: nil, queue: .main) { (notif: Notification) -> Void in
//            let uInfo = notif.userInfo as! [String: NSArray]
//            self.photos = uInfo["photos"]!
//        }
        // Initialization code
    }
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Public API
    // MARK: - Collection View data source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.item != photos.count {
//            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseID.photo, forIndexPath: indexPath) as! ItemPhotoCell
//
//            if itemType == .Cloud {
//                cell.photo = photos[indexPath.item] as! PFFile
//            }
//            else {
//                cell.photo = photos[indexPath.item] as! NSData
//            }
//
//            return cell
//        }
//        else {
//            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseID.addNewPhoto, forIndexPath: indexPath)
//
//            return cell
//        }
        return UICollectionViewCell()
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        if indexPath.item == photos.count {
//            NSNotificationCenter.defaultCenter().postNotificationName("AddPhoto", object: nil)
//        }
    }
}
