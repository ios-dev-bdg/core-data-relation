//
//  Loaner+CoreDataProperties.swift
//  EquipmentRental
//
//  Created by topik mujianto on 07/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//
//

import Foundation
import CoreData


extension Loaner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Loaner> {
        return NSFetchRequest<Loaner>(entityName: "Loaner")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var ofLoan: NSSet?

}

// MARK: Generated accessors for ofLoan
extension Loaner {

    @objc(addOfLoanObject:)
    @NSManaged public func addToOfLoan(_ value: Loan)

    @objc(removeOfLoanObject:)
    @NSManaged public func removeFromOfLoan(_ value: Loan)

    @objc(addOfLoan:)
    @NSManaged public func addToOfLoan(_ values: NSSet)

    @objc(removeOfLoan:)
    @NSManaged public func removeFromOfLoan(_ values: NSSet)

}
