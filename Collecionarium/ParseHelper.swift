//
//  ParseHelper.swift
//  BigApp
//
//  Created by Rubens Gondek on 9/10/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import Parse

class ParseHelper {
    static let sharedInstance = ParseHelper()
    
    func CheckAndUpdate(cloud: Bool) {
        if cloud {
            
        }
    }
    

    
    func deleteCollection(id: Int) {
        let query = PFQuery(className: "Collection")
        query.whereKey("numID", equalTo: id)
        do {
            let array = try query.findObjects()
            array.first?.deleteInBackground()
        }
        catch {
            print("Deu ruim")
        }
    }
    
    func getCollections() -> [Collection]{
        let query = PFQuery(className: "Collection")
        do {
            let array = try query.findObjects()
            var all: [Collection] = []
            for obj in array {
                all.append(makeCollectionFromPFObj(obj))
            }
            return all
        }
        catch {
            print("Deu ruim")
        }
        return [Collection]()
    }
    
    func getCollectionByID(id: String) -> PFObject? {
        let query = PFQuery(className: "Collection")
        query.whereKey("objectId", equalTo: id)
        do {
            let array = try query.findObjects()
            for obj in array {
                return obj
            }
        }
        catch {
            print("Deu ruim")
        }
        return nil
    }
    
    func makeCollectionFromPFObj(obj: PFObject) -> Collection {
        let coll = Collection()
        coll.id = obj["numID"] as? NSNumber
        coll.name = obj["name"] as? String
        coll.fields = (obj["fields"] as? [String])!
        coll.types = (obj["types"] as? [String])!
        coll.titleIndex = obj["titleIndex"] as? NSNumber
        
        return coll
    }
    
    // ITEM
    
    
    func deleteItem(id: Int) {
        let query = PFQuery(className: "Item")
        query.whereKey("numID", equalTo: id)
        do {
            let array = try query.findObjects()
            array.first?.deleteInBackground()
        }
        catch {
            print("Deu ruim")
        }
    }

//    func getItems() -> [Item]{
//        let query = PFQuery(className: "Item")
//        do {
//            let array = try query.findObjects()
//            var all: [Item] = []
//            for obj in array {
//                all.append(makeItemFromPFObj(obj))
//            }
//            return all
//        }
//        catch {
//            print("Deu ruim")
//        }
//        return [Item]()
//    }
    
    func getItemByID(id: String) -> PFObject? {
        let query = PFQuery(className: "Item")
        query.whereKey("objectId", equalTo: id)
        do {
            let array = try query.findObjects()
            for obj in array {
                return obj
            }
        }
        catch {
            print("Deu ruim")
        }
        return nil
    }
    
//    func makeItemFromPFObj(obj: PFObject) -> Item {
//        let it = Item()
//        it.id = obj["numID"] as? NSNumber
//        it.values = (obj["values"] as? [String])!
//        it.photos = (obj["photos"] as? [String])!
//        it.subtitle = (obj["subtitle"] as? [String])!
//        
//        return it
//    }
//    
}
