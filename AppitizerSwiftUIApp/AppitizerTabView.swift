//
//  ContentView.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 14/08/2024.
//

import SwiftUI

struct AppitizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrdeView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
        }
        .accentColor(Color("Primary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppitizerTabView()
    }
}
