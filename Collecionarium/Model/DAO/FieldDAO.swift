//
//  Created by Rubens Gondek on 4/29/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import Foundation

class FieldDAO: BaseDAO<Field> {
    convenience init() {
        self.init(entityName: "Field")
    }

    func newField(group: Group, name: String, type: DataType, title: Bool) -> Field? {
        let item = new()
        item?.id = UUID().uuidString
        item?.name = name
        item?.type = type.rawValue
        item?.isTitle = NSNumber(value: title)
        item?.group = group
        return item
    }
}
