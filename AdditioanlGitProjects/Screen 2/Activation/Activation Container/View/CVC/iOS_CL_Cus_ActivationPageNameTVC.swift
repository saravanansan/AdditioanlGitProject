//
//  iOS_CL_Cus_ActivationPageNameTVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/10/24.
//

import UIKit

class iOS_CL_Cus_ActivationPageNameTVC: UICollectionViewCell {

	@IBOutlet weak var pageNameLbl: UILabel!
	@IBOutlet weak var buttomLine: UIView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	static let identifier = "iOS_CL_Cus_ActivationPageNameTVC"
	static func nib ()->UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
}
