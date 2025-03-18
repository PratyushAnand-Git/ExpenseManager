//
//  HomePage.swift
//  ExpenseManager
//
//  Created by Teacher on 18/03/2025.
//
import SwiftUI
import CoreData

struct HomePage: View {
    @State private var expenses: [Expense] = []
    @State private var showAddExpensePage = false

    var body: some View {
        ZStack {
            // Background Image
            Image("pexels-gdtography-277628-950241")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                List(expenses, id: \.id) { expense in
                    HStack {
                        Text(expense.name)
                        Spacer()
                        Text("₹\(expense.amount, specifier: "%.2f")")
                    }
                }
                .onAppear {
                    fetchExpenses()
                }
                .background(Color.white.opacity(0.8)) // Enhances text readability

                // Orange Button for "Add Expense"
                Button(action: {
                    showAddExpensePage = true
                }) {
                    Text("Add Expense")
                        .padding()
                        .frame(width: 200, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 2)
                        )
                        .foregroundColor(.orange) // Button text is orange
                }
                .sheet(isPresented: $showAddExpensePage) {
                    AddExpensePage { fetchExpenses() }
                }
            }
            .padding()
        }
    }

    func fetchExpenses() {
        let request: NSFetchRequest<Expense> = Expense.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        do {
            expenses = try CoreDataManager.shared.context.fetch(request)
        } catch {
            print("Failed to fetch expenses: \(error)")
        }
    }
}
