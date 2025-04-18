//
//  CustomeProgressBar.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 02/10/24.
//

import UIKit


@IBDesignable open class CustomeProgressBar: UIView {

	@IBOutlet fileprivate(set) weak var progressBarContainer: UIViewDesignable!
	@IBOutlet fileprivate(set) weak var progressView: UIViewDesignable!
	@IBOutlet fileprivate(set) weak var progressCircleView: GradientView!
	@IBOutlet fileprivate(set) weak var progressCircleViewHeightConstraints: NSLayoutConstraint!
	
	@IBOutlet fileprivate(set) weak var progressCircleImage: UIImageView!
	
	@IBOutlet fileprivate(set) weak var pointsValueSV: UIView!
	@IBOutlet fileprivate(set) weak var pointsLbl: UILabel!
	@IBOutlet fileprivate(set) weak var progressViewWidthConstraints: NSLayoutConstraint!
	
	@IBOutlet fileprivate(set) weak var pointsValueSVTopConstraints: NSLayoutConstraint!
	
	
	@IBInspectable var circleViewHeight: CGFloat = 16 {
		didSet{
			self.progressCircleViewHeightConstraints.constant = circleViewHeight
			self.progressCircleView.cornerRadius = (circleViewHeight / 2)
		}
	}
	
	
	@IBInspectable var pointsValueSVTopConsttraints : CGFloat = 8{
		didSet{
			self.pointsValueSVTopConstraints.constant = pointsValueSVTopConsttraints
		}
	}
	

	@IBInspectable var isPointsValueSVHidden: Bool = true{
		didSet{
			self.pointsValueSV.isHidden = isPointsValueSVHidden
		}
	}
	
	@IBInspectable var isCircleHidden: Bool = true{
		didSet{
			self.progressCircleView.isHidden = isCircleHidden
		}
	}
	
	@IBInspectable var progressTrackValue: Double = 0{
		didSet{
			if progressTrackValue >= 1{
				self.progressViewWidthConstraints.constant = frame.width
				self.pointsValueSV.isHidden = isPointsValueSVHidden
				self.progressCircleView.isHidden = true
			}else if progressTrackValue <= 0{
				self.pointsValueSV.isHidden = isPointsValueSVHidden
				self.progressCircleView.isHidden = true
				self.progressViewWidthConstraints.constant = 0
			}else{
				self.progressViewWidthConstraints.constant = frame.width * progressTrackValue
				self.pointsValueSV.isHidden = isPointsValueSVHidden
				self.progressCircleView.isHidden = isCircleHidden
			}
		}
	}
	
	@IBInspectable var progressTint : UIColor = .blue{
		didSet{
			self.progressView.backgroundColor = progressTint
		}
	}
	
	@IBInspectable var TrackTint : UIColor = .gray{
		didSet{
			self.progressBarContainer.backgroundColor = TrackTint
		}
	}
	
	
	var pointsValue: String = "0"{
		didSet{
			self.pointsLbl.text =  pointsValue
		}
	}
	

	open override func layoutSubviews() {
		super.layoutSubviews()
		//progressViewCreation()
		initialConfiguration()
		
	}
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		progressViewCreation()
	}
	
	required public init?(coder: NSCoder) {
		super.init(coder: coder)
		progressViewCreation()
	}
	
	private func progressViewCreation(){
		guard let view = self.loadViewFromNib(nibName: "CustomeProgressBar") else{return}
		view.frame = self.bounds
		self.addSubview(view)
	}
	
	private func initialConfiguration(){
		self.pointsLbl.text =  pointsValue
		self.progressBarContainer.backgroundColor = TrackTint
		self.progressView.backgroundColor = progressTint
		self.progressCircleView.isHidden = isCircleHidden
		self.pointsValueSV.isHidden = isPointsValueSVHidden
		self.progressBarContainer.cornerRadius = (frame.height / 2)
		self.progressView.cornerRadius = (frame.height / 2)
		self.pointsValueSVTopConstraints.constant = pointsValueSVTopConsttraints
		self.progressCircleViewHeightConstraints.constant = circleViewHeight
		self.progressCircleView.cornerRadius = (circleViewHeight / 2)
		
		
		if progressTrackValue >= 1{
			self.progressViewWidthConstraints.constant = frame.width
			self.pointsValueSV.isHidden = isPointsValueSVHidden
			self.progressCircleView.isHidden = true
		}else if progressTrackValue <= 0{
			self.pointsValueSV.isHidden = isPointsValueSVHidden
			self.progressCircleView.isHidden = true
			self.progressViewWidthConstraints.constant = 0
		}else{
			self.progressViewWidthConstraints.constant = frame.width * progressTrackValue
			self.pointsValueSV.isHidden = isPointsValueSVHidden
			self.progressCircleView.isHidden = isCircleHidden
		}
		
	}
	
	
	func progressBarAnimate() {
		let progressBar = frame.width * progressTrackValue
		self.progressView.transform = CGAffineTransform(translationX: -progressBar, y: 0)

		UIView.animate(withDuration: 2) {
			self.progressView.transform = .identity
		}
	}
	
}

extension UIView{
	func loadViewFromNib(nibName: String) -> UIView?{
		let bundleId = Bundle(for: type(of: self))
		let nib = UINib(nibName: nibName, bundle: bundleId)
		return nib.instantiate(withOwner: self,options: nil).first as? UIView
	}
}
                                         
