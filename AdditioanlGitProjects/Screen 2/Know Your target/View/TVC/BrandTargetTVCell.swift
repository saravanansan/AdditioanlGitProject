//
//  BrandTargetTVCell.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 04/10/24.
//

import UIKit

class BrandTargetTVCell: UITableViewCell {

	@IBOutlet weak var brandNameLbl: UILabel!
	@IBOutlet weak var achivedPointsLbl: UILabel!
	@IBOutlet weak var totalTargetPointsLbl: UILabel!
	
	@IBOutlet weak var progressView: CustomeProgressBar!
	@IBOutlet weak var percentageLbl: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	static let identifier = "BrandTargetTVCell"
	static func nib()->UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
    
}
