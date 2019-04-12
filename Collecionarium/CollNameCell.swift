//
//  CollNameCell.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/27/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class CollNameCell: UITableViewCell, UITextFieldDelegate{

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Outlets
    @IBOutlet weak var name: UITextField!
}
