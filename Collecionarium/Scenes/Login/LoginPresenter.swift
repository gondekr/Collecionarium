//
//  Created by Rubens Gondek on 4/17/19.
//  Copyright (c) 2019 Gondek. All rights reserved.
//

import UIKit

protocol LoginPresenterInput {
    func presentError()
    func presentSuccessLogin()
}

protocol LoginPresenterOutput: class {
    func showAlert(_ alert: UIAlertController)
    func showSuccessLogin()
}

class LoginPresenter: LoginPresenterInput {
    weak var output: LoginPresenterOutput!

    func presentError() {
        let alert = UIAlertController(title: "Erro", message: "Tente novamente", preferredStyle: .alert)
        output.showAlert(alert)
    }

    func presentSuccessLogin() {
        output.showSuccessLogin()
    }
}
