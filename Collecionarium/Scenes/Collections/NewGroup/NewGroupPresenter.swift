//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupPresenterInput {
    func presentError()
    func formatSomething()
}

protocol NewGroupPresenterOutput: class {
    func showAlert(_ alert: UIAlertController)
}

class NewGroupPresenter: NewGroupPresenterInput {
    weak var output: NewGroupPresenterOutput!

    func presentError() {
        let alert = UIAlertController()
        output.showAlert(alert)
    }

    func formatSomething() {

    }
}
