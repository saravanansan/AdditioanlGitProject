//
//  ToastMessage.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 12/11/24.
//

import UIKit

final class ToastMessage{
	private var screenWidth: CGFloat{
		return  UIScreen.main.bounds.width
	}
	
	private var screenHeight: CGFloat{
		return  UIScreen.main.bounds.height
	}
	
	private let window2 = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
	
	static var shared = ToastMessage()
	
	private init()
	{}
	
	private func labelConfig(toastLabel: UILabel,
							 bgColor: UIColor,
							 textColor: UIColor,
							 fontSize: CGFloat
	){
		toastLabel.backgroundColor = bgColor.withAlphaComponent(1)
		toastLabel.textColor = textColor
		toastLabel.textAlignment = .center
		toastLabel.font = UIFont.systemFont(ofSize: fontSize)
		toastLabel.numberOfLines = 0
		toastLabel.alpha = 0.0
		toastLabel.layer.cornerRadius = 10
		toastLabel.clipsToBounds = true
	}
	
	func showToast(message: String,
				   durationTime: Double = 2.0,
				   position: ToastPosition = .bottom,
				   bgColor: UIColor = .red,
				   textColor: UIColor = .white,
				   fontSize: CGFloat = 14
	){
		let toastLabel =  UILabel()
		toastLabel.text = message
		self.labelConfig(toastLabel: toastLabel,bgColor: bgColor, textColor: textColor, fontSize: fontSize)
		let maxWidth = UIScreen.main.bounds.width - 20
		let textSize = toastLabel.sizeThatFits(CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
		let labelWidth = min(maxWidth, textSize.width + 20)
		let labelHeight = textSize.height + 20
		
		
		switch position {
			case .bottom:
				toastLabel.frame = CGRect(x: (self.screenWidth - labelWidth) / 2,
										  y: self.screenHeight - (labelHeight + 80),
										  width: labelWidth,
										  height: labelHeight)
			case .center:
				toastLabel.frame = CGRect(x: (self.screenWidth - labelWidth) / 2,
										  y: (self.screenHeight - labelHeight) / 2,
										  width: labelWidth,
										  height: labelHeight)
			case .top:
				toastLabel.frame = CGRect(x: (self.screenWidth - labelWidth) / 2,
										  y: 100,
										  width: labelWidth,
										  height: labelHeight)
		}
		
		self.window2?.addSubview(toastLabel)
		
		
		UIView.animate(withDuration: 0.2, animations: {
			toastLabel.alpha = 1.0
			toastLabel.shake(duration: 0.1,repeatCount: 2,shakeOffset: 5)
		}) { _ in
			self.hideToast(toastLabel: toastLabel,duration: durationTime)
		}
	}
	
	
	private func hideToast(toastLabel: UILabel,duration: Double){
		UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
			toastLabel.alpha = 0.0
		}) { _ in
			toastLabel.removeFromSuperview()
		}
	}
	
	
	enum ToastPosition {
		case top
		case center
		case bottom
	}
	
}


extension UIView {
	func shake(duration: CFTimeInterval = 0.1, repeatCount: Float = 3, shakeOffset: CGFloat = 10) {
		let animation = CABasicAnimation(keyPath: "position")
		animation.duration = duration
		animation.repeatCount = repeatCount
		animation.autoreverses = true
		animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - shakeOffset, y: self.center.y))
		animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + shakeOffset, y: self.center.y))
		
		self.layer.add(animation, forKey: "position")
	}
}

