//
//  AlertItem.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 17/08/2024.
//

import Foundation
import SwiftUI
struct AlertItem : Identifiable{
    let id  = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text(ApError.invalidData.rawValue),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text(ApError.invalidResponse.rawValue),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text(ApError.invalidURL.rawValue),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                       message: Text(ApError.unableToComplete.rawValue),
                                       dismissButton: .default(Text("OK")))
    
    //MARK: - Email Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                       message: Text(ApValidation.invalidForm.rawValue),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                       message: Text(ApValidation.invalidEmail.rawValue),
                                       dismissButton: .default(Text("OK")))
    
    //MARK: - USER Defaults Alerts
    static let profileSave = AlertItem(title: Text("Profile Save"),
                                       message: Text(ApValidation.profileSave.rawValue),
                                       dismissButton: .default(Text("OK")))
    
    static let profileError = AlertItem(title: Text("Profile Error"),
                                        message: Text(ApValidation.profileError.rawValue),
                                       dismissButton: .default(Text("OK")))
}
