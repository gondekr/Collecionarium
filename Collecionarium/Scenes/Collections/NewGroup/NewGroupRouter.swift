//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupRouterInput {
    func goBack()
    func passDataToNextScene(_ segue: UIStoryboardSegue)
}

class NewGroupRouter: NewGroupRouterInput {
    weak var viewController: NewGroupVC!

    let _otherScene_Segue = "somewhere"

    // MARK: Navigation
    func goBack() {
        viewController.dismiss(animated: true, completion: nil)
    }

    // MARK: Communication
    func passDataToNextScene(_ segue: UIStoryboardSegue) {

    }
}
