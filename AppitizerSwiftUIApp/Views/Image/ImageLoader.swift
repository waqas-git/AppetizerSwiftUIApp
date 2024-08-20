//
//  ImageLoader.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 18/08/2024.
//

import Foundation
import SwiftUI
final class ImageLoader : ObservableObject {
    @Published var image : Image? = nil
    
    func load(from urlString : String){
        NetworkManager.shared.downloadImage(from: urlString) { uiImage in
            guard let uiImage = uiImage else {return}
            
            DispatchQueue.main.async {
               // Image(uiImage: uiImage) is a SwiftUI initializer that converts a UIImage (from UIKit) into a SwiftUI.Image.
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}
    
struct RemoteImage: View {
    var image : Image?
    
    var body: some View{
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View{
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{imageLoader.load(from: urlString)}
    }
}
    

