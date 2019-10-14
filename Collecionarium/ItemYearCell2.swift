//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class ItemYearCell2: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    let years = ["2000","2001","2002","2003","2004","2005"]
    let bigHeight = 135.0
    let smallHeight = 45.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        yearPicker.delegate = self
        yearPicker.isUserInteractionEnabled = false
    }
    
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBOutlet weak var lblFieldName: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

}
