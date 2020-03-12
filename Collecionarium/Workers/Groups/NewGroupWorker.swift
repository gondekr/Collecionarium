//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

class NewGroupWorker {
    var dao: GroupDAO!

    func saveGroup(data: GroupData) -> Bool {
        return dao.saveGroup(data: data)
    }
}
