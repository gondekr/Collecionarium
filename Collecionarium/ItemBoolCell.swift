//
//  ItemBoolCell.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 10/20/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class ItemBoolCell: ItemDetailCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Outlets
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var sw: UISwitch!
    
    @IBAction func changeSwitch(sender: AnyObject) {
        updateValue()
    }
    
    override func didSetName(name: String) {
        lblFieldName.text = name
    }
    
    override func didSetValue(value: String) {
        sw.on = (value == "true")
    }
    
    override func updateValue() {
        self.value = "\(sw.on)"
    }
}
