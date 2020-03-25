//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListInteractorInput {
    func fetchGroups()
}

protocol GroupListInteractorOutput {
    func presentGroups(_ groups: [GroupData])
}

class GroupListInteractor: GroupListInteractorInput {
    var output: GroupListInteractorOutput!
    var worker: GroupListWorker!

    func fetchGroups() {
        let groups = worker.getGroups()
        output.presentGroups(groups)
    }
}
