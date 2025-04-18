//
//  iOS_CL_Cus_OrderFulfillmentVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 23/11/24.
//

import UIKit

class iOS_CL_Cus_OrderFulfillmentVC: UIViewController, OrderFulillmentVM_OutputProtocol {

    @IBOutlet weak var totalOrderLbl: UILabel!
    @IBOutlet weak var orderFulfilledLbl: UILabel!
    @IBOutlet weak var pendingOrderLbl: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var orderFulfillmentTV: UITableView!
    @IBOutlet weak var fromDateTF: UITextField!
    @IBOutlet weak var toDateTF: UITextField!
    
    
    var viewModel : OrderFulillmentVM_InputProtocol
    
    init(viewModel: OrderFulillmentVM_InputProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableviewSetup()
    }

    
    @IBAction func searchBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedHeaderFilterBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedFilterBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedResetBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension iOS_CL_Cus_OrderFulfillmentVC{
    func tableviewSetup(){
        self.orderFulfillmentTV.delegate = self
        self.orderFulfillmentTV.dataSource = self
        self.orderFulfillmentTV.register(iOS_CL_Cus_OrderFulfillmentTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_OrderFulfillmentTVC.identifier)
    }
}

extension iOS_CL_Cus_OrderFulfillmentVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_OrderFulfillmentTVC.identifier) as? iOS_CL_Cus_OrderFulfillmentTVC else{
            fatalError("Error in iOS_CL_Cus_OrderFulfillmentTVC")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = iOS_CL_Cus_OrderFulfillmentDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


