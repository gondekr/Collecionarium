//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate {
    @objc optional func didPickDate(date: String)
}

class DatePickerVC: UIViewController {

    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.datePickerMode = .date
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtn(sender: AnyObject) {
        let date = datePicker.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        delegate?.didPickDate!(date: formatter.string(from: date))
        self.dismiss(animated: true, completion: nil)
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
