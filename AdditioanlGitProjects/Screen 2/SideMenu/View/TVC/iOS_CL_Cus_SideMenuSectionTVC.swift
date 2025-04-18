//
//  iOS_CL_Cus_SideMenuSectionTVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 18/10/24.
//

import UIKit

class iOS_CL_Cus_SideMenuSectionTVC: UITableViewCell {

	@IBOutlet weak var sectionNameLbl: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static var identifier = "iOS_CL_Cus_SideMenuSectionTVC"
	static func nib() -> UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
}
