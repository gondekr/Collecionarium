//
//  ItemYearCell.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 9/30/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class ItemYearCell: ItemDetailCell, YearPickerDelegate {
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var viewController: UITableViewController?
    
    override func didSetName(name: String) {
        lblFieldName.text = name
    }
    
    override func didSetValue(value: String) {
        yearBtn.setTitle(value, forState: .Normal)
    }
    
    func didPickYear(year: String) {
        yearBtn.setTitle(year, forState: .Normal)
    }
    
    override func updateValue() {
        self.value = yearBtn.titleForState(.Normal)
    }
    
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var yearBtn: UIButton!
    @IBAction func selectYear(sender: UIButton) {
        let yearView = viewController!.storyboard?.instantiateViewControllerWithIdentifier("YearPickerVC") as! YearPickerVC
        yearView.delegate = self
        viewController?.presentViewController(yearView, animated: true, completion: nil)
        self.setSelected(true, animated: true)
    }
}
