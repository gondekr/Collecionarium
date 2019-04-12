//
//  PDCollectionPManager.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/5/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import Foundation
import Parse

@objc protocol PDCParseDelegate {
    func didGetPDCollections(objs: [PFObject])
    func didFinishWithError(msg: String)
}

class PDCollectionParse {
    static let sharedInstance = PDCollectionParse()
    
    var delegate: PDCParseDelegate?
    
    func getAll() {
        let query = PFQuery(className: "PreDefCollection")
        query.orderByAscending("name")
        query.findObjectsInBackgroundWithBlock({ (objs: [PFObject]?, error) -> Void in
            if error == nil {
                self.delegate?.didGetPDCollections(objs!)
            }
            else {
                self.delegate?.didFinishWithError("Não pegou as coleções pre-definidas")
                print("Não pegou as coleções pre-definidas")
            }
        })
    }
}
