//
//  CollectionManager.swift
//  BigApp
//
//  Created by Rubens Gondek.
//

import CoreData
import UIKit
import Parse

class CollectionManager {
    
    static let sharedInstance = CollectionManager()
    let iParse = ItemParse.sharedInstance
    let iManager = ItemManager.sharedInstance
    static let entityName = "Collection"
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
        }()
    
    func newCollection() -> Collection {
        let coll = (NSEntityDescription.insertNewObjectForEntityForName(CollectionManager.entityName, inManagedObjectContext: managedObjectContext) as? Collection)!
        coll.id = fetchCollections().count
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
        coll.titleIndex = titleIndex
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
        let fetchRequest = NSFetchRequest(entityName: CollectionManager.entityName)
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            let fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest)
            
            if let results = fetchedResults as? [Collection] {
                return results;
            }
        } catch {
            
        }
        
        return Array<Collection>()
    }
    
    func deleteCollection(coll: Collection) {
        managedObjectContext.deleteObject(coll)
        save()
    }
    
    func addItemsToParse(cloudColl: PFObject, coll: Collection) {
        let items = iManager.fetchItems(coll)
        for it in items {
            var ph: [PFFile] = []
            for p in it.photos {
                ph.append(PFFile(data: p)!)
            }
            
            iParse.newItem(it.values, ph: ph, subs: it.subtitle, coll: cloudColl)
            
            iManager.deleteItem(it)
        }
    }
    
    func resetLocal() {
        let collections = fetchCollections()
        for coll in collections {
            managedObjectContext.deleteObject(coll)
        }
        save()
    }
}