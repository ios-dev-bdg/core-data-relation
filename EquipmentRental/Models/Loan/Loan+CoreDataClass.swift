//
//  Loan+CoreDataClass.swift
//  EquipmentRental
//
//  Created by topik mujianto on 07/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Loan)
public class Loan: NSManagedObject {
    convenience init() {
        let context = StoreData.shared.persistentContainer.viewContext
        self.init(context: context)
    }
    
    convenience init(totalItem: Int64) {
        self.init()
        self.totalItem = totalItem
    }
}
