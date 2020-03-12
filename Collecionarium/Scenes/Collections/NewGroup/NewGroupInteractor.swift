//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupInteractorInput {
    func saveGroup(_ group: GroupData)
}

protocol NewGroupInteractorOutput {
    func presentSuccess(_ success: Bool)
}

class NewGroupInteractor: NewGroupInteractorInput {
    var output: NewGroupInteractorOutput!
    var worker: NewGroupWorker!

    // MARK: Business logic
    func saveGroup(_ group: GroupData) {
        let success = worker.saveGroup(data: group)
        output.presentSuccess(success)
    }
}
