//
//  UITextField + Extension.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 08/07/24.
//

import UIKit

@IBDesignable
extension UITextField {
	
	@IBInspectable var paddingLeftCustom: CGFloat {
		get {
			return leftView!.frame.size.width
		}
		set {
			let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
			leftView = paddingView
			leftViewMode = .always
		}
	}
	
	@IBInspectable var paddingRightCustom: CGFloat {
		get {
			return rightView!.frame.size.width
		}
		set {
			let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
			rightView = paddingView
			rightViewMode = .always
		}
	}
	
	@IBInspectable var placeHolderColor: UIColor? {
		get {
			return self.placeHolderColor
		}
		set {
			self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
		}
	}
}
