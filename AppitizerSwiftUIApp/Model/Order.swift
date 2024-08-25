//
//  Order.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 23/08/2024.
//

import Foundation
final class Order: ObservableObject{
    @Published var items : [Appetizer] = []
    
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItem(at offset: IndexSet){
        items.remove(atOffsets: offset)
    }
    
    var totalPrice : Double{
        items.reduce(0) { $0 + $1.price }
    }
}
