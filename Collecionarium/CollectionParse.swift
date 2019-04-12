//
//  CollectionPManager.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/5/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import Foundation
import Parse

@objc protocol CParseDelegate {
    optional func didGetCollections(objs: [PFObject], count: [Int])
    optional func didGetCollections(objs: [PFObject])
    func didFinishWithError(msg: String)
}

class CollectionParse {
    static let sharedInstance = CollectionParse()
    let iManager = ItemManager.sharedInstance
    let pUser = ParseUser.sharedInstance
    let eParse = EventParse.sharedInstance
    let cName = "Collection"
    
    var delegate: CParseDelegate?
    
    func getAllByUser(user: PFObject) {
        let query = PFQuery(className: cName)
        query.whereKey("user", equalTo: user)
        query.orderByAscending("name")
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                var count: [Int] = []
                for obj in objs! {
                    count.append(self.countItems(obj))
                }
                self.delegate?.didGetCollections!(objs!, count: count)
            }
            else {
                self.delegate?.didFinishWithError("Não consegui pegar as coleções")
            }
        }
    }
    
    func getByName(name: String) {
        let query = PFQuery(className: cName)
        query.whereKey("name", containsString: name)
        query.whereKey("shared", equalTo: true)
        query.orderByAscending("name")
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                self.delegate?.didGetCollections!(objs!)
            }
            else {
                self.delegate?.didFinishWithError("Não consegui pegar as coleções")
            }
        }
    }
    
    func getCollByID(id: String) -> PFObject {
        let query = PFQuery(className: cName)
        query.whereKey("objectId", containsString: id)
        do {
            return try query.findObjects().first!
        }
        catch {
            print("Não consegui pegar a coleção")
        }
        return PFObject()
    }
    
    func countItems(coll: PFObject) -> Int {
        let query = PFQuery(className: "Item")
        query.whereKey("collection", equalTo: coll)
        
        var x = 0
        let error = NSErrorPointer()
        x = query.countObjects(error)
        if error != nil {
            print("Não consegui contar os items da coleção")
        }
        return x
    }
    
    func deleteCollection(obj: PFObject) {
        let query = PFQuery(className: "Item")
        query.whereKey("collection", equalTo: obj)
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                for it in objs! {
                    it.deleteInBackground()
                }
            }
            else {
                self.delegate?.didFinishWithError("Não apagou todos os itens da coleção")
            }
        }
        eParse.deleteEventsOfCollection(obj)
        obj.deleteInBackground()
    }
    
    func insertCollection(name: String, fields: [String], types: [String], titleIndex: Int, shared: Bool) -> (PFObject,Void){
        let obj = PFObject(className: cName)
        obj["name"] = name
        obj["fields"] = fields
        obj["types"] = types
        obj["titleIndex"] = titleIndex
        obj["shared"] = shared
        obj["user"] = pUser.user
        obj.saveInBackground()
        if shared {
            eParse.newEvent(3, txt: "SHARED_COLLECTION", item: nil, coll: obj, img: nil)
        }
        return (obj,())
    }
    
    func addItemsToCoreData(coll: Collection, cloudColl: PFObject) {
        let query = PFQuery(className: "Item")
        query.whereKey("collection", equalTo: cloudColl)
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                for it in objs! {
                    let ph = (it["photos"] as? [PFFile])!
                    var photos: [NSData] = []
                    for p in ph {
                        do {
                            photos.append(try p.getData())
                        }
                        catch {
                            print("Erro na hora de pegar as fotos")
                        }
                    }
                    
                    self.iManager.insertItem(it["values"] as! [String],
                        photos: photos, subs: it["subtitle"] as! [String], coll: coll)
                    
                    it.deleteInBackground()
                    self.eParse.deleteEventsOfItem(it)
                }
            }
            else {
                self.delegate?.didFinishWithError("Não apagou todos os itens da coleção")
            }
        }
    }
    
    func resetCloud(user: PFObject) {
        let query = PFQuery(className: cName)
        query.whereKey("user", equalTo: user)
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                for coll in objs! {
                    self.deleteCollection(coll)
                }
            }
            else {
                self.delegate?.didFinishWithError("Não consegui pegar as coleções")
            }
        }
    }
    
}
