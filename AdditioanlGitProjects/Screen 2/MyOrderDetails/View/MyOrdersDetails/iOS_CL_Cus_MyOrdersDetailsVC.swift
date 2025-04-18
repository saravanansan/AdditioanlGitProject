//
//  iOS_CL_Cus_MyOrdersDetailsVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 23/11/24.
//

import UIKit

class iOS_CL_Cus_MyOrdersDetailsVC: UIViewController {

    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var orderDateLbl: UILabel!
    @IBOutlet weak var outletTypeLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var memberOrderListingTV: UITableView!
    @IBOutlet weak var finbalTotalAmountLbl: UILabel!
    @IBOutlet weak var statusView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewStup()
    }
    
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension iOS_CL_Cus_MyOrdersDetailsVC: UITableViewDelegate, UITableViewDataSource{
    func tableViewStup(){
        self.memberOrderListingTV.delegate = self
        self.memberOrderListingTV.dataSource = self
        self.memberOrderListingTV.register(iOS_CL_Cus_MyOrderDetailsTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_MyOrderDetailsTVC.identifier)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_MyOrderDetailsTVC.identifier) as? iOS_CL_Cus_MyOrderDetailsTVC else{
            fatalError("Errorr in iOS_CL_Cus_MyOrderDetailsTVC")
        }
        return cell
    }
}


extension iOS_CL_Cus_MyOrdersDetailsVC{
    func configuration(){
        self.statusView.layer.cornerRadius = 10
    }
}
