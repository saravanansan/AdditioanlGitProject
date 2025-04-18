//
//  iOS_CL_Cus_MyOrdersVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 22/11/24.
//

import UIKit

class iOS_CL_Cus_MyOrdersVC: UIViewController {
    

    @IBOutlet weak var orderListingTV: UITableView!
    @IBOutlet weak var filterHeaderView: GradientView!
    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var fromDateTF: UITextField!
    @IBOutlet weak var toDateTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()
    }

    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTappedFilterHeaderBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedFromDateBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedToDateBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedResetBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedFilterBtn(_ sender: Any) {
        
    }
    
}
extension iOS_CL_Cus_MyOrdersVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "iOS_CL_Cus_MyOrdersTVC", for: indexPath) as? iOS_CL_Cus_MyOrdersTVC else{
            fatalError("Eoor on iOS_CL_Cus_MyOrdersTVC")
        }
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = iOS_CL_Cus_MyOrdersDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}


extension iOS_CL_Cus_MyOrdersVC{
    //MARK: TableviewStup
    private func tableViewSetup(){
        self.orderListingTV.delegate = self
        self.orderListingTV.dataSource = self
        self.orderListingTV.register(iOS_CL_Cus_MyOrdersTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_MyOrdersTVC.identifier)
        self.configuration()
    }
    
    private func configuration(){
        self.filterView.isHidden = true
    }
}

extension iOS_CL_Cus_MyOrdersVC: OrderNowDelegate{
    func viewMore(cell: iOS_CL_Cus_MyOrdersTVC) {
        
    }
}
