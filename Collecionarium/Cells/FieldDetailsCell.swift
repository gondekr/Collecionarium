//
//  Created by Rubens Gondek on 5/20/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

class FieldDetailsCell: UITableViewCell {
    static let nibName = "FieldDetailsCell"
    static let identifier = "fieldCell"

    @IBOutlet weak var titleTag: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblType: UILabel!

    func setupField(data: FieldData) {
        lblName.text = data.name
        lblType.text = data.type.rawValue.localized()
        titleTag.backgroundColor = data.isTitle ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }
}
