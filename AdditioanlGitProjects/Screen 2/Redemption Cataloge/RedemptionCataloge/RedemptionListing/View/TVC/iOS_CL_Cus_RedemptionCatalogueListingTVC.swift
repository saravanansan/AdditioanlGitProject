//
//  iOS_CL_Cus_RedemptionCatalogueListingTVCTableViewCell.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 26/11/24.
//

import UIKit

protocol RedemptionCatalogeDelegate{
    func didTappedAddToCartBtn(cell:iOS_CL_Cus_RedemptionCatalogueListingTVC)
    func didTappedAddedToCartBtn(cell:iOS_CL_Cus_RedemptionCatalogueListingTVC)
}

class iOS_CL_Cus_RedemptionCatalogueListingTVC: UITableViewCell {

    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productInfoLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var addToCartBtn: GradientButton!
    @IBOutlet weak var addedToCartBtn: UIButton!
    
    var delegate:RedemptionCatalogeDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    static let identifier = "iOS_CL_Cus_RedemptionCatalogueListingTVC"
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    @IBAction func didTappedAddToCartBtn(_ sender: Any) {
        delegate?.didTappedAddToCartBtn(cell: self)
    }
    
    
    @IBAction func didTappedAddedToCart(_ sender: Any) {
        delegate?.didTappedAddedToCartBtn(cell: self)
    }
}
