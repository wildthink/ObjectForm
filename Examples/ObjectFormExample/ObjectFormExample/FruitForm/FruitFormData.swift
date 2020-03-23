//
//  AccountForm+UITableVIew.swift
//  Mocha
//
//  Created by Jake on 6/16/19.
//  Copyright © 2019 Mocha. All rights reserved.
//

import ObjectForm
import UIKit

class FruitFormData: NSObject, FormDataSource {
    var bindModel: BindModel
    
    typealias BindModel = Fruit

    var basicRows: [BaseRow] = []

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(at section: Int) -> Int {
        switch section {
        case 0: return basicRows.count
        default: fatalError()
        }
    }

    func row(at indexPath: IndexPath) -> BaseRow {
        switch indexPath.section {
        case 0: return basicRows[indexPath.row]
        default: fatalError()
        }
    }

    init(_ fruit: Fruit) {
        self.bindModel = fruit

        basicRows.append(StringRow(title: "Name",
                                   icon: "",
                                   kvcKey: "name",
                                   value: fruit.name ?? "",
                                   placeholder: nil,
                                   validator: {
                                    return !(fruit.name?.isEmpty ?? true)

        }))

        basicRows.append(DoubleRow(title: "Price",
                                   icon: "",
                                   kvcKey: "price",
                                   value: fruit.price,
                                   placeholder: ""))

        basicRows.append(DoubleRow(title: "Weight",
                                   icon: "",
                                   kvcKey: "weight",
                                   value: fruit.weight,
                                   placeholder: ""))

        basicRows.append(TextViewRow(title: "Note",
                                     kvcKey: "note",
                                     value: fruit.note ?? "-"))

        basicRows.append(DateRow(title: "Purchase Date",
                                 icon: "",
                                 kvcKey: "date",
                                 value: fruit.date ?? Date(),
                                 placeholder: ""))

        basicRows.append(SelectRow(title: "Retailer",
                                   icon: "",
                                   kvcKey: "retailer",
                                   value: fruit.retailer,
                                   listOfValues: ["Walmart", "McDonald", "Carrefour"]))
    }

    override init() { fatalError("not implemented") }
}
