//
//  AccountVM.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 21/08/2024.
//

import SwiftUI
final class AccountVM: ObservableObject{
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem : AlertItem?
    
    func saveChanges() {
        guard isValidForm else{ return }
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.profileSave
        }catch{
            alertItem = AlertContext.profileError
        }
    }
    
    func retrieveProfile(){
        guard let userData = userData else {return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.profileError
        }
    }
    
    var isValidForm : Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
}
