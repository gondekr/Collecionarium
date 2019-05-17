//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

class NewGroupWorker {
    var dao: GroupDAO!

    func saveGroup(name: String, fields: [String: DataType], title: String) {
        let mapped = fields.map { (key: $0.key, type: $0.value, title: $0.key == title) }
        dao.insertGroup(name: name, fields: mapped)
    }
}
