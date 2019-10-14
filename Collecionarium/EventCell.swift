//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var imgItem: DesignImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var imgType: DesignImageView!
    @IBOutlet weak var cellBody: DesignView!
    
    let colors = [UIColor(red: 68/255, green: 140/255, blue: 203/255, alpha: 1),
                  UIColor(red: 124/255, green: 197/255, blue: 118/255, alpha: 1),
                  UIColor(red: 247/255, green: 202/255, blue: 24/255, alpha: 1),
                  UIColor(red: 246/255, green: 71/255, blue: 71/255, alpha: 1)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
