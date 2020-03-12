import Foundation
import CoreData

@objc(Value)
public class Value: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Value> {
        return NSFetchRequest<Value>(entityName: "Value")
    }

    @NSManaged public var id: String?
    @NSManaged public var value: String?
    @NSManaged public var field: Field?
}
