import Foundation
import CoreData

public class Item: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: NSNumber?
    @NSManaged public var photos: NSObject?
    @NSManaged public var subtitle: NSObject?
    @NSManaged public var values: NSObject?
    @NSManaged public var collection: Collection?
}
