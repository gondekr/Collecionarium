//
//  Created by Rubens Gondek on 4/29/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

extension Group {
    func toData() -> GroupData {
        var data = GroupData()
        data.id = id?.uuidString ?? ""
        data.name = name ?? ""
        data.color = color ?? "#FFF"
        if let fields = fields?.array as? [Field] {
            data.fields = fields.map { $0.toData() }
        }
        return data
    }
}

extension Field {
    func toData() -> FieldData {
        var data = FieldData()
        data.id = id?.uuidString ?? ""
        data.name = name ?? ""
        data.type = DataType(rawValue: type ?? "") ?? .string
        data.isTitle = isTitle?.boolValue ?? false
        return data
    }
}
