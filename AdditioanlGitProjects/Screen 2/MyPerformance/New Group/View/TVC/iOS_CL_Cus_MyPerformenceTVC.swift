//
//  iOS_CL_Cus_MyPerformenceTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 29/11/24.
//

import UIKit

class iOS_CL_Cus_MyPerformenceTVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var identifier = "iOS_CL_Cus_MyPerformenceTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
