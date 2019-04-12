//
//  ItemParse.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/6/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import UIKit
import Parse

@objc protocol IParseDelegate {
    optional func didGetItems(objs: [PFObject])
    func didFinishWithError(msg: String)
    optional func didSaveItem()
}

class ItemParse {
    static let sharedInstance = ItemParse()
    let cName = "Item"
    
    var delegate: IParseDelegate?
    
    let eParse = EventParse.sharedInstance
    
    func getAllByCollection(coll: PFObject) {
        let query = PFQuery(className: cName)
        query.whereKey("collection", equalTo: coll)
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                self.delegate?.didGetItems!(objs!)
            }
            else {
                self.delegate?.didFinishWithError("Não pegou todos os itens da coleção")
            }
        }
    }
    
    func getItemByID(id: String) -> PFObject? {
        let query = PFQuery(className: cName)
        query.whereKey("objectId", equalTo: id)
        do {
            let arr = try query.findObjects()
            return arr.first
        }
        catch {
            print("Não consegui pegar a coleção")
        }
        return PFObject()
    }
    
    func newItem(values: [String], ph: [PFFile], subs: [String], coll: PFObject) -> (PFObject,Void){
        let obj = PFObject(className: "Item")
        obj["values"] = values
        obj["photos"] = ph
        obj["subtitle"] = subs
        obj["collection"] = coll
        obj["forSale"] = false
        obj["forTrade"] = false
        obj.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                print("SALVO!")
                if coll["shared"] as! Bool {
                    self.eParse.newEvent(2, txt: "NEW_ITEM", item: obj, coll: coll, img: ph.first)
                }
                self.delegate?.didSaveItem!()
            }
            else {
                print("NEM SALVOU O ITEM!")
            }
        }
        return (obj,())
    }
    
    func addField(field: String, coll: PFObject) {
        let query = PFQuery(className: cName)
        query.whereKey("collection", equalTo: coll)
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                for item in objs! {
                    var val = item["values"] as! [String]
                    val.append(field)
                    item["values"] = val
                    item.saveInBackground()
                }
            }
            else {
                self.delegate?.didFinishWithError("Não pegou todos os itens da coleção")
            }
        }
        
    }
    
    func deleteField(coll: PFObject, index: Int) {
        let query = PFQuery(className: cName)
        query.whereKey("collection", equalTo: coll)
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                for item in objs! {
                    var val = item["values"] as! [String]
                    val.removeAtIndex(index)
                    item["values"] = val
                    item.saveInBackground()
                }
            }
            else {
                self.delegate?.didFinishWithError("Não pegou todos os itens da coleção")
            }
        }
    }
    
    func deleteItem(obj: PFObject) {
        obj.deleteInBackground()
        eParse.deleteEventsOfItem(obj)
    }
}
