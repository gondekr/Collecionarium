//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

protocol YearPickerDelegate {
    func didPickYear(year: String)
}

class YearPickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var pickerView: UIPickerView!

    var years: [String] = []
    var delegate: YearPickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let actualYear = Int((NSDate().timeIntervalSince1970/31536000) + 1970)
        years = (1800...actualYear).map { "\($0)" }

        pickerView.selectRow(years.count-1, inComponent: 0, animated: false)
    }

    @IBAction func doneBtn() {
        let year =  years[pickerView!.selectedRow(inComponent: 0)]
        delegate?.didPickYear(year: year)
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: Picker View
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }

    func pickerView(_ pickerView: UIPickerView,
                    attributedTitleForRow row: Int,
                    forComponent component: Int) -> NSAttributedString? {
        let year = years[row]
        let title = NSAttributedString(string: year, attributes: [
            .font: UIFont(name: "Avenir Next", size: 18.0)!,
            .foregroundColor: UIColor.white])

        return title
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
