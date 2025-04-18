//
//  AttributeText.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 18/09/24.
//

import UIKit


final class AttributeText{
	private init(){}
	static var shared = AttributeText()
	
	
	static func attributeStringConveter(mainString: String, substring: String = "*", substringColor: UIColor = .systemRed, customFontName: String? = nil, size: CGFloat? = nil) -> NSAttributedString {
		let attributedString = NSMutableAttributedString(string: mainString)
		
		// Set substring color
		attributedString.addAttribute(.foregroundColor, value: substringColor, range: NSRange(location: 0, length: mainString.count))
		
		if let fontName = customFontName, let fontSize = size {
			let customFont = UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
			attributedString.addAttribute(.font, value: customFont, range: NSRange(location: 0, length: mainString.count))
		}
		return attributedString
	}
}
