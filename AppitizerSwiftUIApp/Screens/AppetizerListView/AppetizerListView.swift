//
//  AppetizerListView.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 14/08/2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers){ appetizer in
                    AppetizerCell(appetizers: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetails = true
                        }
                }
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetails)
            }
            .onAppear(){
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetails ? 20: 0)
            if viewModel.isLoading{
                LoadingView()
            }
            if(viewModel.isShowingDetails){
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowDetail: $viewModel.isShowingDetails)
            }
        }.alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
