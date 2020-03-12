//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupPresenterInput {
    func formatError()
    func formatSuccess(_ success: Bool)
}

protocol NewGroupPresenterOutput: class {
    func showAlert(_ alert: UIAlertController)
    func showSuccess(_ success: Bool)
}

class NewGroupPresenter: NewGroupPresenterInput {
    weak var output: NewGroupPresenterOutput!

    func formatError() {
        let alert = UIAlertController()
        output.showAlert(alert)
    }

    func formatSuccess(_ success: Bool) {
        output.showSuccess(success)
    }
}
