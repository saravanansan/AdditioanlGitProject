//
//  iOS_CL_Cus_NotificationListTVCell.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 23/10/24.
//

import UIKit


protocol NotificationHistoryDelegate: AnyObject{
	func didSelectImageDetails(imageURL: URL)
}


class iOS_CL_Cus_NotificationListTVCell: UITableViewCell {
	
	
	@IBOutlet weak var bgView: UIViewDesignable!
	@IBOutlet weak var notificationImage: UIImageView!
	
	@IBOutlet weak var notificationTitleLbl: UILabel!
	@IBOutlet weak var messgaeLbl: UILabel!
	@IBOutlet weak var readMoreLbl: UILabel!
	@IBOutlet weak var messageDateLbl: UILabel!
	
	@IBOutlet weak var statusimage: UIImageView!
	
	var imageURL: URL?
	weak var delegate : NotificationHistoryDelegate?
	override func awakeFromNib() {
		super.awakeFromNib()
		self.imageDetailsGesture()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	static var identifier = "iOS_CL_Cus_NotificationListTVCell"

	static func nib() -> UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
}

extension iOS_CL_Cus_NotificationListTVCell{
	func imageDetailsGesture(){
		self.notificationImage.isUserInteractionEnabled = true
		let tapgesture = UITapGestureRecognizer(target: self, action: #selector(imageDetails(_ :)))
		tapgesture.numberOfTapsRequired = 1
		self.notificationImage.addGestureRecognizer(tapgesture)
	}


	@objc func imageDetails(_ gesture: UITapGestureRecognizer) {
		if let imageURL{
			self.delegate?.didSelectImageDetails(imageURL: imageURL)
		}
		
	}

}
