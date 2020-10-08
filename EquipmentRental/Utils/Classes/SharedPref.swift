//
//  SharedPref.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

class SharedPref {
    enum Key: String {
        case initialData
    }
    
    private static var pref = UserDefaults.standard
    
    private static func commit(){
        pref.synchronize()
    }
    ///
    /// Saving boolean data type
    ///
    /// - Parameter key; from enum Key
    /// - Parameter value
    ///
    static func saveBool(key: Key, value: Bool){
        pref.set(value, forKey: key.rawValue)
        commit()
    }
    ///
    /// Get boolean value
    ///
    /// - Parameter key; from enum Key
    ///
    static func getBool(from key: Key)-> Bool {
        return pref.bool(forKey: key.rawValue)
    }
}
