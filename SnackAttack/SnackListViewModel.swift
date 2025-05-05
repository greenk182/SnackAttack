//
//  SnackListViewModel.swift
//  SnackAttack
//
//  Created by Kevin Green on 5/4/25.
//

import SwiftUI

final class SnackListViewModel: ObservableObject {
    
    @Published var snacks: [Snack] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func getSnacks() {
        isLoading = true
        NetworkManager.shared.getSnacks { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let snacks):
                    self.snacks = snacks
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
