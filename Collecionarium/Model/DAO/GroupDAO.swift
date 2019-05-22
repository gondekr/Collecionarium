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

    private func newGroup(id: String? = nil) -> Group? {
        if let string = id, let item = get(id: string) {
            return item
        }

        let group = new()
        group?.id = UUID().uuidString
        return group
    }

    func saveGroup(data: GroupData) -> Bool {
        guard let group = newGroup(id: data.id) else { return false }
        group.name = data.name
        group.color = data.color
        let form: [Field] = data.fields.map({ (field) -> Field? in
            let field = fieldDao.newField(
                group: group,
                name: field.name,
                type: field.type,
                title: field.isTitle)
            return field
        }).filter { $0 != nil }.map { $0! }
        let set = NSOrderedSet(array: form)
        group.addToFields(set)
        save()
        return true
    }
}
