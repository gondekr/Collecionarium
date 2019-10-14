//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class ItemBoolCell: ItemDetailCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var lblFieldName: UILabel!
    @IBOutlet weak var sw: UISwitch!
    
    @IBAction func changeSwitch(sender: AnyObject) {
        updateValue()
    }
    
    override func didSetName(name: String) {
        lblFieldName.text = name
    }
    
    override func didSetValue(value: String) {
        sw.isOn = (value == "true")
    }
    
    override func updateValue() {
        self.value = "\(sw.isOn)"
    }
}
