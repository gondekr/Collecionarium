//
//  YearPickerVC.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/18/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import UIKit

@objc protocol YearPickerDelegate {
    optional func didPickYear(year: String)
}

class YearPickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var years: [String] = []
    var delegate: YearPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        years = []
        let actualYear = Int((NSDate().timeIntervalSince1970/31536000) + 1970)
        for i in 1900...actualYear {
            years.append("\(i)")
        }
        
        pickerView.selectRow(years.count-1, inComponent: 0, animated: false)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtn(sender: AnyObject) {
        let year =  years[pickerView!.selectedRowInComponent(0)]
        delegate!.didPickYear!(year)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Picker View
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
}
