//
//  EventParse.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/9/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import Foundation
import Parse

//
//  Event Types
//
//  0 - Venda
//  1 - Troca
//  2 - Item adicionado
//  3 - Coleção compartilhada

@objc protocol EParseDelegate {
    optional func didGetEvents(objs: [PFObject])
    func didFinishWithError(msg: String)
}

class EventParse {
    static let sharedInstance = EventParse()
    let cName = "Event"
    
    let pUser = ParseUser.sharedInstance
    
    var delegate: EParseDelegate?
    
    // Venda e troca
    func getTradeEvents() {
        let query = PFQuery(className: cName)
        query.whereKey("type", lessThanOrEqualTo: 1)
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                self.delegate?.didGetEvents!(objs!)
            }
            else {
                self.delegate?.didFinishWithError("Não consegui pegar os eventos de venda")
            }
        }
    }
    
    // News
    func getNewsEvents() {
        let query = PFQuery(className: cName)
        query.whereKey("type", greaterThan: 1)
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                self.delegate?.didGetEvents!(objs!)
            }
            else {
                self.delegate?.didFinishWithError("Não consegui pegar os eventos de notícias")
            }
        }
    }
    
    func newEvent(type: Int, txt: String, item: PFObject?, coll: PFObject, img: PFFile?) {
        let event = PFObject(className: cName)
        event["type"] = type
        event["name"] = txt
        event["collection"] = coll
        event["collectionName"] = coll["name"] as! String
        event["user"] = pUser.user
        event["userName"] = pUser.user?.username
        if item != nil { event["item"] = item }
        if img != nil { event["itemPhoto"] = img }
        if type == 0 {
            item!["forTrade"] = true
            item?.saveInBackground()
        }
        else if type == 1 {
            item!["forSale"] = true
            item?.saveInBackground()
        }
        else if type == 3 { event["collection"] = coll }
        event.saveInBackground()
    }
    
    func deleteEventsOfItem(item: PFObject) {
        let query = PFQuery(className: cName)
        query.whereKey("item", equalTo: item)
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                for obj in objs! {
                    obj.deleteInBackground()
                }
            }
            else {
                self.delegate?.didFinishWithError("Não consegui deletar os eventos desse item")
            }
        }
    }
    
    func deleteEventsOfCollection(coll: PFObject) {
        let query = PFQuery(className: cName)
        query.whereKey("collection", equalTo: coll)
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                for obj in objs! {
                    obj.deleteInBackground()
                }
            }
            else {
                self.delegate?.didFinishWithError("Não consegui deletar os eventos dessa coleção")
            }
        }
    }
    
    func deleteTradeEventOfItem(item: PFObject, trade: Bool) {
        let query = PFQuery(className: cName)
        query.whereKey("item", equalTo: item)
        query.whereKey("type", equalTo: (trade ? 0 : 1))
        query.findObjectsInBackgroundWithBlock { (objs: [PFObject]?, error) -> Void in
            if error == nil {
                for obj in objs! {
                    obj.deleteInBackground()
                }
                if trade {
                    item["forTrade"] = false
                }
                else {
                    item["forSale"] = false
                }
                item.saveInBackground()
            }
            else {
                self.delegate?.didFinishWithError("Não consegui deletar o evento desse item")
            }
        }
    }
}
