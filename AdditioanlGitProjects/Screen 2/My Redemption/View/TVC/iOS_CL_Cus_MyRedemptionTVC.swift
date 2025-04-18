//
//  iOS_CL_Cus_MyRedemptionTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 25/11/24.
//

import UIKit

class iOS_CL_Cus_MyRedemptionTVC: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var productInfoLbl: UILabel!
    @IBOutlet weak var refNoLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var pointsRedeemedLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    static var identifier = "iOS_CL_Cus_MyRedemptionTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
