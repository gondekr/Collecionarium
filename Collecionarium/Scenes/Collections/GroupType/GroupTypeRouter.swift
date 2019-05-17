//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupTypeRouterInput {
    func navigateToNewGroup()
}

class GroupTypeRouter: GroupTypeRouterInput {
    weak var viewController: GroupTypeVC!

    let newGroupSegue = "newGroup"

    // MARK: Navigation
    func navigateToNewGroup() {
        viewController.performSegue(withIdentifier: newGroupSegue, sender: nil)
    }

    // MARK: Communication
    func passDataToNextScene(_ segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        if segue.identifier == newGroupSegue {
            passDataToNewGroupScene(segue)
        }
    }

    func passDataToNewGroupScene(_ segue: UIStoryboardSegue) {
        guard let vc = segue.destination as? NewGroupVC
            else { return }
    }
}
