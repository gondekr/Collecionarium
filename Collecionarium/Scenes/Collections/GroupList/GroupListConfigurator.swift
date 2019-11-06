//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter
extension GroupListVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}

extension GroupListVC: GroupListPresenterOutput {
    func showAlert() {

    }
}

extension GroupListInteractor: GroupListVCOutput {
    func askForSomething() {

    }
}

extension GroupListPresenter: GroupListInteractorOutput {
    func presentSomething() {

    }
}

class GroupListConfigurator {
    // MARK: Object lifecycle
    static let shared = GroupListConfigurator()

    // MARK: Configuration
    func configure(viewController: GroupListVC) {
        let router = GroupListRouter()
        router.viewController = viewController

        let presenter = GroupListPresenter()
        presenter.output = viewController

        let worker = GroupListWorker()
        worker.dao = GroupDAO()

        let interactor = GroupListInteractor()
        interactor.worker = worker
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}

