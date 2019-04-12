//
//  ItemYearCell2.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 9/30/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class ItemYearCell2: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {

    let years = ["2000","2001","2002","2003","2004","2005"]
    let bigHeight = 135.0
    let smallHeight = 45.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        yearPicker.delegate = self
        yearPicker.userInteractionEnabled = false
    }
    
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBOutlet weak var lblFieldName: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }

}
