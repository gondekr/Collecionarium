//
//  Created by Rubens Gondek on 6/5/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol ItemListVCInput {
//    func displayItems(_ items: ItemData)
}

protocol ItemListVCOutput {

}

class ItemListVC: UIViewController {
    var output: ItemListVCOutput!
//    var router: ItemListRouter!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
//        ItemListConfigurator.shared.configure(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomethingOnLoad()
    }

    func doSomethingOnLoad() {
//        output.askForSomething()
    }
}

extension ItemListVC: ItemListVCInput {
    func displaySomething() {
        // Use results
    }
}
