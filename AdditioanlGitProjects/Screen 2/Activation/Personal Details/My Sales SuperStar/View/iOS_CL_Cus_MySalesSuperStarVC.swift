//
//  iOS_CL_Cus_MySalesSuperStarVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 10/10/24.
//

import UIKit

class iOS_CL_Cus_MySalesSuperStarVC: UIViewController {

	@IBOutlet weak var bgView: UIViewDesignable!
	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var rollNameLbl: UILabel!
	@IBOutlet weak var mobileNumberLbl: UILabel!
	@IBOutlet weak var emailIDLbl: UILabel!
	
	
	var superStarData: HierarchyMapDetails?
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.dataBind()
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.animateIn()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first
		guard let touch else{return}
		
		if touch.view == self.view{
			self.animateOut {}
		}
	}
	
	@IBAction func didSelectCloseBtn(_ sender: Any) {
		self.animateOut(){
		}
	}
	
	
	private func dataBind(){
		self.nameLbl.text = self.superStarData?.beName ?? "-"
		self.rollNameLbl.text = self.superStarData?.role ?? "-"
		self.mobileNumberLbl.text = self.superStarData?.beMobileNo ?? "-"
		self.emailIDLbl.text = self.superStarData?.beEmail ?? "-"
	}

}


//MARK: Open and closing Animation
extension iOS_CL_Cus_MySalesSuperStarVC{

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
