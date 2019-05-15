//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter
extension NewGroupVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}

extension NewGroupVC: NewGroupPresenterOutput {
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.displayAlert(alert)
        }
    }
}

extension NewGroupInteractor: NewGroupVCOutput {
    func askForSomething() {
        fetchSomething()
    }
}

extension NewGroupPresenter: NewGroupInteractorOutput {
    func presentSomething() {
        formatSomething()
    }
}

class NewGroupConfigurator {
    // MARK: Object lifecycle
    static let shared = NewGroupConfigurator()

    // MARK: Configuration
    func configure(viewController: NewGroupVC) {
        let router = NewGroupRouter()
        router.viewController = viewController

        let presenter = NewGroupPresenter()
        presenter.output = viewController

        let interactor = NewGroupInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
