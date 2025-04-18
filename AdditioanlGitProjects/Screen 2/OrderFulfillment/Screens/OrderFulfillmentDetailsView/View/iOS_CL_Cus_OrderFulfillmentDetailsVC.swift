//
//  iOS_CL_Cus_OrderFulfillmentDetailsVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 23/11/24.
//

import UIKit

class iOS_CL_Cus_OrderFulfillmentDetailsVC: UIViewController {
    
    @IBOutlet weak var retailerNameLbl: UILabel!
    @IBOutlet weak var orderDqateLbl: UILabel!
    @IBOutlet weak var outletTypeLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var beatLbl: UILabel!
    @IBOutlet weak var orderFulfillmentTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableviewSetup()
    }

    
    @IBAction func didTppedSubmitBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTpppedDropDownbtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension iOS_CL_Cus_OrderFulfillmentDetailsVC{
   private func tableviewSetup(){
       self.orderFulfillmentTV.delegate = self
       self.orderFulfillmentTV.dataSource = self
       self.orderFulfillmentTV.register(iOS_CL_Cus_OrderFulfilmentDetailasTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_OrderFulfilmentDetailasTVC.identifier)
    }
    
    private func configuration(){
    }
}

extension iOS_CL_Cus_OrderFulfillmentDetailsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_OrderFulfilmentDetailasTVC.identifier) as? iOS_CL_Cus_OrderFulfilmentDetailasTVC else{
            fatalError("Erron on iOS_CL_Cus_OrderFulfilmentDetailasTVC")
        }
        return cell
    }
}
