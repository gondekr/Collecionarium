//
//  Created by Rubens Gondek on 4/29/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

class GroupListWorker {
    var dao: GroupDAO!

    func getGroups() -> [GroupData] {
        return dao.fetch().map { $0.toData() }
    }
}
