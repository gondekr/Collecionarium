//
//  Created by Rubens Gondek on 5/17/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

class GroupTypeCell: UITableViewCell {
    static let nibName = "GroupTypeCell"
    static let identifier = "groupTypeCell"

    @IBOutlet weak var imgType: UIImageView!
    @IBOutlet weak var lblName: UILabel!

    func setGroup(data: GroupData) {
        let imageName = data.predefined ? data.id : "Custom"
        imgType.image = UIImage(named: imageName)
        lblName.text = data.name
    }
}
