//
//  Created by Rubens Gondek on 5/20/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol ChooseColorRouterInput {
    func goBack()
    func passDataToNextScene(_ segue: UIStoryboardSegue)
}

class ChooseColorRouter: ChooseColorRouterInput {
    weak var viewController: ChooseColorVC!

    // MARK: Navigation
    func goBack() {
        viewController.navigationController?.popViewController(animated: true)
    }

    // MARK: Communication
    func passDataToNextScene(_ segue: UIStoryboardSegue) {}
}
