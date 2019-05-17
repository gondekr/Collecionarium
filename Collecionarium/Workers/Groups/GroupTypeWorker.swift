//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import Foundation

class GroupTypeWorker {
    var dao: GroupDAO!

    func getGroups() -> [GroupData] {
        let predicate = NSPredicate(format: "predefined == %@", true)
        return dao.fetch(predicate: predicate).map { $0.toData() }
    }
}
