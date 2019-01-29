//
//  ViewController.swift
//  UniversalTableView
//
//  Created by Michail Solyanic on 24/01/2019.
//  Copyright © 2019 Michail Solyanic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TableViewUniversalDelegate {
    
    var dataSource: [Section] = []
    
    lazy var tableView: TableView = {
        return TableView(universalDelegate: self, cellTypes: [.car, .video], frame: self.view.bounds, style: .plain)
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        view.addSubview(tableView)
    }

    func createData() {
        let sectionCars = Section()
        sectionCars.headerProperties.title = "section cars"
        sectionCars.headerProperties.height = 30
        sectionCars.cells.append(Cell(cellType: .car))
        dataSource.append(sectionCars)
        
        let sectionVideos = Section()
        sectionVideos.headerProperties.title = "section videos"
        sectionVideos.headerProperties.height = 40
        for _ in 1...5 {
            sectionVideos.cells.append(Cell(cellType: .video))
        }
        dataSource.append(sectionVideos)
        
        
    }
}

