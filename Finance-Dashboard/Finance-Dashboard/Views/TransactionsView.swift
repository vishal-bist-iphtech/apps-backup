//
//  TransactionView.swift
//  Finance-Dashboard
//
//  Created by iPHTech 7 on 08/07/26.
//

import SwiftUI

struct TransactionsView: View {
    
    @ObservedObject var transactionViewModel: TransactionViewModel
    @State private var searchInput = ""
    
    var filteredTransactions: [Finance_Dashboard.Transaction] {
        if searchInput.isEmpty {
            return Array(transactionViewModel.transactions.reversed())
        }

        return transactionViewModel.transactions
            .filter {
                $0.title.localizedCaseInsensitiveContains(searchInput)
            }
            .reversed()
    }
    
    var body: some View {
        NavigationView{
                VStack(spacing: 10) {
                    TextField("Search by category", text: $searchInput)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView {
                        
                        if filteredTransactions.isEmpty {
                                VStack(spacing: 12) {
                                    Image(systemName: "magnifyingglass")
                                        .font(.largeTitle)
                                        .foregroundColor(.gray)

                                    Text("No transactions found")
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 40)
                            } else {
                                ForEach(filteredTransactions) { transaction in
                                    TransactionRow(transaction: transaction)
                                    Divider()
                                }
                            }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                }
                .navigationBarTitle("Transactions", displayMode: .inline)
            }
    }
}



struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(
            transactionViewModel: TransactionViewModel()
        )
    }
}
