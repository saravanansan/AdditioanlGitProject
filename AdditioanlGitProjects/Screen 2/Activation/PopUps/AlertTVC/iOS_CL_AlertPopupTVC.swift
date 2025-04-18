//
//  iOS_CL_AlertPopupTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 14/11/24.
//

import UIKit

class iOS_CL_AlertPopupTVC: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "iOS_CL_AlertPopupTVC"
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
