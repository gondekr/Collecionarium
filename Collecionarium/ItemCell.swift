//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class ItemCell: DesignCollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    
    // MARK: - Public API
    var titleIndex : Int? {
        didSet {
            if titleIndex != -1 {
                blur.isHidden = false
            }
            else {
                blur.isHidden = true
            }
        }
    }
}
