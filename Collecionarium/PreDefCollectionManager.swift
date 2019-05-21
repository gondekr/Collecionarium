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

    static func getAll() -> [DataType] {
        return [.string, .text, .number, .year, .date, .boolean]
    }
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
}
