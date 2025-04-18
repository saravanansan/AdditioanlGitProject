//
//  OtherChatDetailsCell.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit

class OtherChatDetailsCell: UITableViewCell {

	@IBOutlet weak var queryImage: UIImageView!
	@IBOutlet weak var queryMSGLbl: UILabel!
	@IBOutlet weak var senderNameLbl: UILabel!
	@IBOutlet weak var queryDateTimeLbl: UILabel!
	@IBOutlet weak var queryMsgView : UIView!
	
	
	var imageUrl = ""
	weak var delegate: QueryImageDetailsDelegate?
	var textBackGround_color = UIColor.white.withAlphaComponent(0.1)
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		self.initialConfig()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	

	
	static let identifier = "OtherChatDetailsCell"
	
	static func nib()-> UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
    
}


extension OtherChatDetailsCell{
	private func initialConfig(){
		self.imageGestureConfig()
		self.selectionStyle = .none
		self.queryMsgView.backgroundColor = self.textBackGround_color
		self.queryMSGLbl.textColor = .white
		self.queryMsgView.layer.cornerRadius = 12
		self.queryImage.layer.cornerRadius = 10
		self.queryMsgView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner]
		self.queryMsgView.layer.masksToBounds = false
	}
	
	private func imageGestureConfig(){
		// image details gesture config
		self.queryImage.isUserInteractionEnabled = true
		let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnImage(_ :)))
		tapgesture.numberOfTapsRequired = 1
		self.queryImage.addGestureRecognizer(tapgesture)
	}
	
	
	//MARK: - Tapped Image Details
		@objc func tappedOnImage(_ gesture: UITapGestureRecognizer) {
			guard self.imageUrl != "" else{return}
			self.delegate?.didSelectImageDetails(image: self.imageUrl)
		}
}
