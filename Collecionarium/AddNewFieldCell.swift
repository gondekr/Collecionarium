//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

@objc protocol AddFieldDelegateOld {
    @objc optional func buttonTapped()
}

class AddNewFieldCell: UITableViewCell {

    @IBOutlet weak var btn: UIButton!
    var delegate: AddFieldDelegateOld?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btn.layer.cornerRadius = btn.frame.height/2
        btn.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func click(sender: AnyObject) {
        delegate?.buttonTapped!()
    }
    
}
