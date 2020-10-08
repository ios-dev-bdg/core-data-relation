//
//  Tool+CoreDataClass.swift
//  EquipmentRental
//
//  Created by topik mujianto on 07/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Tool)
public class Tool: NSManagedObject {
    
    public var borrowed: Int64?
    public var available: Int64?
    
    convenience init() {
        let context = StoreData.shared.persistentContainer.viewContext
        self.init(context: context)
    }
    
    convenience init(id: Int64, name: String, itemCount: Int64, imageName: String) {
        self.init()
        self.id = id
        self.name = name
        self.itemCount = itemCount
        self.imageName = imageName
    }
    
    convenience init(borrowed: Int64, availabe: Int64) {
        self.init()
        self.borrowed = borrowed
        self.available = availabe
    }
    
}
