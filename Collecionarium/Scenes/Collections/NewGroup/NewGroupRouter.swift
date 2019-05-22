//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupRouterInput {
    func goBack()
    func navigateToHome()
    func navigateToAddField()
    func navigateToChooseColor()
    func passDataToNextScene(_ segue: UIStoryboardSegue)
}

class NewGroupRouter: NewGroupRouterInput {
    weak var viewController: NewGroupVC!

    let addFieldSegue = "addField"
    let chooseColorSegue = "chooseColor"

    // MARK: Navigation
    func goBack() {
        viewController.navigationController?.popViewController(animated: true)
    }

    func navigateToHome() {
        viewController.navigationController?.popToRootViewController(animated: true)
    }

    func navigateToAddField() {
        viewController.performSegue(withIdentifier: addFieldSegue, sender: nil)
    }

    func navigateToChooseColor() {
        viewController.performSegue(withIdentifier: chooseColorSegue, sender: nil)
    }

    // MARK: Communication
    func passDataToNextScene(_ segue: UIStoryboardSegue) {
        if (segue.identifier == addFieldSegue) {
            passDataToAddFieldScene(segue)
            return
        }

        if (segue.identifier == chooseColorSegue) {
            passDataToChooseColorScene(segue)
            return
        }
    }

    func passDataToAddFieldScene(_ segue: UIStoryboardSegue) {
        guard let vc = segue.destination as? AddFieldVC
            else { return }

        let selected = viewController.selectedField
        vc.field = selected
        vc.fieldId = selected?.id ?? String(viewController.fields.count)
        vc.delegate = viewController
    }

    func passDataToChooseColorScene(_ segue: UIStoryboardSegue) {
        guard let vc = segue.destination as? ChooseColorVC
            else { return }

        vc.delegate = viewController
        vc.selectedColor = viewController.baseGroup.color
    }
}
