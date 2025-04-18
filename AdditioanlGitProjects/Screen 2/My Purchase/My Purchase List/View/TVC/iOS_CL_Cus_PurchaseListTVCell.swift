//
//  iOS_CL_Cus_PurchaseListTVCell.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 22/10/24.
//

import UIKit

class iOS_CL_Cus_PurchaseListTVCell: UITableViewCell {

	@IBOutlet weak var cpNameLbl: UILabel!
	@IBOutlet weak var invDateLbl: UILabel!
	@IBOutlet weak var orderNumberLbl: UILabel!
	@IBOutlet weak var invoiceNumberLbl: UILabel!
	
	@IBOutlet weak var pointsLbl: UILabel!
	
	
	
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
	
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
	
	static var identifier = "iOS_CL_Cus_PurchaseListTVCell"
	
	static func nib() -> UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
	
    
	@IBAction func didSelectViewmore(_ sender: GradientButton) {
	}
	
	
}
