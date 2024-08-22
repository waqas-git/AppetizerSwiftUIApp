//
//  User.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 22/08/2024.
//

import Foundation
struct User : Codable{
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var birthday: Date = Date()
    var extraNapkins: Bool = false
    var frequentReffils : Bool = false
}
