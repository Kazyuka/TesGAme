//
//  ModelForTableViewCell.swift
//  TestGame
//
//  Created by Руслан Казюка on 20.03.2018.
//  Copyright © 2018 Казюка Руслан Сергеевич. All rights reserved.
//

import UIKit

class ModelForTableCell {
    
    var dataArray: [DataModel]?
    private var lenghtNumbers = 50
    var wir: Int! = 3 {
        didSet {
            _ = getDataFromModel()
        }
    }
    var wor: Int! = 5 {
        didSet {
            _ = getDataFromModel()
        }
    }
    func getDataFromModel() -> [DataModel] {
        dataArray = [DataModel]()
        for n in 1..<lenghtNumbers {
            
            if n % wor == 0 && n % wir == 0 {
                dataArray?.append(DataModel(text: "BIP BOP", count: n))
            } else if  n % wor == 0 {
                dataArray?.append(DataModel(text: "BOP", count: n))
            } else if n % wir == 0 {
                dataArray?.append(DataModel(text: "BIP", count: n))
            } else {
                dataArray?.append(DataModel(text: "", count: n))
            }
        }
        return dataArray!
    }
}
struct DataModel {
    var text: String = "war"
    var count: Int = 0
}
