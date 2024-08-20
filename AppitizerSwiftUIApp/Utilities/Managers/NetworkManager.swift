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
    
    func  getAppetizers(completed: @escaping (Result<[Appetizer], ApError>) -> Void) {
        
        guard let url = URL(string: NetworkManager.BASE_URL + appitizerUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let _  = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodeResponse = try decoder.decode(AppetizerRespnse.self, from: data)
                completed(.success(decodeResponse.request))
                return
            }catch{
                completed(.failure(.invalidResponse))
            }
        }
        task.resume()
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
                guard let data = data, let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
                self.cache.setObject(image, forKey: cacheKey)
                completed(image)
            }
            task.resume()
        }
}
