//
//  iOS_CL_Cus_MySchemesDetailsVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import UIKit

class iOS_CL_Cus_MySchemesDetailsVC: UIViewController {

    @IBOutlet weak var schemeImage: UIImageView!
    @IBOutlet weak var schemeDetailsInfoLbl: UILabel!
    @IBOutlet weak var validFormLbl: UILabel!
    @IBOutlet weak var validToLbl: UILabel!
    @IBOutlet weak var orderNowOutBtn: GradientButton!
    @IBOutlet weak var orderView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }

    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTappedOrderNowBtn(_ sender: Any) {
//        let vc = iOS_CL_Cus_BrandDetailListingVC()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension iOS_CL_Cus_MySchemesDetailsVC{
    private func configuration(){
        self.orderView.layer.cornerRadius = 10
        self.orderView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
}
