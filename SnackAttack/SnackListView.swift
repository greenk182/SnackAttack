//
//  SnackListView.swift
//  SnackAttack
//
//  Created by Kevin Green on 5/4/25.
//

import SwiftUI

struct SnackListView: View {
    
    @StateObject var viewModel = SnackListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.snacks) { snack in
                    SnackListCell(snack: snack)
                }
                .navigationTitle("Snacks")
            }
            .onAppear {
                viewModel.getSnacks()
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        
    }
}

#Preview {
    SnackListView()
}
