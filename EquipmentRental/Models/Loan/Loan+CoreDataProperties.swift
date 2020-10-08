//
//  Loan+CoreDataProperties.swift
//  EquipmentRental
//
//  Created by topik mujianto on 07/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//
//

import Foundation
import CoreData


extension Loan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Loan> {
        return NSFetchRequest<Loan>(entityName: "Loan")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: Int64
    @NSManaged public var totalItem: Int64
    @NSManaged public var loaner: Loaner?
    @NSManaged public var tool: Tool?

}
