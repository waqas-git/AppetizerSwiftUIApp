//
//  ApError.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 16/08/2024.
//

import Foundation
enum ApError : String, Error{
    case invalidURL         = "This URL is invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Server doesn't respond to the application. Please try again."
    case invalidData        = "The Data received from the server is invalid. Please try again."
}
