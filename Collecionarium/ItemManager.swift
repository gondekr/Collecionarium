//
//  Copyright © 2019 GondekR. All rights reserved.
//

import CoreData
import UIKit

class ItemManager {
    
    static let sharedInstance = ItemManager()
    static let entityName = "Item"
    
    // Default Methods

    // Update Photos
    func deletePhoto(item: Item, photoIndex: Int) -> Item {
//        item.photos.remove(at: photoIndex)
//        item.subtitle.remove(at: photoIndex)
//        save()

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
//        item.photos.insert(item.photos[photoIndex], at: 0)
//        item.photos.remove(at: photoIndex+1)
//        item.subtitle.insert(item.subtitle[photoIndex], at: 0)
//        item.subtitle.remove(at: photoIndex+1)
//        save()

        return item
    }
    
    func changeSub(item: Item, photoIndex: Int, sub: String) -> Item {
//        item.subtitle[photoIndex] = sub
//        save()

        return item
    }
}
