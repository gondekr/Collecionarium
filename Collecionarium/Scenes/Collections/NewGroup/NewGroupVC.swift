//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupVCInput {
    func displaySomething()
    func displayAlert(_ alert: UIAlertController)
}

protocol NewGroupVCOutput {
    func askForSomething()
}

class NewGroupVC: UIViewController {
    var output: NewGroupVCOutput!
    var router: NewGroupRouterInput!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        NewGroupConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomethingOnLoad()
    }

    func doSomethingOnLoad() {
        output.askForSomething()
    }
}

extension NewGroupVC: NewGroupVCInput {
    func displaySomething() {
        // Use results
    }

    func displayAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}
