//
//  AccountView.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 14/08/2024.
//

import SwiftUI

struct AccountView: View {
    
    enum FormTextFields {
        case firstname
        case lastname
        case email
    }
    @StateObject var viewModel = AccountVM()
    @FocusState private var focusedTextField: FormTextFields?
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("PERSONAL INFO")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstname)
                        .onSubmit {focusedTextField = .lastname}
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastname)
                        .onSubmit {focusedTextField = .email}
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .onSubmit {focusedTextField = nil}
                    
                    DatePicker("Date Picker", selection: $viewModel.user.birthday,
                               displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                    } label:{
                        Text("Save Changes")
                    }
                }
                Section(header: Text("REQUESTES")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Extra Reffils", isOn: $viewModel.user.frequentReffils)
                }.toggleStyle(SwitchToggleStyle(tint: .Primary))
            }
            .navigationTitle("Account")
            .toolbar{ToolbarItemGroup(placement: .keyboard){
                Button("Dismiss") {
                    focusedTextField = nil
                }
            }
            }
        }.onAppear(){
            viewModel.retrieveProfile()
        }
        .alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
