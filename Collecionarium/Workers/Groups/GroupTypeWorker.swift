//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import Foundation

class GroupTypeWorker {
    func getTypes() -> [GroupData] {
        return [
            GroupData(id: "Miniaturas", name: "Miniaturas", color: "", fields: [
                FieldData(id: "0", name: "Ano", type: .year, isTitle: false),
                FieldData(id: "1", name: "Modelo", type: .string, isTitle: true)
                ]),
            GroupData(id: "Moedas", name: "Moedas", color: "", fields: [
                FieldData(id: "0", name: "Ano", type: .year, isTitle: true),
                FieldData(id: "1", name: "Pais", type: .string, isTitle: false),
                FieldData(id: "2", name: "Valor", type: .string, isTitle: false)
                ]),
            GroupData(id: "Ingressos", name: "Ingressos", color: "", fields: [
                FieldData(id: "0", name: "Ano", type: .year, isTitle: false),
                FieldData(id: "1", name: "Evento", type: .string, isTitle: true)
                ]),
            GroupData(id: "Games", name: "Games", color: "", fields: [
                FieldData(id: "0", name: "Nome", type: .string, isTitle: true),
                FieldData(id: "1", name: "Empresa", type: .string, isTitle: false),
                FieldData(id: "2", name: "Ano", type: .string, isTitle: false),
                FieldData(id: "3", name: "Genero", type: .string, isTitle: false),
                ]),
            GroupData(id: "Livros", name: "Livros", color: "", fields: [
                FieldData(id: "0", name: "Título", type: .string, isTitle: true),
                FieldData(id: "1", name: "Autor", type: .string, isTitle: false),
                FieldData(id: "2", name: "Ano", type: .year, isTitle: false),
                FieldData(id: "3", name: "Editora", type: .string, isTitle: false),
                ]),
            GroupData(id: "Selos", name: "Selos", color: "", fields: [
                FieldData(id: "0", name: "Ano", type: .year, isTitle: true),
                FieldData(id: "1", name: "Pais", type: .string, isTitle: false),
                FieldData(id: "2", name: "Valor", type: .string, isTitle: false)
                ]),
            GroupData(id: "Custom", name: "Personalizada", color: "", fields: [])
        ]
    }
}
