//
//  Copyright © 2019 GondekR. All rights reserved.
//

import Foundation
import UIKit

/** Hey Class
A helper for converting dataTypes, or anything I find useful.
*/

public enum ObjectType {
    case Local
    case Cloud
}

public let dataTypes = ["String", "Text", "Number", "Year", "Date", "Boolean"]
public let dataTitles = [
    NSLocalizedString("DTT_STRING", comment: ""),
    NSLocalizedString("DTT_TEXT", comment: ""),
    NSLocalizedString("DTT_NUMBER", comment: ""),
    NSLocalizedString("DTT_YEAR", comment: ""),
    NSLocalizedString("DTT_DATE", comment: ""),
    "Yes or No"
]

public struct ReuseID {
    static let collection = "CollectionCell"

    static let collectionName = "CollNameCell"
    static let field = "CollFieldCell"
    static let fieldName = "CollFieldNameCell"
    static let fieldType = "CollFieldTypeCell"
    static let titleField = "CollTitleFieldCell"
    static let addField = "AddFieldCell"

    static let item = "ItemCell"

    static let photosView = "ItemPhotosCell"

    static let customType = ["StringCell", "TextCell", "IntCell", "YearCell", "DateCell", "BoolCell"]

    static let photo = "PhotoCell"
    static let string = "StringCell"
    static let text = "TextCell"
    static let int = "IntCell"
    static let double = "DoubleCell"
    static let year = "YearCell"
    static let date = "DateCell"
    static let addNewPhoto = "NewPhotoCell"
}

public func getIMG(img: String) -> UIImage? {
    return UIImage(contentsOfFile: img.appendingFormat(".jpeg"))
}

class Hey {
    static let helpMe = Hey()
}
