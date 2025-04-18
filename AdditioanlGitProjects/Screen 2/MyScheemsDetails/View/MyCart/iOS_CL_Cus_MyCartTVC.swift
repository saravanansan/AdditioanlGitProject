//
//  iOS_CL_Cus_MyCartTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 26/11/24.
//

import UIKit

protocol myCartDelegate{
    func didTappedMinus(cell:iOS_CL_Cus_MyCartTVC)
    func didTappedPluse(cell:iOS_CL_Cus_MyCartTVC)
}

class iOS_CL_Cus_MyCartTVC: UITableViewCell {
    
    @IBOutlet weak var myCartImage: UIImageView!
    @IBOutlet weak var totalPointsLbl: UILabel!
    @IBOutlet weak var cartProductCountLbl: UILabel!
    
    var delegate: myCartDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var identifier = "iOS_CL_Cus_MyCartTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBAction func didTappedMinusBtn(_ sender: Any) {
        delegate?.didTappedMinus(cell: self)
    }
    
    @IBAction func didTappedPluseBtn(_ sender: Any) {
        delegate?.didTappedPluse(cell: self)
    }
    
    
}
