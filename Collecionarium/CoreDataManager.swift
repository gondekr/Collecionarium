//
//  Copyright (c) 2015 Rafael Fernandes de Oliveira Carvalho. All rights reserved.
//

import CoreData
import UIKit

class CoreDataManager {
    static let sharedInstance = CoreDataManager()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.managedObjectContext
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentStoreCoordinator
        }()
    
    lazy var applicationDocumentsDirectory: URL = {
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.applicationDocumentsDirectory
        }()
}
