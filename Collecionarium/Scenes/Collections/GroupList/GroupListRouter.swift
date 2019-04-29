//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListRouterInput {
    func navigateToGroup()
}

class GroupListRouter: GroupListRouterInput {
    weak var viewController: GroupListVC!

    let groupSegue = "group"

    // MARK: Navigation
    func navigateToGroup() {
        viewController.performSegue(withIdentifier: groupSegue, sender: nil)
    }

    // MARK: Communication
    func passDataToNextScene(_ segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        if segue.identifier == groupSegue {
            passDataToGroupScene(segue)
        }
    }

    func passDataToGroupScene(_ segue: UIStoryboardSegue) {
        // NOTE: Teach the router how to pass data to the next scene

        // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
        // someWhereViewController.output.name = viewController.output.name
    }
}
