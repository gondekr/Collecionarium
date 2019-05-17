//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter
extension GroupTypeVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}

extension GroupTypeVC: GroupTypePresenterOutput {
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.displayAlert(alert)
        }
    }

    func showTypes(_ types: [GroupData]) {
        DispatchQueue.main.async {
            self.displayTypes(types)
        }
    }
}

extension GroupTypeInteractor: GroupTypeVCOutput {
    func askForTypes() {
        fetchTypes()
    }
}

extension GroupTypePresenter: GroupTypeInteractorOutput {
    func presentTypes(_ types: [GroupData]) {
        formatTypes(types)
    }
}

class GroupTypeConfigurator {
    // MARK: Object lifecycle
    static let shared = GroupTypeConfigurator()

    // MARK: Configuration
    func configure(viewController: GroupTypeVC) {
        let router = GroupTypeRouter()
        router.viewController = viewController

        let presenter = GroupTypePresenter()
        presenter.output = viewController

        let interactor = GroupTypeInteractor()
        interactor.worker = GroupTypeWorker()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
