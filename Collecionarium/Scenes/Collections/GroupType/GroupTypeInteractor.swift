//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupTypeInteractorInput {
    func fetchTypes()
}

protocol GroupTypeInteractorOutput {
    func presentTypes(_ types: [GroupData])
}

class GroupTypeInteractor: GroupTypeInteractorInput {
    var output: GroupTypeInteractorOutput!
    var worker: GroupTypeWorker!

    // MARK: Business logic
    func fetchTypes() {
        let types = worker.getTypes()
        output.presentTypes(types)
    }
}
