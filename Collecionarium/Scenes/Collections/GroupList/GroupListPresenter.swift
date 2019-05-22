//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListPresenterInput {
    func presentError()
    func formatGroups(_ groups: [GroupData])
}

protocol GroupListPresenterOutput: class {
    func showAlert()
    func showGroups(_ groups: [GroupData])
}

class GroupListPresenter: GroupListPresenterInput {
    weak var output: GroupListPresenterOutput!

    func formatGroups(_ groups: [GroupData]) {
        let sorted = groups.sorted { (data1, data2) -> Bool in
            data1.name < data2.name
        }
        output.showGroups(sorted)
    }

    func presentError() {
        output.showAlert()
    }
}
