//
//  iOS_CL_Cus_RetailerOrderSummeryVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 23/11/24.
//

import UIKit

class iOS_CL_Cus_RetailerOrderSummeryVC: UIViewController {

    @IBOutlet weak var retatilerOrderSummeryTV: UITableView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var filterByBeatLbl: UILabel!
    @IBOutlet weak var filterByRetailerLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    

    @IBAction func didTappedSearchBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTappedFilterHeaderBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedFromDateFilter(_ sender: Any) {
    }
    
    
    @IBAction func didTappedToDateFilter(_ sender: Any) {
    }
    
    
    @IBAction func didTappedFilterByBeat(_ sender: Any) {
    }
    
    
    @IBAction func didTappedFilterByRetailerBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedResetBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedFilterBtn(_ sender: Any) {
    }
    
    
}

extension iOS_CL_Cus_RetailerOrderSummeryVC{
    //MARK: TableView Setup
    private func configuration(){
        self.retatilerOrderSummeryTV.delegate = self
        self.retatilerOrderSummeryTV.dataSource = self
        self.retatilerOrderSummeryTV.register(iOS_CL_Cus_RetailerOrderSummaryTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_RetailerOrderSummaryTVC.identifier)
    }
    
    
}

extension iOS_CL_Cus_RetailerOrderSummeryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_RetailerOrderSummaryTVC.identifier) as? iOS_CL_Cus_RetailerOrderSummaryTVC else{
            fatalError("Error on iOS_CL_Cus_RetailerOrderSummaryTVC")
        }
        return cell
    }
}
