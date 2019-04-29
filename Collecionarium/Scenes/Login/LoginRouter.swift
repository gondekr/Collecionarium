//
//  Created by Rubens Gondek on 4/17/19.
//  Copyright (c) 2019 Gondek. All rights reserved.
//

import UIKit

protocol LoginRouterInput {
    func navigateToHome()
}

class LoginRouter: LoginRouterInput {
    weak var viewController: LoginViewController!

    let homeSegue = "showHome"

    // MARK: Navigation
    func navigateToHome() {
        viewController.performSegue(withIdentifier: homeSegue, sender: nil)
    }

    // MARK: Communication
    func passDataToNextScene(_ segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        if segue.identifier == homeSegue {
            passDataToHome(segue)
            return
        }
    }

    func passDataToHome(_ segue: UIStoryboardSegue) {

    }
}
