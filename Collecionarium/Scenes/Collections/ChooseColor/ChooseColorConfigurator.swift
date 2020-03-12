//
//  Created by Rubens Gondek on 5/20/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter
extension ChooseColorVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}

class ChooseColorConfigurator {
    // MARK: Object lifecycle
    static let shared = ChooseColorConfigurator()

    // MARK: Configuration
    func configure(viewController: ChooseColorVC) {
        let router = ChooseColorRouter()
        router.viewController = viewController
        viewController.router = router
    }
}
