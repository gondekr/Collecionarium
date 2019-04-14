//
//  Item.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/20/15.
//  Copyright © 2019 GondekR. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {
    
    @NSManaged var id: NSNumber?
    @NSManaged var values: [String]
    @NSManaged var photos: [NSData]
    @NSManaged var subtitle: [String]
    @NSManaged var collection: Collection?
}
