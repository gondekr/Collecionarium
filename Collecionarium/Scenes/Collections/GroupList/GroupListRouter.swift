//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListRouterInput {
    func navigateToGroup()
    func navigateToEditGroup()
    func navigateToGroupType()
    func passDataToNextScene(_ segue: UIStoryboardSegue)
}

class GroupListRouter: GroupListRouterInput {
    weak var viewController: GroupListVC!

    let groupSegue = "group"
    let editGroupSegue = "editGroup"
    let groupTypeSegue = "groupType"

    // MARK: Navigation
    func navigateToEditGroup() {
        viewController.performSegue(withIdentifier: editGroupSegue, sender: nil)
    }

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

        if segue.identifier == editGroupSegue {
            passDataToEditGroupScene(segue)
            return
        }
    }

    func passDataToEditGroupScene(_ segue: UIStoryboardSegue) {
        guard let vc = segue.destination as? NewGroupVC,
            let selected = viewController.selected
            else { return }

        vc.baseGroup = selected
    }

    func passDataToGroupScene(_ segue: UIStoryboardSegue) {

    }

    func passDataToGroupTypeScene(_ segue: UIStoryboardSegue) {
//        guard let _ = segue.destination as? GroupTypeVC
//            else { return }
    }
}
