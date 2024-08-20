//
//  LoadingView.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 18/08/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: (Color.Primary)))
                .scaleEffect(3)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
