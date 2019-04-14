//
//  PreDefCell.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 9/29/15.
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class PreDefCell: DesignCollectionViewCell {
    
    // MARK: - Public API
    var name : String! {
        didSet {
            lbl.text = name
        }
    }
    var imgName : String! {
        didSet {
            img.image = UIImage(named: imgName)
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
}
