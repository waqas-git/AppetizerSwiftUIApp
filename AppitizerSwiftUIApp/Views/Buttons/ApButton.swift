//
//  ApButton.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 20/08/2024.
//

import SwiftUI

struct ApButton: View {
    var title: LocalizedStringKey
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50)
                .font(.title3)
                .background(Color(.Primary!))
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .cornerRadius(10)
    }
}

struct ApButton_Previews: PreviewProvider {
    static var previews: some View {
        ApButton(title: "$\(124.00099000, specifier: "%.2f") Add to order")
    }
}
