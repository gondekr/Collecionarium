//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupTypeInteractorInput {
    func fetchSomething()
}

protocol GroupTypeInteractorOutput {
    func presentSomething()
}

class GroupTypeInteractor: GroupTypeInteractorInput {
    var output: GroupTypeInteractorOutput!
    var worker: GroupTypeWorker!

    // MARK: Business logic
    func fetchSomething() {
        output.presentSomething()
    }
}
