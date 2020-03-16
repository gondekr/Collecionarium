//
//  Created by Rubens Gondek on 16/03/20.
//  Copyright © 2020 Gondek. All rights reserved.
//

enum DataType: String {
    case string
    case text
    case number
    case year
    case date
    case boolean

    static func getAll() -> [DataType] {
        return [.string, .text, .number, .year, .date, .boolean]
    }
}
