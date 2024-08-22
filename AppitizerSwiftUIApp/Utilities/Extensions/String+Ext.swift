//
//  String+Ext.swift
//  AppitizerSwiftUIApp
//
//  Created by waqas ahmed on 21/08/2024.
//

import Foundation
extension String{
    var isValidEmail: Bool {
        let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
