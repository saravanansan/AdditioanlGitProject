//
//  iOS_CL_MonthlyTargetTVCell.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/10/24.
//

import UIKit

class iOS_CL_MonthlyTargetTVCell: UITableViewCell {

	@IBOutlet weak var monthNameLbl: UILabel!
	
	@IBOutlet weak var achivedPointsLbl: UILabel!
	@IBOutlet weak var targetPointsLbl: UILabel!
	
	@IBOutlet weak var percentageLbl: UILabel!
	@IBOutlet weak var progressBar: CustomeProgressBar!
	
	@IBOutlet weak var lockScreen: UIView!
	
	
	
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static let identifier = "iOS_CL_MonthlyTargetTVCell"
	static func nib()->UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
    
}
