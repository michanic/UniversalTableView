//
//  Cell.swift
//  UniversalTableView
//
//  Created by Michail Solyanic on 24/01/2019.
//  Copyright © 2019 Michail Solyanic. All rights reserved.
//

import UIKit

class Cell {
    var type: CellType
    var content: Any?
    
    init(cellType: CellType) {
        self.type = cellType
    }
}


