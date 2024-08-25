//
//  AppetizerDetailView.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 19/08/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    var appetizer : Appetizer
    @Binding var isShowDetail: Bool
    @EnvironmentObject var order: Order
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack(){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 40){
                    NutritionView(title: "Calories", value: appetizer.calories)
                    NutritionView(title: "Carbs", value: appetizer.carbs)
                    NutritionView(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button{
                order.add(appetizer)
                isShowDetail = false
            }label: {
                //ApButton(title: "$\(appetizer.price, specifier: "%.2f") Add to order")
                Text("$\(appetizer.price, specifier: "%.2f") Add to order")
            }
            .modifier(CustomButtonModifier())
//            .buttonStyle(.bordered)
//            .tint(.Primary)
//            .controlSize(.large)
            .padding(.bottom, 30)
            
        }.frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(// Cross button overlay
                Button{
                    isShowDetail = false
                }label: {
                    XDismissButton()
                }
                , alignment: .topTrailing )
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: AppitizerMockData.sampleAppetizer1, isShowDetail: .constant(true))
    }
}

struct NutritionView: View{
    var title: String
    var value: Int
    var body: some View{
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
