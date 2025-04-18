//
//  iOS_CL_Cus_AlertMessageVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 10/10/24.
//

import UIKit


protocol AlertMessageDelegate: AnyObject{
	func didSelectAlertOKBtn()
}


class iOS_CL_Cus_AlertMessageVC: UIViewController {

	
	@IBOutlet weak var errorImage: UIImageView!
	@IBOutlet weak var titleLb: UILabel!
	@IBOutlet weak var bgView: UIViewDesignable!
	@IBOutlet weak var okBtn: UIButtonDesignable!
	@IBOutlet weak var msgLbl: UILabel!
	
	weak var delegate: AlertMessageDelegate?
	var isErrorImageHidden = true
	var imageName = ""
	var alertMessage = ""
	var okBtnName = ""
	var titleName = ""
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.initalCommit()
        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.animateIn()
	}

	
	override func viewWillLayoutSubviews() {
		self.bgView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
	}
	
	
	@IBAction func didTappedOkBtn(_ sender: UIButton) {
		self.animateOut(){
			self.delegate?.didSelectAlertOKBtn()
		}
	}
	
	
	private func initalCommit(){
		if self.titleName == ""{
			self.titleLb.isHidden = true
		}
		
		if self.alertMessage == ""{
			self.msgLbl.isHidden = true
		}
		
		self.titleLb.text = self.titleName
		self.msgLbl.text = alertMessage
		self.okBtn.setTitle(self.okBtnName, for: .normal)
		
		if self.imageName != ""{
			if let image = UIImage(named: imageName){
				self.errorImage.image = image
			}else if let systemImage = UIImage(systemName: imageName){
				self.errorImage.image = systemImage
			}else{
				self.errorImage.isHidden = true
			}
		}
		
		self.errorImage.isHidden = self.isErrorImageHidden
	}
}



//MARK: Open and closing Animation
extension iOS_CL_Cus_AlertMessageVC{

	 private func animateOut(completion: @escaping () -> ()) {
		let height = bgView.bounds.height
		UIView.animate(withDuration: 0.4, animations: { [weak self] in
			
			self?.view.backgroundColor = .black.withAlphaComponent(0)
			self?.bgView.transform = CGAffineTransform(translationX: 0, y: height)
		}, completion: { [weak self] _ in
			completion()
			self?.dismiss(animated: true)
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
