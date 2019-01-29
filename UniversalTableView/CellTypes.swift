//
//  CellTypes.swift
//  UniversalTableView
//
//  Created by Michail Solyanic on 24/01/2019.
//  Copyright © 2019 Michail Solyanic. All rights reserved.
//

import UIKit

enum CellType {
    
    case car
    case video
    
    var cellClass: Any {
        switch self {
        case .car:
            return CarTableViewCell.self
        case .video:
            return VideoTableViewCell.self
        }
    }
    
    var reuseIdentifier: String {
        switch self {
        case .car:
            return "car_cell"
        case .video:
            return "video_cell"
        }
    }
    
    var height: CGFloat {
        switch self {
        case .car:
            return 44
        case .video:
            return 60
        }
    }
}
