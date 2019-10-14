//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListPresenterInput {
    func presentError()
}

protocol GroupListPresenterOutput: class {
    func showAlert()
}

class GroupListPresenter: GroupListPresenterInput {
    weak var output: GroupListPresenterOutput!

    func presentError() {
        output.showAlert()
    }
}
