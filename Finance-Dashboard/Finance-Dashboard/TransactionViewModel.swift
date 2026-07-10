//
//  FinanceViewModel.swift
//  Finance-Dashboard
//
//  Created by iPHTech 7 on 07/07/26.
//

import Foundation
import SwiftUI

class TransactionViewModel: ObservableObject {
    
    // Published Properties
    @Published var savings: Double = 20000
    @Published var transactions: [Transaction] = [
        
        Transaction(
            title: "Monthly Salary",
            amount: 50000,
            category: .salary,
            isIncome: true,
            date: Date()
        ),
        
        Transaction(
            title: "Groceries",
            amount: 2500,
            category: .food,
            isIncome: false,
            date: Date()
        ),
        
        Transaction(
            title: "Movie Night",
            amount: 800,
            category: .entertainment,
            isIncome: false,
            date: Date()
        ),
        Transaction(
            title: "EMI",
            amount: 2200,
            category: .bills,
            isIncome: false,
            date: Date()
        ),
        
        Transaction(
            title: "Electricity Bill",
            amount: 1500,
            category: .bills,
            isIncome: false,
            date: Date()
        ),
        Transaction(
            title: "Groceries",
            amount: 500,
            category: .shopping,
            isIncome: false,
            date: Date()
        ),
        Transaction(
            title: "Pizza",
            amount: 400,
            category: .food,
            isIncome: false,
            date: Date()
        ),
        Transaction(
            title: "SIP",
            amount: 1000,
            category: .investment,
            isIncome: false,
            date: Date()
        ),
        Transaction(
            title: "Borrowed",
            amount: 1500,
            category: .investment,
            isIncome: true,
            date: Date()
        ),
        Transaction(
            title: "Phone Recharge",
            amount: 500,
            category: .bills,
            isIncome: false,
            date: Date()
        ),
        Transaction(
            title: "Taxi fare",
            amount: 800,
            category: .travel,
            isIncome: false,
            date: Date()
        ),
        Transaction(
            title: "Ice-cream",
            amount: 200,
            category: .food,
            isIncome: false,
            date: Date()
        ),
    ]
    
    
    // Computed Properties
    
    var totalIncome: Double {
        transactions
            .filter { $0.isIncome }
            .reduce(0) { $0 + $1.amount }
    }
    
    var totalExpense: Double {
        transactions
            .filter { !$0.isIncome }
            .reduce(0) { $0 + $1.amount }
    }
    
    var totalBalance: Double {
        totalIncome - totalExpense
    }
    
    var savingsProgress: Double {
        guard savings > 0 else { return 0 }
        return min(currentMonthSavings / savings, 1.0)
    }
    
    var currentMonthTransactions: [Transaction] {
        
        let calendar = Calendar.current
        
        return transactions.filter {
            calendar.isDate($0.date,
                            equalTo: Date(),
                            toGranularity: .month)
        }
    }
    
    var currentMonthIncome: Double {
        currentMonthTransactions
            .filter { $0.isIncome }
            .reduce(0) { $0 + $1.amount }
    }
    
    var currentMonthExpense: Double {
        currentMonthTransactions
            .filter { !$0.isIncome }
            .reduce(0) { $0 + $1.amount }
    }
    
    var currentMonthSavings: Double {
        currentMonthIncome - currentMonthExpense
    }
    
    var expenseCategories: [ExpenseCategory] {
        
        var totals: [Category: Double] = [:]
        
        for transaction in transactions where !transaction.isIncome {
            totals[transaction.category, default: 0] += transaction.amount
        }
        
        return totals.map { category, amount in
            
            ExpenseCategory(
                name: category.rawValue,
                value: amount,
                color: color(for: category)
            )
        }
    }
    
    private func color(for category: Category) -> Color {
        
        switch category {
            
        case .salary:
            return .green
            
        case .food:
            return .red
            
        case .shopping:
            return .blue
            
        case .travel:
            return .orange
            
        case .bills:
            return .purple
            
        case .entertainment:
            return .pink
            
        case .investment:
            return .yellow
            
        case .other:
            return .gray
        }
    }
    
    // Functions
    
    func addTransaction(
        title: String,
        amount: Double,
        category: Category,
        isIncome: Bool
    ) {
        
        let newTransaction = Transaction(
            title: title,
            amount: amount,
            category: category,
            isIncome: isIncome,
            date: Date()
        )
        
        transactions.append(newTransaction)
    }
}
