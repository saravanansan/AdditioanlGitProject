//
//  iOS_CL_Cus_RetailerOrderSummaryTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 25/11/24.
//

import UIKit

class iOS_CL_Cus_RetailerOrderSummaryDetailsTVC: UITableViewCell {
    @IBOutlet weak var materialCodeLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    static var identifier = "iOS_CL_Cus_RetailerOrderSummaryDetailsTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
