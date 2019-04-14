//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class ItemTextCell: ItemDetailCell, UITextViewDelegate {
    
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
    @IBOutlet weak var txtValue: UITextView!
    
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
    func textViewShouldReturn(textView: UITextView) -> Bool {
        delegate?.nextField!(tag: self.tag)
        return true
    }
}
