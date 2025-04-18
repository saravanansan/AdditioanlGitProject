//
//  NumberFormatter + extension.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 31/10/24.
//

import UIKit



class numbersFormat{
	static func format(value: Int,maxFraction: Int = 0) -> String{
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = maxFraction
		
		if let  x = formatter.string(from: NSNumber(value: value)){
			return x
		}else{
			return "\(value)"
		}
	}
}


