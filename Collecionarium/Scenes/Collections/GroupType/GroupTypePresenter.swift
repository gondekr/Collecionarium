//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupTypePresenterInput {
    func formatError()
    func formatTypes(_ types: [GroupData])
}

protocol GroupTypePresenterOutput: class {
    func showAlert(_ alert: UIAlertController)
    func showTypes(_ types: [GroupData])
}

class GroupTypePresenter: GroupTypePresenterInput {
    weak var output: GroupTypePresenterOutput!

    func formatTypes(_ types: [GroupData]) {
        output.showTypes(types)
    }

    func formatError() {
        output.showAlert(UIAlertController())
    }
}
