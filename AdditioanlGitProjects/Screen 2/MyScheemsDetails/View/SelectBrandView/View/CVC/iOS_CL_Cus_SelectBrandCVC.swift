//
//  iOS_CL_Cus_SelectBrandCVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import UIKit

class iOS_CL_Cus_SelectBrandCVC: UICollectionViewCell {
    
    @IBOutlet weak var brandImage: UIImageDesignable!
    @IBOutlet weak var brandNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier = "iOS_CL_Cus_SelectBrandCVC"
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }

}
