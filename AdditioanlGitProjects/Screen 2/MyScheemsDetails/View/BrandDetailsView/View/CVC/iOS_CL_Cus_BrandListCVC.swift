//
//  iOS_CL_Cus_BrandListCVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import UIKit

class iOS_CL_Cus_BrandListCVC: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier = "iOS_CL_Cus_BrandListCVC"
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
