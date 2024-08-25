//
//  CustomButtonModifier.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 23/08/2024.
//

import SwiftUI
struct CustomButtonModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.Primary)
            .controlSize(.large)
    }
    
}
