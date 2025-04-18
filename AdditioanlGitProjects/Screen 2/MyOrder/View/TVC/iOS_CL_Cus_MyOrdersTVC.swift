//
//  iOS_CL_Cus_MyOrdersTVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 22/11/24.
//

import UIKit

protocol OrderNowDelegate{
    func viewMore(cell: iOS_CL_Cus_MyOrdersTVC)
}

class iOS_CL_Cus_MyOrdersTVC: UITableViewCell {
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var orderDateLbl: UILabel!
    @IBOutlet weak var outletTypeLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var orderNumberLbl: UILabel!
    
    var delegate: OrderNowDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.statusView.layer.cornerRadius = 10
    }
    
    static var identifier = "iOS_CL_Cus_MyOrdersTVC"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didTappedviewMoreBtn(_ sender: Any) {
        self.delegate?.viewMore(cell: self)
    }
}
