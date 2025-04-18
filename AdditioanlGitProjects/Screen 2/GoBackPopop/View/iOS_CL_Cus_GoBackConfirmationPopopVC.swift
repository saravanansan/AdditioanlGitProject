//
//  iOS_CL_Cus_GoBackConfirmationPopopVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 14/11/24.
//

import UIKit

class iOS_CL_Cus_GoBackConfirmationPopopVC: UIViewController {

	
	@IBOutlet weak var popopView: UIViewDesignable!
	@IBOutlet weak var errorImageView: UIViewDesignable!
	@IBOutlet weak var messageLbl: UILabel!
	@IBOutlet weak var yesBtn: UIButtonDesignable!
	@IBOutlet weak var noBtn: GradientButton!
	@IBOutlet weak var errorImage: UIImageView!
	
	var message: String?
	var yesBtnName: String?
	var noBtnName: String?
	var isWarningIconHidden = true
	var iconImageName: String? = "exclamationmark.triangle.fill"
	
	weak var delegate: ConfirmationPopopDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		self.popopView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.animateIn()
	}
	
	@IBAction func didSelectNoBtn(_ sender: UIButtonDesignable) {
		animateOut(){}
	}
	
	
	@IBAction func didSelectYesBtn(_ sender: UIButtonDesignable) {
		self.delegate?.didSelectBackConfirm()
		animateOut(){}
	}
	
	
	
	private func initialComits(){
		
		self.errorImageView.isHidden = self.isWarningIconHidden
		if let message{
			self.messageLbl.text = message
		}
		
		if let yesBtnName{
			self.yesBtn.setTitle(yesBtnName, for: .normal)
		}
		if let noBtnName{
			self.noBtn.setTitle(noBtnName, for: .normal)
		}
		if let iconImageName{
			if let image = UIImage(systemName: iconImageName){
				self.errorImage.image = image
			}else if let image = UIImage(named: iconImageName){
				self.errorImage.image = image
			}
			
		}
	}
}



//MARK: Open and closing Animation
extension iOS_CL_Cus_GoBackConfirmationPopopVC{
	
	
	private func animateOut(completion: @escaping () -> ()) {
		let height = popopView.bounds.height
		UIView.animate(withDuration: 0.4, animations: { [weak self] in
			
			self?.view.backgroundColor = .black.withAlphaComponent(0)
			self?.popopView.transform = CGAffineTransform(translationX: 0, y: height)
		}, completion: { [weak self] _ in
			completion()
			self?.dismiss(animated: true)
		})
	}
	
	private func animateIn() {
		self.view.backgroundColor = .clear
		let height = popopView.bounds.height
		popopView.transform = CGAffineTransform(translationX: 0, y: height)
		UIView.animate(withDuration: 0.4) { [weak self] in
			self?.popopView.transform = .identity
			self?.view.backgroundColor = .black.withAlphaComponent(0.4)
			
		}
	}
}
