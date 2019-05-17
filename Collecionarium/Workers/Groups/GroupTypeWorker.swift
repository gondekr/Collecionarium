//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import Foundation

class GroupTypeWorker {
    func getTypes() -> [GroupData] {
        return [
            GroupData(id: "Miniaturas", name: "Miniaturas", color: "", fields: [
                FieldData(id: "", name: "Ano", type: .year, isTitle: false),
                FieldData(id: "", name: "Modelo", type: .string, isTitle: true)
                ], predefined: true),
            GroupData(id: "Moedas", name: "Moedas", color: "", fields: [
                FieldData(id: "", name: "Ano", type: .year, isTitle: true),
                FieldData(id: "", name: "Pais", type: .string, isTitle: false),
                FieldData(id: "", name: "Valor", type: .string, isTitle: false)
                ], predefined: true),
            GroupData(id: "Ingressos", name: "Ingressos", color: "", fields: [
                FieldData(id: "", name: "Ano", type: .year, isTitle: false),
                FieldData(id: "", name: "Evento", type: .string, isTitle: true)
                ], predefined: true),
            GroupData(id: "Games", name: "Games", color: "", fields: [
                FieldData(id: "", name: "Nome", type: .string, isTitle: true),
                FieldData(id: "", name: "Empresa", type: .string, isTitle: false),
                FieldData(id: "", name: "Ano", type: .string, isTitle: false),
                FieldData(id: "", name: "Genero", type: .string, isTitle: false),
                ], predefined: true),
            GroupData(id: "Livros", name: "Livros", color: "", fields: [
                FieldData(id: "", name: "Título", type: .string, isTitle: true),
                FieldData(id: "", name: "Autor", type: .string, isTitle: false),
                FieldData(id: "", name: "Ano", type: .year, isTitle: false),
                FieldData(id: "", name: "Editora", type: .string, isTitle: false),
                ], predefined: true),
            GroupData(id: "Selos", name: "Selos", color: "", fields: [
                FieldData(id: "", name: "Ano", type: .year, isTitle: true),
                FieldData(id: "", name: "Pais", type: .string, isTitle: false),
                FieldData(id: "", name: "Valor", type: .string, isTitle: false)
                ], predefined: true),
            GroupData(id: "Custom", name: "Personalizada", color: "", fields: [], predefined: true)
        ]
    }
}
