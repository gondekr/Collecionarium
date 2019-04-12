//
//  PreDefCollectionManager.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 9/29/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import CoreData
import UIKit

class PreDefCollectionManager {
    
    static let sharedInstance = PreDefCollectionManager()
    static let entityName = "PreDefCollection"
    
    let names  = ["Miniaturas",
                  "Moedas",
                  "Ingressos",
                  "Games",
                  "Livros",
                  "Selos"]
    let fields = [["Ano", "Modelo"],
                  ["Ano", "País", "Valor"],
                  ["Ano", "Evento"],
                  ["Nome", "Empresa", "Ano", "Genero"],
                  ["Título", "Autor", "Ano", "Editora"],
                  ["Ano", "Pais", "Valor"]]
    let types  = [[3,0],
                  [3,0,0],
                  [3,0],
                  [0,0,3,0],
                  [0,0,3,0],
                  [3,0,2]]
    let title  = [1,0,1,0,0,0]

    lazy var managedObjectContext: NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
        }()
    
    func newPreDefCollection() -> PreDefCollection {
        let coll = (NSEntityDescription.insertNewObjectForEntityForName(PreDefCollectionManager.entityName, inManagedObjectContext: managedObjectContext) as? PreDefCollection)!
        coll.id = fetchPreDefCollections().count
        return coll
    }
    
    func save() {
        do {
            try managedObjectContext.save()
        } catch {
            
        }
    }
    
    func fetchPreDefCollections() -> Array<PreDefCollection> {
        let fetchRequest = NSFetchRequest(entityName: PreDefCollectionManager.entityName)
        
        do {
            let fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest)
            
            if let results = fetchedResults as? [PreDefCollection] {
                return results;
            }
        } catch {
            
        }
        
        return Array<PreDefCollection>()
    }
    
    func deletePreDefCollection(coll: PreDefCollection) {
        managedObjectContext.deleteObject(coll)
        save()
    }
    
    func deleteAllPreDefCollections() {
        let predefs = fetchPreDefCollections()
        for pdc in predefs {
            deletePreDefCollection(pdc)
        }
    }
    
    func addCollections(){
        for i in 0..<names.count {
            let coll = newPreDefCollection()
            coll.name = names[i]
            coll.fields = fields[i]
            coll.titleIndex = title[i]
            for type in types[i] {
                coll.types.append(dataTypes[type])
            }
            save()
        }
    }
}