//
//  SenderChatDetailsCell.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit


protocol QueryImageDetailsDelegate: AnyObject{
	func didSelectImageDetails(image: String)
}


class SenderChatDetailsCell: UITableViewCell {

	
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
		initialConfig()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	
	static let identifier = "SenderChatDetailsCell"
	
	static func nib()-> UINib{
		return UINib(nibName: identifier, bundle: nil)
	}
    
}


extension SenderChatDetailsCell{
	
	func initialConfig(){
		/***
		 initial configure
		 */
		self.imageGestureConfig()
  
			self.selectionStyle = .none
			self.queryMsgView.backgroundColor = self.textBackGround_color
			self.queryMSGLbl.textColor = .white
			self.queryMsgView.layer.cornerRadius = 12
			self.queryImage.layer.cornerRadius = 12
			self.queryImage.clipsToBounds = true
			self.queryMsgView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
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
