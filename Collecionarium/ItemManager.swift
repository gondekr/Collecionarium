//
//  ItemManager.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/24/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import CoreData
import UIKit
import Parse

class ItemManager {
    
    static let sharedInstance = ItemManager()
    static let entityName = "Item"
    
    // Default Methods
    lazy var managedObjectContext: NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
        }()
    
    // Create Item
    func newItem() -> Item {
        let item = NSEntityDescription.insertNewObjectForEntityForName(ItemManager.entityName, inManagedObjectContext: managedObjectContext) as! Item
        item.id = fetchItems().count
        return item
    }
    
    func insertItem(values: [String], photos: [NSData], subs: [String], coll: Collection) {
        let item = newItem()
        item.values = values
        item.photos = photos
        item.subtitle = subs
        item.collection = coll
        save()
    }
    
    // Save
    func save() {
        do {
            try managedObjectContext.save()
        } catch {
            
        }
    }
    
    // Read Items
    func fetchItems() -> Array<Item> {
        let fetchRequest = NSFetchRequest(entityName: ItemManager.entityName)
        
        do {
            let fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest)
            
            if let results = fetchedResults as? [Item] {
                return results
            }
        } catch {
            
        }
        
        return Array<Item>()
    }
    
    func fetchItems(collect: Collection) -> Array<Item> {
        let fetchRequest = NSFetchRequest(entityName: ItemManager.entityName)
        fetchRequest.predicate = NSPredicate(format: "collection == %@", collect)
        do {
            let fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest)
            
            if let results = fetchedResults as? [Item] {
                return results;
            }
        } catch {
            
        }
        
        return Array<Item>()
    }
    
    func getItem(id: Int) -> Item{
        let fetchRequest = NSFetchRequest(entityName: ItemManager.entityName)
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest)
            
            if let results = fetchedResults as? [Item] {
                return results.first!;
            }
        } catch {
            
        }
        
        return Item()
    }

    
    // Delete Items
    func deleteItem(item: Item) {
        managedObjectContext.deleteObject(item)
        save()
    }
    
    // Update Field
    func deleteField(collect: Collection, index: Int) {
        let items = fetchItems(collect)
        for item in items {
            item.values.removeAtIndex(index)
        }
        if collect.titleIndex == index {
            collect.titleIndex = -1
        }
        save()
    }
    
    func addField(collect: Collection) {
        let items = fetchItems(collect)
        for item in items {
            item.values.append("")
        }
        save()
    }
    

    // Update Photos
    func deletePhoto(item: Item, photoIndex: Int) -> Item {
        item.photos.removeAtIndex(photoIndex)
        item.subtitle.removeAtIndex(photoIndex)
        save()
        
        return item
    }
    
//    func addPhoto(item: Item, photo: String, sub: String) -> Item {
//        item.photos.append(photo)
//        item.subtitle.append(sub)
//        save()
//        
//        return item
//    }
    
    func defineCover(item: Item, photoIndex: Int) -> Item {
        item.photos.insert(item.photos[photoIndex], atIndex: 0)
        item.photos.removeAtIndex(photoIndex+1)
        item.subtitle.insert(item.subtitle[photoIndex], atIndex: 0)
        item.subtitle.removeAtIndex(photoIndex+1)
        save()
        
        return item
    }
    
    func changeSub(item: Item, photoIndex: Int, sub: String) -> Item {
        item.subtitle[photoIndex] = sub
        save()
        
        return item
    }
}