//
//  iOS_CL_LodgeQueryListTVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit

class iOS_CL_LodgeQueryListTVC: UITableViewCell {

	@IBOutlet weak var refNumberLbl: UILabel!
	@IBOutlet weak var statusLbl: UILabel!
	@IBOutlet weak var statusViewBackground: UIViewDesignable!
	
	@IBOutlet weak var queryDetailsText: UITextView!
	@IBOutlet weak var dateLbl: UILabel!
	@IBOutlet weak var timeLbl: UILabel!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	static let identifier = "iOS_CL_LodgeQueryListTVC"
	
	static func nib()-> UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
    
}
