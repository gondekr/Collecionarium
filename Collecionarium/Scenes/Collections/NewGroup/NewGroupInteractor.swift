//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupInteractorInput {
    func fetchSomething()
}

protocol NewGroupInteractorOutput {
    func presentSomething()
}

class NewGroupInteractor: NewGroupInteractorInput {
    var output: NewGroupInteractorOutput!
    var worker: NewGroupWorker!

    // MARK: Business logic
    func fetchSomething() {
        output.presentSomething()
    }
}
