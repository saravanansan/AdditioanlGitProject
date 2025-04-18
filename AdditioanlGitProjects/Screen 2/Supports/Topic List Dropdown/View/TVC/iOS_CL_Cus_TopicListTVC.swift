//
//  iOS_CL_Cus_TopicListTVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit

class iOS_CL_Cus_TopicListTVC: UITableViewCell {

	
	@IBOutlet weak var bgView: UIViewDesignable!
	@IBOutlet weak var topicNameLbl: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static let identifier = "iOS_CL_Cus_TopicListTVC"
	static func nib()-> UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
    
}
