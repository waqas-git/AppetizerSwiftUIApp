//
//  NetworkManager.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 16/08/2024.
//

import Foundation
import UIKit
class NetworkManager{
    static let shared = NetworkManager()
    let cache =  NSCache<NSString, UIImage>()
    static let BASE_URL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    let appitizerUrl = "/appetizers"
    
    public init(){}
    
    func  getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: NetworkManager.BASE_URL + appitizerUrl) else {
            throw ApError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(AppetizerRespnse.self, from: data).request
            }catch{
               throw ApError.invalidResponse
            }
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void){
            let cacheKey = NSString(string: urlString)
            
            if let image = cache.object(forKey: cacheKey){
                completed(image)
                return
            }
            
            guard let url = URL(string: urlString) else{
                completed(nil)
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) {data, response, error in
                guard let data, let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
                self.cache.setObject(image, forKey: cacheKey)
                completed(image)
            }
            task.resume()
        }
}
