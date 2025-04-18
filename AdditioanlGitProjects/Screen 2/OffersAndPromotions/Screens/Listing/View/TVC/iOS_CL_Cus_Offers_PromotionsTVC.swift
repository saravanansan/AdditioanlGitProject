//
//  iOS_CL_Cus_Offers_PromotionsTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 25/11/24.
//

import UIKit
protocol viewDelegate{
    func didSelectView(cell: iOS_CL_Cus_Offers_PromotionsTVC)
}

class iOS_CL_Cus_Offers_PromotionsTVC: UITableViewCell {

    @IBOutlet weak var offersImage: UIImageView!
    @IBOutlet weak var offersNameText: UILabel!
    @IBOutlet weak var buttonView: UIView!
    
    var delegate: viewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    static let identifier = "iOS_CL_Cus_Offers_PromotionsTVC"
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    @IBAction func didTppedViewButton(_ sender: Any) {
        self.delegate?.didSelectView(cell: self)
    }
}
