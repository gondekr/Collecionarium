//
//  Created by Rubens Gondek.
//

import CoreData
import UIKit

class CollectionManager {
    static let sharedInstance = CollectionManager()
    let iManager = ItemManager.sharedInstance
    static let entityName = "Collection"
}
