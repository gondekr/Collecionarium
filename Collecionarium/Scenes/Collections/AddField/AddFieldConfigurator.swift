//
//  Created by Rubens Gondek on 5/21/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter
extension AddFieldVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}

class AddFieldConfigurator {
    // MARK: Object lifecycle
    static let shared = AddFieldConfigurator()

    // MARK: Configuration
    func configure(viewController: AddFieldVC) {
        let router = AddFieldRouter()
        router.viewController = viewController
        viewController.router = router
    }
}
