//
//  Created by Rubens Gondek on 4/30/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    static let nibName = "GroupCell"
    static let identifier = "groupCell"

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tagColor: UIView!

    func setupGroup(_ group: GroupData) {
        lblName.text = group.name
        tagColor.backgroundColor = group.color
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        lblName.text = ""
        tagColor.backgroundColor = UIColor.clear
    }
}
