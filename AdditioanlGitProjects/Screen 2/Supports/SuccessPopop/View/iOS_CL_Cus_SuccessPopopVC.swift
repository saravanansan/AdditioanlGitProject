//
//  iOS_CL_Cus_SuccessPopopVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit
import Lottie

protocol SuccessPopopDelegate: AnyObject{
	func didSelectBackToDashboard()
}

class iOS_CL_Cus_SuccessPopopVC: UIViewController {

	@IBOutlet weak var successAnimationView: LottieAnimationView!
	@IBOutlet weak var successLbl: UILabel!
	@IBOutlet weak var messageLbl: UILabel!
	@IBOutlet weak var backbtn: GradientButton!
	
	var lottieAnimation : LottieAnimationView?
	weak var delegate: SuccessPopopDelegate?
	var successMSG: String?
	var titleName: String?
	var confirmBtnName: String?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.lottieLoader()
		self.initalCommits()
    }


	@IBAction func didSelectBackToashboard(_ sender: GradientButton) {
		self.delegate?.didSelectBackToDashboard()
		dismiss(animated: true)
	}
	
	
	func lottieLoader(){
		DispatchQueue.main.async { [weak self] in
			guard let self = self else{return}
			lottieAnimation = .init(name: "successLottieFile")
			lottieAnimation?.frame = self.successAnimationView.bounds
			lottieAnimation?.contentMode = .scaleAspectFit
			lottieAnimation?.loopMode = .loop
			lottieAnimation?.animationSpeed = 1
			self.successAnimationView?.addSubview(lottieAnimation!)
			lottieAnimation?.play()
		}
	}

	private func initalCommits(){
		if let titleName{
			self.successLbl.text = titleName
		}
		
		if let successMSG{
			self.messageLbl.text = successMSG
		}
		
		if let confirmBtnName{
			self.backbtn.setTitle(confirmBtnName, for: .normal)
		}
	}
}
