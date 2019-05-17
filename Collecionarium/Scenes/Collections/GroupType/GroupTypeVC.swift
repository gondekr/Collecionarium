//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupTypeVCInput {
    func displayAlert(_ alert: UIAlertController)
}

protocol GroupTypeVCOutput {
    func askForSomething()
}

class GroupTypeVC: UIViewController {
    var output: GroupTypeVCOutput!
    var router: GroupTypeRouter!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        GroupTypeConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomethingOnLoad()
    }

    func doSomethingOnLoad() {
        output.askForSomething()
    }
}

extension GroupTypeVC: GroupTypeVCInput {
    func displayAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}
