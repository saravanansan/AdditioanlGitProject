//
//  iOS_CL_Cus_MyRedemptionVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 25/11/24.
//

import UIKit

class iOS_CL_Cus_MyRedemptionVC: UIViewController {
    @IBOutlet weak var myRedemptionTV: UITableView!
    @IBOutlet weak var fromDateTF: UITextField!
    @IBOutlet weak var toDateTF: UITextField!
    @IBOutlet weak var filterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableviewSetUp()
    }
    
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTappedFilterHeaderBtn(_ sender: Any) {
        self.filterView.isHidden = false
    }
    
    
    @IBAction func didTappedFromDate(_ sender: Any) {
    }
    
    
    @IBAction func didTappedToDate(_ sender: Any) {
    }
    
    
    @IBAction func didTappedSelectStatus(_ sender: Any) {
    }
    
    
    @IBAction func didTappedFilterButton(_ sender: Any) {
    }
    
    
    @IBAction func didTappedResetBtn(_ sender: Any) {
    }
    
    
}



extension iOS_CL_Cus_MyRedemptionVC{
    private func tableviewSetUp(){
        self.myRedemptionTV.delegate = self
        self.myRedemptionTV.dataSource = self
        self.myRedemptionTV.register(iOS_CL_Cus_MyRedemptionTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_MyRedemptionTVC.identifier)
        self.myRedemptionTV.separatorStyle = .none
        self.configuration()
    }
    private func configuration(){
        self.filterView.isHidden = true
    }
}


extension iOS_CL_Cus_MyRedemptionVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iOS_CL_Cus_MyRedemptionTVC", for: indexPath) as? iOS_CL_Cus_MyRedemptionTVC
        
        guard let cell else{
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        return cell
    }
}
