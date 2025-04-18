//
//  iOS_CL_Cus_PurchaseDetailsTVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 23/10/24.
//

import UIKit

class iOS_CL_Cus_PurchaseDetailsTVC: UITableViewCell {
	
	@IBOutlet weak var materialNameLbl: UILabel!
	@IBOutlet weak var qtyLbl: UILabel!
	@IBOutlet weak var totalPointsLbl: UILabel!
	@IBOutlet weak var lineLbl: UILabel!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static var identifier = "iOS_CL_Cus_PurchaseDetailsTVC"
	static func nib() -> UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
    
}
