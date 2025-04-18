//
//  iOS_CL_Cus_MyOrderDetailsTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 23/11/24.
//

import UIKit

class iOS_CL_Cus_MyOrderDetailsTVC: UITableViewCell {
    @IBOutlet weak var materialNameLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var totalamountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var identifier = "iOS_CL_Cus_MyOrderDetailsTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
}
