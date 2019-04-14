//
//  Collection.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/20/15.
//  Copyright © 2019 GondekR. All rights reserved.
//

import Foundation
import CoreData

class Collection: NSManagedObject {
    
    @NSManaged var id: NSNumber?
    @NSManaged var titleIndex: NSNumber?
    @NSManaged var name: String?
    @NSManaged var fields: [String]
    @NSManaged var types: [String]
    @NSManaged var items: [Item]
}
