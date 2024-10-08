//
//  AppetizerCell.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 15/08/2024.
//

import SwiftUI

struct AppetizerCell: View {
    var appetizers: Appetizer
    var body: some View {
        HStack{
//            AppetizerRemoteImage(urlString: appetizers.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(5)
            AsyncImage(url: URL(string: appetizers.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(5)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(5)
            }
            
            VStack(alignment: .leading, spacing: 5){
                Text(appetizers.name)
                    .font(Font.title2)
                    .fontWeight(.medium)
                Text("$\(appetizers.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }.padding(.leading)
        }
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCell(appetizers: AppitizerMockData.sampleAppetizer1)
    }
}
