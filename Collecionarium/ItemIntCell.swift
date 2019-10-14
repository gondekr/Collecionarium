//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class ItemIntCell: ItemDetailCell, UITextFieldDelegate{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtValue.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Outlets
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var txtValue: UITextField!
    
    override func didSetName(name: String) {
        lblFieldName.text = name
    }
    
    override func didSetValue(value: String) {
        txtValue.text = value
    }
    
    override func updateValue() {
        self.value = txtValue.text
    }
    
    // MARK: - Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.nextField!(tag: self.tag)
        return true
    }
}
