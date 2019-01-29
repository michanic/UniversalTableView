//
//  TableView.swift
//  UniversalTableView
//
//  Created by Michail Solyanic on 24/01/2019.
//  Copyright © 2019 Michail Solyanic. All rights reserved.
//

import UIKit

protocol TableViewUniversalDelegate: class {
    var dataSource: [Section] { get }
}

class TableView: UITableView {

    let universalDelegate: TableViewUniversalDelegate

    init(universalDelegate: TableViewUniversalDelegate, cellTypes: [CellType], frame: CGRect, style: UITableView.Style) {
        self.universalDelegate = universalDelegate
        super.init(frame: frame, style: style)
        dataSource = self
        delegate = self
        registerCellTypes(cellTypes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerCellTypes(_ types: [CellType]) {
        for cellType in types {
            let nib = UINib(nibName: String(describing: cellType.cellClass), bundle: nil)
            register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
        }
    }
}

extension TableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return universalDelegate.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universalDelegate.dataSource[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return universalDelegate.dataSource[section].headerProperties.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = universalDelegate.dataSource[indexPath.section].cells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.type.reuseIdentifier, for: indexPath)
        return cell
    }
    
}

extension TableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return universalDelegate.dataSource[indexPath.section].cells[indexPath.row].type.height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return universalDelegate.dataSource[section].headerProperties.height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return universalDelegate.dataSource[section].footerProperties.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return universalDelegate.dataSource[section].headerProperties.view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return universalDelegate.dataSource[section].footerProperties.view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
