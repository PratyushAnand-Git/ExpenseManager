//
//  GraphView.swift
//  ExpenseManager
//
//  Created by Teacher on 18/03/2025.
//
import SwiftUI
import SwiftUICharts
import CoreData

struct GraphView: View {
    @State private var expenses: [Expense] = []

    var body: some View {
        ZStack {
            // Background Image
            Image("pexels-gdtography-277628-950241")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Expense History")
                    .font(.title)
                    .padding()

                if expenses.isEmpty {
                    Text("No expense history available.")
                        .foregroundColor(.gray)
                } else {
                    BarChartView(
                        data: ChartData(values: expenseData()),
                        title: "Expenses",
                        style: ChartStyle(
                            backgroundColor: .white,
                            accentColor: .orange, // Bars are orange
                            secondGradientColor: .orange, // Uniform orange gradient
                            textColor: .black,
                            legendTextColor: .gray,
                            dropShadowColor: .gray
                        ),
                        form: ChartForm.large
                    )

                    .padding()
                }
            }
        }
        .onAppear {
            fetchExpenses()
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

    func expenseData() -> [(String, Double)] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d" // Display date as "Jan 1"
        return expenses.map { (formatter.string(from: $0.date), $0.amount) }
    }
}
