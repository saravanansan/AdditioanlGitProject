//
//  iOS_CL_Cus_RedemptionCatalogeMyCartTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 26/11/24.
//

import UIKit

class iOS_CL_Cus_RedemptionCatalogeMyCartTVC: UITableViewCell {

    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productInfoLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    static var identifire = "iOS_CL_Cus_RedemptionCatalogeMyCartTVC"
    
    static func nib()-> UINib{
        return UINib(nibName: identifire, bundle: nil)
    }
    
    @IBAction func didTappedRemoveProduct(_ sender: Any) {
    }
}
