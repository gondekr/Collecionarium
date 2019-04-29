import Foundation
import CoreData

@objc(Field)
public class Field: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Field> {
        return NSFetchRequest<Field>(entityName: "Field")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var id: String?
    @NSManaged public var isTitle: NSNumber?
    @NSManaged public var group: Group?
}
