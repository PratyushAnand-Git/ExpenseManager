//
//  AddExpensePage.swift
//  ExpenseManager
//
//  Created by Teacher on 18/03/2025.
//
import SwiftUI

struct AddExpensePage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var amount: String = ""

    var onSave: () -> Void

    var body: some View {
        ZStack {
            // Background Image
            Image("pexels-gdtography-277628-950241")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Orange-Styled TextFields
                TextField("Expense Name", text: $name)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.orange, lineWidth: 2)
                            .background(Color.white.opacity(0.8)) // Optional background for readability
                    )
                    .padding()

                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.orange, lineWidth: 2)
                            .background(Color.white.opacity(0.8))
                    )
                    .padding()

                // Orange Button
                Button(action: saveExpense) {
                    Text("Save Expense")
                        .padding()
                        .frame(width: 200, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 2)
                        )
                        .foregroundColor(.orange)
                }
            }
            .padding()
        }
    }

    func saveExpense() {
        guard let amountValue = Double(amount), !name.isEmpty else { return }

        let newExpense = Expense(context: CoreDataManager.shared.context)
        newExpense.id = UUID()
        newExpense.name = name
        newExpense.amount = amountValue
        newExpense.date = Date()

        CoreDataManager.shared.saveContext()
        onSave()
        presentationMode.wrappedValue.dismiss()
    }
}
