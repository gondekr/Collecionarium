//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupTypePresenterInput {
    func formatError()
}

protocol GroupTypePresenterOutput: class {
    func showAlert(_ alert: UIAlertController)
    func showSuccessGroupType()
}

class GroupTypePresenter: GroupTypePresenterInput {
    weak var output: GroupTypePresenterOutput!

    func formatError() {
        output.showAlert(UIAlertController())
    }
}
