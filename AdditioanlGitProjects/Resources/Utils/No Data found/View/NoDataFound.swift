//
//  NoDataFound.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation
import Lottie


final class NoDataFound {
	
	
	var bgView : UIView
	var loaderView = LottieAnimationView()
	let LoaderAnimation = "no_data_animation"
	
	init(view: UIView)
	{
		self.bgView = view
		self.loaderViewConfig()
	}
	

	private func loaderViewConfig(){
		self.loaderView = .init(name: self.LoaderAnimation)
		self.loaderView.contentMode = .scaleAspectFit
		self.loaderView.loopMode = .loop
		self.loaderView.animationSpeed = 1
	}
	
	func showNoDataFound(){
		DispatchQueue.main.async() {

			self.bgView.addSubview(self.loaderView)
			self.bgView.backgroundColor = .clear
			self.bgView.isUserInteractionEnabled = false
//			self.loaderView.translatesAutoresizingMaskIntoConstraints = false
			self.loaderView.backgroundColor = AppColor.deepBlack
			self.loaderView.frame = self.bgView.bounds
			
			/*self.loaderView.heightAnchor.constraint(equalToConstant: self.bgView.frame.height - 30).isActive = true
			self.loaderView.widthAnchor.constraint(equalToConstant: self.bgView.frame.width - 20).isActive = true
			self.loaderView.centerXAnchor.constraint(equalTo: self.bgView.centerXAnchor).isActive = true
			self.loaderView.centerYAnchor.constraint(equalTo: self.bgView.centerYAnchor).isActive = true
			
			self.loaderView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.bgView.leadingAnchor, multiplier: 0.8).isActive = true
			self.loaderView.trailingAnchor.constraint(equalToSystemSpacingAfter: self.bgView.trailingAnchor, multiplier: 0.8).isActive = true
			*/
			self.loaderView.play()
		}
	}
	
	func hideNoDataFound(){
		DispatchQueue.main.async(){
			self.loaderView.removeFromSuperview()
			self.loaderView.stop()
		}
	}
}

