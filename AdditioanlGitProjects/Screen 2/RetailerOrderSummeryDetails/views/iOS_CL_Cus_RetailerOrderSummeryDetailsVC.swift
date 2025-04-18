//
//  iOS_CL_Cus_RetailerOrderSummeryDetailsVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 25/11/24.
//

import UIKit

class iOS_CL_Cus_RetailerOrderSummeryDetailsVC: UIViewController {

    @IBOutlet weak var retailerOrderSummaryTV: UITableView!
    @IBOutlet weak var retailerNameLbl: UILabel!
    @IBOutlet weak var invoiceName: UILabel!
    @IBOutlet weak var outletTypeLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var invoiceNumberLbl: UILabel!
    @IBOutlet weak var beatLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    @IBAction func didTappedDownloadInvoiceBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
    }
    
}

extension iOS_CL_Cus_RetailerOrderSummeryDetailsVC{
    private func configuration(){
        self.retailerOrderSummaryTV.delegate = self
        self.retailerOrderSummaryTV.dataSource = self
        self.retailerOrderSummaryTV.register(iOS_CL_Cus_RetailerOrderSummaryDetailsTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_RetailerOrderSummaryDetailsTVC.identifier)
    }
}


extension iOS_CL_Cus_RetailerOrderSummeryDetailsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_RetailerOrderSummaryDetailsTVC.identifier) as? iOS_CL_Cus_RetailerOrderSummaryDetailsTVC
        guard let cell else{
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
