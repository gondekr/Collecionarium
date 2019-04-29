//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import Foundation

class GroupDAO: BaseDAO<Group> {

    func newGroup() -> Group? {
        let item = new()
        item?.id = UUID().uuidString
        return item
    }

    func insertGroup() {

    }
}
