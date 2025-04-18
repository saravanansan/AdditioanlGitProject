//
//  AppLoader.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation

import UIKit
import Lottie

final class AppLoader {
	
	public static let shared = AppLoader()
	var shadowView = UIView()
	var loaderView = LottieAnimationView()
	let LoaderAnimation = "loader"
	static var loaderCount = 0
	
	
	let window2 = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
	
	
	private init()
	{
		self.shadowViewConfig()
		self.loaderViewConfig()
	}
	
	
	private func shadowViewConfig(){
		shadowView.frame = UIScreen.main.bounds
		shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
		shadowView.isUserInteractionEnabled = true
	}
	
	private func loaderViewConfig(){
		self.loaderView.backgroundColor = UIColor.green
		self.loaderView = .init(name: self.LoaderAnimation)
		self.loaderView.contentMode = .scaleAspectFit
		self.loaderView.loopMode = .loop
		self.loaderView.animationSpeed = 1
	}
	
	func startLoader(){
		DispatchQueue.main.async() {
			AppLoader.loaderCount += 1
			guard AppLoader.loaderCount <= 1 else{
				return
			}
			self.window2?.addSubview(self.shadowView)
			self.window2?.addSubview(self.loaderView)
			self.loaderView.frame.size = .init(width: 150, height: 150)
			self.loaderView.center = self.shadowView.center
			self.loaderView.play()
		}
	}
	
	func stopLoader(){
		AppLoader.loaderCount -= 1
		guard AppLoader.loaderCount <= 1 else{
			return
		}
		DispatchQueue.main.async(){
			self.shadowView.removeFromSuperview()
			self.loaderView.removeFromSuperview()
			self.loaderView.stop()
		}
	}
}
