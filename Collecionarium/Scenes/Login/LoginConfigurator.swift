//
//  Created by Rubens Gondek on 4/17/19.
//  Copyright (c) 2019 Gondek. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter
extension LoginVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}

extension LoginVC: LoginPresenterOutput {
    func showAlert() {
        displayAlert(alert)
    }

    func showSuccessLogin() {
        displaySuccessLogin()
    }
}

extension LoginInteractor: LoginVCOutput {

}

extension LoginPresenter: LoginInteractorOutput {

}

class LoginConfigurator {
    // MARK: Object lifecycle
    static let shared = LoginConfigurator()

    // MARK: Configuration
    func configure(viewController: LoginVC) {
        let router = LoginRouter()
        router.viewController = viewController

        let presenter = LoginPresenter()
        presenter.output = viewController

        let interactor = LoginInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
