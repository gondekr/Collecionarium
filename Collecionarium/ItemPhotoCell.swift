//
//  NewPhotosCell.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/20/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

class ItemPhotoCell: UICollectionViewCell{

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Outlets
    @IBOutlet weak var img: UIImageView!
    
    // MARK: - Public API
    var photo: AnyObject? {
        didSet {
            if photo!.isMemberOfClass(PFFile) {
                (photo as! PFFile).getDataInBackgroundWithBlock({ (data, error) -> Void in
                    if error == nil {
                        self.img.image = UIImage(data: data!)
                    }
                })
            }
            else {
                img.image = UIImage(data: photo as! NSData)
            }
        }
    }
}