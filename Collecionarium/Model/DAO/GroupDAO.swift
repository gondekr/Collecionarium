//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import Foundation

class GroupDAO: BaseDAO<Group> {
    let fieldDao = FieldDAO()

    convenience init() {
        self.init(entityName: "Group")
    }

    private func newGroup() -> Group? {
        let item = new()
        item?.id = UUID()
        return item
    }

    func insertGroup(name: String, fields: [(key: String, type: DataType, title: Bool)]) {
        guard let group = newGroup() else { return }
        group.name = name
        let form: [Field] = fields.map({ (field) -> Field? in
            let field = fieldDao.newField(
                group: group,
                name: field.key,
                type: field.type,
                title: field.title)
            return field
        }).filter { $0 != nil }.map { $0! }
        let set = NSOrderedSet(array: form)
        group.addToFields(set)
        save()
    }
}
