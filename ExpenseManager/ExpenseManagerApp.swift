//
//  ExpenseManagerApp.swift
//  ExpenseManager
//
//  Created by Teacher on 18/03/2025.
//

import SwiftUI

@main
struct ExpenseManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
