//
//  iOS_CL_Cus_RetailerOrderSummaryVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 25/11/24.
//

import UIKit

protocol RetailerOrderviewMoreDelegate{
    func didSelectViewMore(cell: iOS_CL_Cus_RetailerOrderSummaryTVC)
}

class iOS_CL_Cus_RetailerOrderSummaryTVC: UITableViewCell {

    @IBOutlet weak var retailerName: UILabel!
    @IBOutlet weak var invoiceDate: UILabel!
    @IBOutlet weak var outletType: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var invoiceNumber: UILabel!
    @IBOutlet weak var beatLbl: UILabel!
    
    
    var delegate: RetailerOrderviewMoreDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var identifier = "iOS_CL_Cus_RetailerOrderSummaryTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    @IBAction func didTappedViewMore(_ sender: Any) {
        delegate?.didSelectViewMore(cell: self)
    }
    
}
