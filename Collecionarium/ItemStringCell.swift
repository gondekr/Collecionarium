		//
//  ItemStringCell.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/21/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class ItemStringCell: ItemDetailCell, UITextFieldDelegate {
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtValue.delegate = self
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Outlets
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var txtValue: UITextField!
    
    override func didSetName(name: String) {
        lblFieldName.text = name
    }
    
    override func didSetValue(value: String) {
        txtValue.text = value
    }
    
    override func updateValue() {
        self.value = txtValue.text
    }
    
    // MARK: - Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        delegate?.nextField!(self.tag)
        return true
    }
}
