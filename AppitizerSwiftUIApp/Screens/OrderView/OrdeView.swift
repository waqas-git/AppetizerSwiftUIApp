//
//  OrdeView.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 14/08/2024.
//

import SwiftUI

struct OrdeView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){appetizer in
                            AppetizerCell(appetizers: appetizer)
                            
                        }.onDelete(perform: order.deleteItem)
                    }.listStyle(.plain)
                    
                    Button{
                        print("Order button tapped")
                    } label: {
                        //ApButton(title: "\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(CustomButtonModifier())
                    .padding(.bottom, 20)
                }
                if order.items.isEmpty{
                    EmptyState(image: "empty-order", message: "There is no order in the list.\n Please add new order from appetizer list.")
                }
            }
                .navigationTitle("Orders")
        }
    }
}

struct OrdeView_Previews: PreviewProvider {
    static var previews: some View {
        OrdeView().environmentObject(Order())
    }
}
