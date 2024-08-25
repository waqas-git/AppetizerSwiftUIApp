//
//  AppitizerSwiftUIAppApp.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 14/08/2024.
//

import SwiftUI

@main
struct AppitizerSwiftUIAppApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppitizerTabView().environmentObject(order)
        }
    }
}
