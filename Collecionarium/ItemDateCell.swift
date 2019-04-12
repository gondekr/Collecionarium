//
//  ItemDateCell.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 10/7/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class ItemDateCell: ItemDetailCell, DatePickerDelegate {

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    var viewController: UITableViewController?
    
    override func didSetName(name: String) {
        lblFieldName.text = name
    }
    
    override func didSetValue(value: String) {
        dateBtn.setTitle(value, forState: .Normal)
    }
    
    func didPickDate(date: String) {
        dateBtn.setTitle(date, forState: .Normal)
    }
    
    override func updateValue() {
        self.value = dateBtn.titleForState(.Normal)
    }
    
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var lblFieldName: UILabel!
    @IBAction func pickDate(sender: AnyObject) {
        let dateView = viewController!.storyboard?.instantiateViewControllerWithIdentifier("DatePickerVC") as! DatePickerVC
        dateView.delegate = self
        viewController?.presentViewController(dateView, animated: true, completion: nil)
        self.setSelected(true, animated: true)
    }

}
