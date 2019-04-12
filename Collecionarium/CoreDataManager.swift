//
//  CoreDataManager.swift
//  MackHub
//
//  Created by Samuel Shin Kim on 02/05/15.
//  Copyright (c) 2015 Rafael Fernandes de Oliveira Carvalho. All rights reserved.
//

import CoreData
import UIKit

class CoreDataManager {
    
    static let sharedInstance = CoreDataManager()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.persistentStoreCoordinator
        }()
    
    lazy var applicationDocumentsDirectory: NSURL = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.applicationDocumentsDirectory
        }()
}