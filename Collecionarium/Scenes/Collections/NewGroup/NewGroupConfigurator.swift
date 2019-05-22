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

    func showSuccess(_ success: Bool) {
        DispatchQueue.main.async {
            self.displaySuccess(success)
        }
    }
}

extension NewGroupInteractor: NewGroupVCOutput {
    func askForGroupSave(_ group: GroupData) {
        saveGroup(group)
    }
}

extension NewGroupPresenter: NewGroupInteractorOutput {
    func presentSuccess(_ success: Bool) {
        formatSuccess(success)
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

        let worker = NewGroupWorker()
        worker.dao = GroupDAO()
        interactor.worker = worker
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
