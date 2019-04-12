//
//  ItemDetailCell.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 10/7/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class ItemDetailCell: UITableViewCell {

    var delegate: ItemFieldDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.setSelected(false, animated: true)

        // Configure the view for the selected state
    }
    
    // MARK: - Public API
    var fieldName : String? {
        didSet {
            didSetName(fieldName!)
        }
    }
    var value : String? {
        didSet {
            didSetValue(value!)
        }
    }

    func didSetName(name: String) {}
    
    func didSetValue(value: String) {}
    
    func updateValue() {}
}
