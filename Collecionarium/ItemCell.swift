//
//  ItemCell.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/17/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

class ItemCell: DesignCollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    
    // MARK: - Public API
    var cloudItem : PFObject? {
        didSet {
            let photos = cloudItem!["photos"] as! [PFFile]
            if !photos.isEmpty {
                photos.first?.getDataInBackgroundWithBlock({ (data, error) -> Void in
                    if error == nil {
                        self.img.image = UIImage(data: data!)
                    }
                })
            } else {
                img.image = UIImage(named: "noimage")
            }
        }
    }
    var localItem : Item? {
        didSet {
            let photos = localItem?.photos
            if !photos!.isEmpty {
                img.image = UIImage(data: (photos?.first)!)
            } else {
                img.image = UIImage(named: "noimage")
            }
        }
    }
    
    var titleIndex : Int? {
        didSet {
            if titleIndex != -1 {
                blur.hidden = false
                if cloudItem != nil {
                    lbl.text = (cloudItem!["values"] as! [String])[titleIndex!]
                } else {
                    lbl.text = localItem?.values[titleIndex!]
                }
            }
            else {
                blur.hidden = true
            }
        }
    }
}
