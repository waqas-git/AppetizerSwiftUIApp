//
//  AppetizerListViewModel.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 17/08/2024.
//

import Foundation
final class AppetizerListViewModel : ObservableObject{
    
    @Published var appetizers : [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading : Bool = false
    @Published var isShowingDetails = false
    @Published var selectedAppetizer : Appetizer?
    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse                        
                    }
                }
            }
        }
    }
    
}
