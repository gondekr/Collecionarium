import Foundation
import CoreData

public class Group: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var userId: String?
    @NSManaged public var modificationDate: String?
    @NSManaged public var predefined: NSNumber?
    @NSManaged public var items: NSSet?
    @NSManaged public var fields: NSOrderedSet?
}

// MARK: Generated accessors for items
extension Group {
    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)
}

// MARK: Generated accessors for fields
extension Group {
    @objc(insertObject:inFieldsAtIndex:)
    @NSManaged public func insertIntoFields(_ value: Field, at idx: Int)

    @objc(removeObjectFromFieldsAtIndex:)
    @NSManaged public func removeFromFields(at idx: Int)

    @objc(insertFields:atIndexes:)
    @NSManaged public func insertIntoFields(_ values: [Field], at indexes: NSIndexSet)

    @objc(removeFieldsAtIndexes:)
    @NSManaged public func removeFromFields(at indexes: NSIndexSet)

    @objc(replaceObjectInFieldsAtIndex:withObject:)
    @NSManaged public func replaceFields(at idx: Int, with value: Field)

    @objc(replaceFieldsAtIndexes:withFields:)
    @NSManaged public func replaceFields(at indexes: NSIndexSet, with values: [Field])

    @objc(addFieldsObject:)
    @NSManaged public func addToFields(_ value: Field)

    @objc(removeFieldsObject:)
    @NSManaged public func removeFromFields(_ value: Field)

    @objc(addFields:)
    @NSManaged public func addToFields(_ values: NSOrderedSet)

    @objc(removeFields:)
    @NSManaged public func removeFromFields(_ values: NSOrderedSet)
}
