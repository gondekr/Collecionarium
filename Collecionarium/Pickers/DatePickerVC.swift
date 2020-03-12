//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func didPickDate(date: String)
}

class DatePickerVC: UIViewController {
    var delegate: DatePickerDelegate?

    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
    }

    @IBAction func doneBtn() {
        let date = datePicker.date

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        delegate?.didPickDate(date: formatter.string(from: date))
        self.dismiss(animated: true, completion: nil)
    }
}
