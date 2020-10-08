//
//  Loaner+CoreDataClass.swift
//  EquipmentRental
//
//  Created by topik mujianto on 07/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Loaner)
public class Loaner: NSManagedObject {
    convenience init() {
        let context = StoreData.shared.persistentContainer.viewContext
        self.init(context: context)
    }
    
    convenience init(id: Int64, name: String) {
        self.init()
        self.id = id
        self.name = name
    }

}
