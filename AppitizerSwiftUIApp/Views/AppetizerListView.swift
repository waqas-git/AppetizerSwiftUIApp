//
//  AppetizerListView.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 14/08/2024.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack{
            List(appitizerMockData.Appetizers){ appetizers in
               AppetizerCell(appetizers: appetizers)
            }
            .navigationTitle("Appetizers")
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
