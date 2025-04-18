//
//  DropdownTVC.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 17/07/24.
//

import UIKit

class DropdownTVC: UITableViewCell {

    @IBOutlet weak var statusNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier = "DropdownTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
