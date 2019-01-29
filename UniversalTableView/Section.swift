//
//  TableSection.swift
//  UniversalTableView
//
//  Created by Michail Solyanic on 24/01/2019.
//  Copyright © 2019 Michail Solyanic. All rights reserved.
//

import UIKit

struct SectionHeader {
    var title: String = ""
    var height: CGFloat = 0
    var view: UIView? = nil
}

struct SectionFooter {
    var height: CGFloat = CGFloat.leastNormalMagnitude
    var view: UIView? = UIView()
}

class Section {
    var cells: [Cell] = []
    var headerProperties: SectionHeader = SectionHeader()
    var footerProperties: SectionFooter = SectionFooter()
}
