//
//  OrdeView.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 14/08/2024.
//

import SwiftUI

struct OrdeView: View {
    @State private var orderlist  = AppitizerMockData.Appetizers
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(orderlist){appetizer in
                            AppetizerCell(appetizers: appetizer)
                            
                        }.onDelete(perform: deleteItem)
                    }
                    
                    Button{
                        print("Order button tapped")
                    } label: {
                        ApButton(title: "$99.00 - Order")
                    }.padding(.bottom, 20)
                }
                if orderlist.isEmpty{
                    EmptyState(image: "empty-order", message: "There is no order in the list.\n Please add new order from appetizer list.")
                }
            }
                .navigationTitle("Orders")
        }
    }
    
    func deleteItem(at offset: IndexSet){
        orderlist.remove(atOffsets: offset)
    }
}

struct OrdeView_Previews: PreviewProvider {
    static var previews: some View {
        OrdeView()
    }
}
