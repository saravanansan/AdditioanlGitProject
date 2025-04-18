//
//  iOS_CL_Cus_ActivateVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/10/24.
//

import UIKit

class iOS_CL_Cus_ActivateVC: AppViewController {

	
	@IBOutlet weak var customeIDTF: UITextField!
	@IBOutlet weak var firmNameLbl: UILabel!
	
	var activationData: ActivationModels
	
	init(activationData: ActivationModels){
		self.activationData = activationData
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.customeIDTF.isUserInteractionEnabled = false
		self.dataConfig()
    }
	
	
	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	
	@IBAction func didSelectConfirmBtn(_ sender: GradientButton) {
		guard let customerDetail = self.activationData.objCustomerBasicDetailsActivation else{
			return
		}
		let viewmodel = VMFactory.shared.activationContainerVM()
		let vc = iOS_CL_Cus_ActivateContainerVC(customerDetails: customerDetail, viewModel: viewmodel)
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	private func dataConfig(){
		self.customeIDTF.text = self.activationData.objCustomerBasicDetailsActivation?.loyalityID ?? ""
		self.firmNameLbl.text = self.activationData.objCustomerBasicDetailsActivation?.firmName ?? ""
	}
}
