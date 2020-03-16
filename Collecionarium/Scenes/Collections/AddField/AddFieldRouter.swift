//
//  Created by Rubens Gondek on 5/20/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol AddFieldRouterInput {
    func goBack()
    func chooseType()
    func passDataToNextScene(_ segue: UIStoryboardSegue)
}

class AddFieldRouter: AddFieldRouterInput {
    weak var viewController: AddFieldVC!

    // MARK: Navigation
    func goBack() {
        viewController.navigationController?.popViewController(animated: true)
    }

    func chooseType() {
        let storyboard = UIStoryboard(name: "Pickers", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: CustomPickerVC.identifier)
        guard let picker = vc as? CustomPickerVC
            else { return }

        picker.delegate = viewController
        picker.localizedStrings = true
        picker.items = DataType.getAll().map { $0.rawValue }
        viewController.present(picker, animated: true, completion: nil)
    }

    // MARK: Communication
    func passDataToNextScene(_ segue: UIStoryboardSegue) {}
}
