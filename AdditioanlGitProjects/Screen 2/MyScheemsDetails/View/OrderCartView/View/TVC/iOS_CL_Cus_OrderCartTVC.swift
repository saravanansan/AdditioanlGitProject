//
//  iOS_CL_Cus_OrderCartTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 22/11/24.
//

import UIKit

class iOS_CL_Cus_OrderCartTVC: UITableViewCell {

    
    @IBOutlet weak var colorLbl: UILabel!
    @IBOutlet weak var mRPLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var dpLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    static var identifier = "iOS_CL_Cus_OrderCartTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    
    
    
    
    
    
}
