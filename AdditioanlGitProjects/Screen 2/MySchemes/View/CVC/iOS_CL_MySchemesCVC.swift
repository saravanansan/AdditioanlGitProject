//
//  iOS_CL_MySchemesCVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import UIKit

class iOS_CL_MySchemesCVC: UICollectionViewCell {
    
    @IBOutlet weak var schemeIV: UIImageDesignable!
    @IBOutlet weak var schemeNameLbl: UILabel!
    @IBOutlet weak var validFromLbl: UILabel!
    @IBOutlet weak var validToLbl: UILabel!
    @IBOutlet weak var scheemview: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scheemview.layer.cornerRadius = 10
    }
    static let identifier = "iOS_CL_MySchemesCVC"
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }

}
