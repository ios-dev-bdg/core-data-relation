//
//  StoreDataManager.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation
import CoreData

class StoreData {
    
    //Utilize Singleton pattern by instanciating StoreData only once.
    class var shared: StoreData {
        struct Singleton {
            static let instance = StoreData()
        }
        
        return Singleton.instance
    }
    
    private init(){}
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "EquipmentRental")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func saveContext(){
        
        let context = StoreData.shared.persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                fatalError("Save context error \(error.localizedDescription)")
            }
        }
    }
    ///
    /// Save Friends
    ///
    /// - Parameter friend
    ///
    func saveLoaner(_ friend: Loaner){
        let context = StoreData.shared.persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Loaner", into: context) as! Loaner
        entity.id = friend.id
        entity.name = friend.name
        
        do {
            try context.save()
        }
        catch {
            print("Error \(error.localizedDescription)")
        }
    }
    ///
   /// Fetch All Friends
   ///
   /// - Returns
   ///
   func fetchLoaners()-> [Loaner]{
       let context = StoreData.shared.persistentContainer.viewContext
       let request = NSFetchRequest<Loaner>(entityName: "Loaner")
       
       do {
           let result = try context.fetch(request)
           return result
       }
       catch {
           return []
       }
   }
    ///
    /// Fetch  filter friend
    ///
    /// - Returns
    ///
    func fetchLoaner(from name: String)-> Loaner? {
        let context = StoreData.shared.persistentContainer.viewContext
        let request: NSFetchRequest<Loaner> = Loaner.fetchRequest()
        request.predicate = NSPredicate(format: "name contains[c] %@", name)
        
        do {
            let loaners = try context.fetch(request)
            if loaners.count > 0 {
                return loaners.first!
            }
        }
        catch {
            return nil
        }
        
        return nil
    }
    ///
    /// Save Tools
    ///
    /// - Parameter tools
    ///
    func saveTool(_ tool: Tool){
        let context = StoreData.shared.persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Tool", into: context) as! Tool
        entity.id = tool.id
        entity.name = tool.name
        entity.itemCount = tool.itemCount
        entity.imageName = tool.imageName
        
        do {
            try context.save()
        }
        catch {
            print("Error \(error.localizedDescription)")
        }
    }
    ///
    /// Fetch All Tools
    ///
    /// - Returns
    ///
    func fetchTools()-> [Tool]{
        let context = StoreData.shared.persistentContainer.viewContext
        let request = NSFetchRequest<Tool>(entityName: "Tool")
        
        
        do {
            let result = try context.fetch(request)
            var tools: [Tool] = []
            result.forEach { tool in
                var totalBorrowed: Int64 = 0
                tool.available = tool.itemCount
                tool.ofLoan?.forEach { loan in
                    if let value = loan as? Loan {
                        totalBorrowed += value.totalItem
                        tool.borrowed = totalBorrowed
                        tool.available = tool.itemCount - totalBorrowed
                    }
                }
                tools.append(tool)
            }
            
            return tools
        }
        catch {
            return []
        }
    }
    ///
    /// Save loan
    ///
    /// - Parameter tools
    ///
    func saveLoan(loan: Loan, tool: Tool, loaner: Loaner?, completionHandler: @escaping(_ message: String)->Void){
        let context = StoreData.shared.persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

        // Get stock of items will be borrowed
        let predicateTool = NSPredicate(format: "tool == %@ ", tool)
        let stockOfItems = tool.itemCount - fetchLoans(filter: predicateTool).reduce(0){ $0 + $1.totalItem }
        
        if  loan.totalItem > stockOfItems { // If item will be borrowed greater than stock of items
            completionHandler("Input exceeds the available stock")
        }
        else {
            let entity = NSEntityDescription.insertNewObject(forEntityName: "Loan", into: context) as! Loan
            entity.date = Date()
            entity.id = Int64(arc4random())
            entity.totalItem = loan.totalItem
            entity.loaner = loaner
            entity.tool = tool
            
            do {
                completionHandler("\(loaner!.name!) successfully borrowed \(loan.totalItem) \(tool.name!)")
                try context.save()
            }
            catch {
                completionHandler(error.localizedDescription)
            }
        }
    }
    ///
    /// Fetch All Tools
    ///
    /// - Returns
    ///
    func fetchLoans(filter predicate: NSPredicate)-> [Loan] {
        let context = StoreData.shared.persistentContainer.viewContext
        let request = NSFetchRequest<Loan>(entityName: "Loan")
        request.predicate = predicate
        
        do {
            let result = try context.fetch(request)
            return result
        }
        catch {
            return []
        }
    }
    ///
    /// Delete Loan
    ///
    /// - Parameter predicate
    ///
    ///
    func deleteLoan(from id: Int64) {
        let context = StoreData.shared.persistentContainer.viewContext
        let request =  NSFetchRequest<Loan>(entityName: "Loan")
        
        do {
            let objects = try context.fetch(request)
            for object in objects where object.id == id {
                context.delete(object)
            }

            try context.save()
        }
        catch {
            print("Error \(error.localizedDescription)")
        }
    }
}
