//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class ItemYearCell: ItemDetailCell, YearPickerDelegate {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var viewController: UITableViewController?
    
    override func didSetName(name: String) {
        lblFieldName.text = name
    }
    
    override func didSetValue(value: String) {
        yearBtn.setTitle(value, for: .normal)
    }
    
    func didPickYear(year: String) {
        yearBtn.setTitle(year, for: .normal)
    }
    
    override func updateValue() {
        self.value = yearBtn.title(for: .normal)
    }
    
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var yearBtn: UIButton!
    @IBAction func selectYear(sender: UIButton) {
        let yearView = viewController!.storyboard?.instantiateViewController(withIdentifier: "YearPickerVC") as! YearPickerVC
        yearView.delegate = self
        viewController?.present(yearView, animated: true, completion: nil)
        self.setSelected(true, animated: true)
    }
}
