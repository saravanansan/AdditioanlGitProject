//
//  iOS_CL_Cus_RedemptionCatalogueListingVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 26/11/24.
//

import UIKit

class iOS_CL_Cus_RedemptionCatalogueListingVC: UIViewController {

    @IBOutlet weak var redemptionCatalogeTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()
    }

    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTappedMyCartBtn(_ sender: Any) {
        let vc = iOS_CL_Cus_RedemptionCatalogeMyCartVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension iOS_CL_Cus_RedemptionCatalogueListingVC{
    private func configuration(){
        
    }
    
    private func tableViewSetup(){
        self.redemptionCatalogeTV.delegate = self
        self.redemptionCatalogeTV.dataSource = self
        self.redemptionCatalogeTV.register(iOS_CL_Cus_RedemptionCatalogueListingTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_RedemptionCatalogueListingTVC.identifier)
    }
}

extension iOS_CL_Cus_RedemptionCatalogueListingVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_RedemptionCatalogueListingTVC.identifier, for: indexPath) as? iOS_CL_Cus_RedemptionCatalogueListingTVC
        guard let cell else{
            fatalError("Error in iOS_CL_Cus_RedemptionCatalogueListingTVC")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = iOS_CL_Cus_RedemptionCatalogeDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
