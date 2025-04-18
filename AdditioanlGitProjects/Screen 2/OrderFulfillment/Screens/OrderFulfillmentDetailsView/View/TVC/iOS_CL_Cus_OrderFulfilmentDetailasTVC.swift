//
//  iOS_CL_Cus_OrderFulfilmentDetailasTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 23/11/24.
//

import UIKit

class iOS_CL_Cus_OrderFulfilmentDetailasTVC: UITableViewCell {
    
    
    @IBOutlet weak var materialCodeLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var qtyFulfilledLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var identifier = "iOS_CL_Cus_OrderFulfilmentDetailasTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
