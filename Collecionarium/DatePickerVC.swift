//
//  DatePickerVC.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/18/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate {
    optional func didPickDate(date: String)
}

class DatePickerVC: UIViewController {

    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.datePickerMode = .Date
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtn(sender: AnyObject) {
        let date = datePicker.date
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        delegate?.didPickDate!(formatter.stringFromDate(date))
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
