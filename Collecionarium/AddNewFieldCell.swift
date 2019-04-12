//
//  AddNewFieldCell.swift
//  BigApp
//
//  Created by Rubens Gondek on 9/18/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

@objc protocol AddFieldDelegate {
    optional func buttonTapped()
}

class AddNewFieldCell: UITableViewCell {

    @IBOutlet weak var btn: UIButton!
    var delegate: AddFieldDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btn.layer.cornerRadius = btn.frame.height/2
        btn.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func click(sender: AnyObject) {
        delegate?.buttonTapped!()
    }
    
}
