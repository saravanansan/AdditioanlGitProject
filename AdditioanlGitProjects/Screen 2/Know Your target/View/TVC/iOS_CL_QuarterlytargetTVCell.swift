//
//  iOS_CL_QuarterlytargetTVCell.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/10/24.
//

import UIKit

class iOS_CL_QuarterlytargetTVCell: UITableViewCell {
	
	@IBOutlet weak var quarterNameLbl: UILabel!
	@IBOutlet weak var dateLbl: UILabel!
	
	@IBOutlet weak var achivedPointsLbl: UILabel!
	@IBOutlet weak var targetPointsLbl: UILabel!
	
	@IBOutlet weak var percentageValue: UILabel!
	@IBOutlet weak var progressBar: CustomeProgressBar!
	
	@IBOutlet weak var lockView: UIView!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	
	static let identifier = "iOS_CL_QuarterlytargetTVCell"
	static func nib()->UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
	

}
