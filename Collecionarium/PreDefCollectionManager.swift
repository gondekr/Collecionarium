//
//  Copyright © 2019 GondekR. All rights reserved.
//

import CoreData
import UIKit

enum DataType: String {
    case string = "string"
    case text = "text"
    case number = "number"
    case year = "year"
    case date = "date"
    case boolean = "boolean"
}

class PreDefCollectionManager {

    static let sharedInstance = PreDefCollectionManager()
    static let entityName = "PreDefCollection"

    let ids  = ["pre-01", "pre-02", "pre-03", "pre-04", "pre-05", "pre-06"]
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
    let types: [[DataType]] = [[.year, .string],
                  [.year, .string, .string],
                  [.year, .string],
                  [.string, .string, .year, .string],
                  [.string, .string, .year, .string],
                  [.year, .string, .number]]
    let title  = [1,0,1,0,0,0]

    lazy var managedObjectContext: NSManagedObjectContext = {
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.managedObjectContext
        }()
    
    func newPreDefCollection() -> Group {
        let coll = (NSEntityDescription.insertNewObject(forEntityName: PreDefCollectionManager.entityName, into: managedObjectContext) as? Group)!
        return coll
    }
    
    func save() {
        do {
            try managedObjectContext.save()
        } catch {
            
        }
    }
    
    func fetchPreDefCollections() -> Array<Group> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PreDefCollectionManager.entityName)
        
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
            
            if let results = fetchedResults as? [Group] {
                return results;
            }
        } catch {
            
        }
        
        return Array<Group>()
    }
    
    func deletePreDefCollection(coll: Group) {
        managedObjectContext.delete(coll)
        save()
    }
    
    func deleteAllPreDefCollections() {
        let predefs = fetchPreDefCollections()
        for pdc in predefs {
            deletePreDefCollection(coll: pdc)
        }
    }
    
    func addCollections(){
        for i in 0..<names.count {
            let coll = newPreDefCollection()
            coll.name = names[i]
            coll.id = ids[i]
            for f in 0..<fields[i].count {
                let field = newField()
                field.id = "\(String(describing: coll.id))-\(f)"
                field.isTitle = (title[i] == f) as NSNumber
                field.name = fields[i][f]
                field.type = types[i][f].rawValue
                coll.addToFields(field)
            }
            save()
        }
    }

    func newField() -> Field {
        let field = (NSEntityDescription.insertNewObject(forEntityName: "Field", into: managedObjectContext) as? Field)!
        return field
    }
}
