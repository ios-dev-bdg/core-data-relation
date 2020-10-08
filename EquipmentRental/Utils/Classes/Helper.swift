//
//  Helper.swift
//  EquipmentRental
//
//  Created by topik mujianto on 08/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    ///
    /// Paragraph
    ///
    /// - Parameter attributedString
    /// - Returns: NSAttributedString
    ///
    static func paragraph(_ attributedString: NSMutableAttributedString)-> NSAttributedString {
        
        // Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        // Set LineSpacing property in points
        paragraphStyle.lineSpacing = 3 // Whatever line spacing you want in points
        
        // Apply attribute to string
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    ///
    /// DateFormatter
    ///
    /// - Parameter date
    /// - Parameter format
    ///
    static func date(from date: Date?, format: String = "yyyy-MM-dd HH:mm")-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        if let date = date {
            return formatter.string(from: date)
        }
        
        return ""
    }
    
}
