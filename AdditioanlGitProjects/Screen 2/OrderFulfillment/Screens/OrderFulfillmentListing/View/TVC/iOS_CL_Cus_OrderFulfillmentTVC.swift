//
//  iOS_CL_Cus_OrderFulfillmentTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 23/11/24.
//

import UIKit

protocol OrderFulfillmentDelegate {
    func viewMore(cell: iOS_CL_Cus_OrderFulfillmentTVC)
}


class iOS_CL_Cus_OrderFulfillmentTVC: UITableViewCell {

    @IBOutlet weak var retailerNameLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var orderDateLbl: UILabel!
    @IBOutlet weak var orderTypeLbl: UILabel!
    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var beatLbl: UILabel!
    
    var delegate:OrderFulfillmentDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    static var identifier = "iOS_CL_Cus_OrderFulfillmentTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBAction func didTappedViewMore(_ sender: Any) {
        self.delegate?.viewMore(cell: self)
    }
}
