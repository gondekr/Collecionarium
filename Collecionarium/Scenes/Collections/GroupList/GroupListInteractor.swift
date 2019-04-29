//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListInteractorInput {
    func fetchSomething()
}

protocol GroupListInteractorOutput {
    func presentSomething()
}

class GroupListInteractor: GroupListInteractorInput {
    var output: GroupListInteractorOutput!
    var worker: GroupListWorker!

    // MARK: Business logic
    func fetchSomething() {
        output.presentSomething()
    }
}

