//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

class NewGroupWorker {
    var dao: GroupDAO!

    func saveGroup(name: String, color: String, fields: [String: DataType], title: String) {
        let mapped = fields
            .map { FieldData(id: "", name: $0.key, type: $0.value, isTitle: $0.key == title) }
        let group = GroupData(id: "", name: name, color: color, fields: mapped, predefined: false)
        dao.insertGroup(data: group)
    }
}
