//
//  String+Extenssion.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 05/06/24.
//

import UIKit

extension String{
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    var isIFSCCodeValid: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]{4}0[A-Z0-9]{6}").evaluate(with: self)
    }
}
