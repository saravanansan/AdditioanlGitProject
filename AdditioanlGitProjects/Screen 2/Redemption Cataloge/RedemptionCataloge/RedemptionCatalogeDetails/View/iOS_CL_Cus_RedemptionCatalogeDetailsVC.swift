//
//  iOS_CL_Cus_RedemptionCatalogeDetailsVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 26/11/24.
//

import UIKit

class iOS_CL_Cus_RedemptionCatalogeDetailsVC: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var termsandConditionLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTappedAddToCartBtn(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Added to cart successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTappedAddedToCart(_ sender: Any) {
    }
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension iOS_CL_Cus_RedemptionCatalogeDetailsVC {
    
}
