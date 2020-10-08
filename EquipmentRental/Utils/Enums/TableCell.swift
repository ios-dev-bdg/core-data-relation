//
//  Enum.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

enum TableCell {
    case tools
    
    var identifier: String {
        switch self {
        case .tools:
            return "CELL_TOOLS"
        }
    }
    
    var nibName: String {
        switch self {
        case .tools:
            return "ToolsTableCell"
        }
    }
}
