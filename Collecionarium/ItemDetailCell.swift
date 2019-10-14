//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class ItemDetailCell: UITableViewCell {

    var delegate: ItemFieldDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.setSelected(false, animated: true)

        // Configure the view for the selected state
    }
    
    // MARK: - Public API
    var fieldName : String? {
        didSet {
            didSetName(name: fieldName!)
        }
    }
    var value : String? {
        didSet {
            didSetValue(value: value!)
        }
    }

    func didSetName(name: String) {}
    
    func didSetValue(value: String) {}
    
    func updateValue() {}
}
