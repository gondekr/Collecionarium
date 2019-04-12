//
//  UserItemPhotoCell.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/13/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import UIKit
import Parse

class UserItemPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    var photo: PFFile! {
        didSet {
            photo.getDataInBackgroundWithBlock({ (data, error) -> Void in
                if error == nil {
                    self.img.image = UIImage(data: data!)
                }
            })
        }
    }
    
}
