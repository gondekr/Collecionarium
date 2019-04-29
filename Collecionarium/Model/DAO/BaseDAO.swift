//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import CoreData
import Foundation

class BaseDAO<T: NSManagedObject> {
    let entityName: String
    init(entityName: String) {
        self.entityName = entityName
    }

    lazy var managedObjectContext: NSManagedObjectContext = {
        return CoreDataManager.collecionarium.mainManagedObjectContext
    }()

    func new() -> T? {
        let item = NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext)
        return item as? T
    }

    func save() {
        try? managedObjectContext.save()
    }

    func delete(item: T) {
        managedObjectContext.delete(item)
        save()
    }

    func fetch(predicate: NSPredicate? = nil, sort: (key: String, asc: Bool)? = nil) -> [T] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

        if let condition = predicate {
            fetchRequest.predicate = condition
        }

        if let sortedBy = sort {
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: sortedBy.key, ascending: sortedBy.asc)]
        }

        guard
            let fetchedResults = try? managedObjectContext.fetch(fetchRequest),
            let results = fetchedResults as? [T]
            else { return [] }

        return results
    }

    func get(id: String) -> T? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        guard
            let fetchedResults = try? managedObjectContext.fetch(fetchRequest),
            let results = fetchedResults as? [T],
            let first = results.first
            else { return nil }

        return first
    }
}
