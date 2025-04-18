//
//  iOS_CL_Cus_SuccessSubmissionVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 14/10/24.
//

import UIKit

protocol SuccessSubmissionProtocol: AnyObject{
	func didSelectProceedBtn()
}

class iOS_CL_Cus_SuccessSubmissionVC: UIViewController {
	
	
	@IBOutlet weak var bgView: UIViewDesignable!
	@IBOutlet weak var msgLbl: UILabel!
	@IBOutlet weak var proceedBtn: GradientButton!
	
	@IBOutlet weak var successImage: UIImageView!
	
	weak var delegate: SuccessSubmissionProtocol?
	var message = ""
	var proceedBtnName = "Proceed"
	
	var isHiddenSuccessImg = false
	var successImgName: String? = "success"
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		self.initalComit()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.animateIn()
	}
    
	override func viewWillLayoutSubviews() {
		self.bgView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
	}
	
	@IBAction func didTappedOkBtn(_ sender: UIButton) {
		self.delegate?.didSelectProceedBtn()
		self.animateOut(){}
	}
	
	private func initalComit(){
		
		self.msgLbl.text = self.message
		self.proceedBtn.setTitle(self.proceedBtnName, for: .normal)
		
		if let successImgName{
			if let image = UIImage(systemName: successImgName){
				self.successImage.image = image
			}else if let image = UIImage(named: successImgName){
				self.successImage.image = image
			}
			
		}
		
		self.successImage.isHidden = self.isHiddenSuccessImg
	}
}


//MARK: Open and closing Animation
extension iOS_CL_Cus_SuccessSubmissionVC{

	 private func animateOut(completion: @escaping () -> ()) {
		let height = bgView.bounds.height
		UIView.animate(withDuration: 0.4, animations: { [weak self] in
			
			self?.view.backgroundColor = .black.withAlphaComponent(0)
			self?.bgView.transform = CGAffineTransform(translationX: 0, y: height)
		}, completion: { [weak self] _ in
			self?.dismiss(animated: true){
				completion()
			}
		})
	}
	
	private func animateIn() {
		self.view.backgroundColor = .clear
		let height = bgView.bounds.height
		bgView.transform = CGAffineTransform(translationX: 0, y: height)
		UIView.animate(withDuration: 0.4) { [weak self] in
			self?.bgView.transform = .identity
			self?.view.backgroundColor = .black.withAlphaComponent(0.4)
			
		}
	}
}
