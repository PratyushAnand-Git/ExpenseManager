//
//  Expense.swift
//  ExpenseManager
//
//  Created by Teacher on 18/03/2025.
//
import CoreData

@objc(Expense)
class Expense: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var name: String
    @NSManaged var amount: Double
    @NSManaged var date: Date

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }
}
