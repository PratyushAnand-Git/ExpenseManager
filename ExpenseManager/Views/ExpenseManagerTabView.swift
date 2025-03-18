//
//  ExpenseManagerTabView.swift
//  ExpenseManager
//
//  Created by Teacher on 18/03/2025.
//
import SwiftUI

struct ExpenseManagerTabView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            GraphView()
                .tabItem {
                    Label("Graph", systemImage: "chart.bar")
                }
        }
        .accentColor(.orange) // Optional: Sets the tab icon and text color
    }
}

struct ExpenseManagerTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseManagerTabView()
    }
}

