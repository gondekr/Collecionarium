//
//  Created by Rubens Gondek.
//

import CoreData
import UIKit

class CollectionManager {
    static let sharedInstance = CollectionManager()
    let iManager = ItemManager.sharedInstance
    static let entityName = "Collection"
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.managedObjectContext
        }()
    
    func newCollection() -> Collection {
        let coll = (NSEntityDescription.insertNewObject(forEntityName: CollectionManager.entityName, into: managedObjectContext) as? Collection)!
        coll.id = fetchCollections().count as NSNumber
        return coll
    }
    
    func newCollectionFromPreDef(pre: PreDefCollection) {
        let coll = newCollection()
        coll.types = pre.types
        coll.fields = pre.fields
        coll.titleIndex = pre.titleIndex
        coll.name = pre.name
        save()
    }
    
    func insertCollection(name: String, fields: [String], types: [String], titleIndex: Int) -> (Collection,Void){
        let coll = newCollection()
        coll.name = name
        coll.types = types
        coll.fields = fields
        coll.titleIndex = titleIndex as NSNumber
        save()
        return (coll,())
    }
    
    func save() {
        do {
            try managedObjectContext.save()
        } catch {
            
        }
    }
    
    func fetchCollections() -> Array<Collection> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CollectionManager.entityName)
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
            
            if let results = fetchedResults as? [Collection] {
                return results;
            }
        } catch {
            
        }
        
        return Array<Collection>()
    }
    
    func deleteCollection(coll: Collection) {
        managedObjectContext.delete(coll)
        save()
    }
    
    func resetLocal() {
        let collections = fetchCollections()
        for coll in collections {
            managedObjectContext.delete(coll)
        }
        save()
    }
}
