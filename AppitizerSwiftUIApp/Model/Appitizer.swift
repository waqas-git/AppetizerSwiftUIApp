//
//  Appitizer.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 15/08/2024.
//

import Foundation
// MARK: - AppitizerRespnse
struct AppetizerRespnse: Codable {
    let request: [Appetizer]
}

// MARK: - Appitizer
struct Appetizer: Codable, Identifiable {
    let id : Int
    let price: Double
    let imageURL: String
    let name: String
    let description: String
    let carbs, calories, protein : Int
}

struct AppitizerMockData {
    static let sampleAppetizer1 = Appetizer(id: 1,
                                           price: 8.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           name: "Asian Flank Steak",
                                           description: "This perfectly thin cut just melts in your mouth.",
                                           carbs: 0, calories: 399, protein: 27)
    static let sampleAppetizer2 = Appetizer(id: 2,
                                           price: 8.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           name: "Asian Flank Steak",
                                           description: "This perfectly thin cut just melts in your mouth.",
                                           carbs: 0, calories: 399, protein: 27)
    static let sampleAppetizer3 = Appetizer(id: 3,
                                           price: 8.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           name: "Asian Flank Steak",
                                           description: "This perfectly thin cut just melts in your mouth.",
                                           carbs: 0, calories: 399, protein: 27)
    
    static let Appetizers = [sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
    
}
