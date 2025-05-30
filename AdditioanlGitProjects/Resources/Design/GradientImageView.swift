//
//  GradientImageView.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 07/11/24.
//

import Foundation
import UIKit


@IBDesignable
class GradientImageView: UIImageViewDesignable {

	@IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
	@IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
	@IBInspectable var startLocation: Double =   0.01 { didSet { updateLocations() }}
	@IBInspectable var endLocation:   Double =   0.99 { didSet { updateLocations() }}
	@IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
	@IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

	override public class var layerClass: AnyClass { CAGradientLayer.self }

	var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

	func updatePoints() {
		if horizontalMode {
			gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
			gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
		} else {
			gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
			gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
		}
	}
	func updateLocations() {
		gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
	}
	func updateColors() {
		gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
	}
	override public func layoutSubviews() {
		super.layoutSubviews()
		updatePoints()
		updateLocations()
		updateColors()
	}
}
