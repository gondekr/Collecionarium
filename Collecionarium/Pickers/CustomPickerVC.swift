//
//  Created by Rubens Gondek on 5/21/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol CustomPickerDelegate {
    func didPickItem(_ item: String)
}

class CustomPickerVC: UIViewController {
    static let identifier = "CustomPickerVC"
    @IBOutlet weak var pickerView: UIPickerView!

    var items: [String] = []
    var selectedIndex = 0
    var localizedStrings = false
    var delegate: CustomPickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.selectRow(selectedIndex, inComponent: 0, animated: false)
    }

    @IBAction func doneBtn() {
        let item = items[pickerView.selectedRow(inComponent: 0)]
        delegate?.didPickItem(item)
        self.dismiss(animated: true, completion: nil)
    }
}

extension CustomPickerVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

extension CustomPickerVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let item = items[row]
        let string = localizedStrings ? item.localized() : item
        let title = NSAttributedString(string: string, attributes: [
            .font: UIFont(name: "Avenir Next", size: 18.0)!,
            .foregroundColor: UIColor.white])

        return title
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = items[row]
        return localizedStrings ? title.localized() : title
    }
}
