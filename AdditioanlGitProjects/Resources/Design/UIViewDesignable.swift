//
//  UIViewDesignable.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 05/06/24.
//

import UIKit

@IBDesignable
final class UIViewDesignable: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet { layer.shadowRadius = shadowRadius }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet { layer.shadowOpacity = shadowOpacity }
    }
    
    @IBInspectable var shadowOffset: CGSize = .init(width: 0, height: 0) {
        didSet { layer.shadowOffset = shadowOffset }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet { layer.shadowColor = shadowColor.cgColor }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        layer.masksToBounds = false
//    }
}
