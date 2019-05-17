//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListRouterInput {
    func navigateToGroup()
    func navigateToGroupType()
    func passDataToNextScene(_ segue: UIStoryboardSegue)
}

class GroupListRouter: GroupListRouterInput {
    weak var viewController: GroupListVC!

    let groupSegue = "group"
    let groupTypeSegue = "groupType"

    // MARK: Navigation
    func navigateToGroup() {
        viewController.performSegue(withIdentifier: groupSegue, sender: nil)
    }

    func navigateToGroupType() {
        viewController.performSegue(withIdentifier: groupTypeSegue, sender: nil)
    }

    // MARK: Communication
    func passDataToNextScene(_ segue: UIStoryboardSegue) {
        if segue.identifier == groupSegue {
            passDataToGroupScene(segue)
            return
        }

        if segue.identifier == groupTypeSegue {
            passDataToGroupTypeScene(segue)
            return
        }
    }

    func passDataToGroupScene(_ segue: UIStoryboardSegue) {

    }

    func passDataToGroupTypeScene(_ segue: UIStoryboardSegue) {
        guard let vc = segue.destination as? GroupTypeVC
            else { return }
    }
}
