//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListVCInput {
    func displaySomething()
}

protocol GroupListVCOutput {
    func askForSomething()
}

class GroupListVC: UIViewController {
    var output: GroupListVCOutput!
    var router: GroupListRouter!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        GroupListConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomethingOnLoad()
    }

    func doSomethingOnLoad() {
        output.askForSomething()
    }
}

extension GroupListVC: GroupListVCInput {
    func displaySomething() {
        // Use results
    }
}

