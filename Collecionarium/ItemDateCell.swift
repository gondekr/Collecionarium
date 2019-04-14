//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class ItemDateCell: ItemDetailCell, DatePickerDelegate {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    var viewController: UITableViewController?
    
    override func didSetName(name: String) {
        lblFieldName.text = name
    }
    
    override func didSetValue(value: String) {
        dateBtn.setTitle(value, for: .normal)
    }
    
    func didPickDate(date: String) {
        dateBtn.setTitle(date, for: .normal)
    }
    
    override func updateValue() {
        self.value = dateBtn.title(for: .normal)
    }
    
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var lblFieldName: UILabel!
    @IBAction func pickDate(sender: AnyObject) {
        let dateView = viewController!.storyboard?.instantiateViewController(withIdentifier: "DatePickerVC") as! DatePickerVC
        dateView.delegate = self
        viewController?.present(dateView, animated: true, completion: nil)
        self.setSelected(true, animated: true)
    }

}
