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
}
