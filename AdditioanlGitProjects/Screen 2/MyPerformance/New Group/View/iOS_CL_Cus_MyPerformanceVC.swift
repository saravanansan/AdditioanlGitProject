//
//  iOS_CL_Cus_MyPerformanceVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 29/11/24.
//

import UIKit
import Charts

class iOS_CL_Cus_MyPerformanceVC: UIViewController, MyPerformanceVM_OutputProtocol {

    @IBOutlet weak var welcomeNameLbl: UILabel!
    @IBOutlet weak var membershipIDLbl: UILabel!
    @IBOutlet weak var eligiblePointsLbl: UILabel!
    @IBOutlet weak var tierLbl: UILabel!
    @IBOutlet weak var myPerformanceTV: UITableView!
    @IBOutlet weak var mySalesSummaryView: UIViewDesignable!
    @IBOutlet weak var myRewardsSummaryView: UIViewDesignable!
    
    var viewModel : MyPerformanceVM_InputProtocol
    
    init(viewModel: MyPerformanceVM_InputProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewConfiguration()
    }

    
    @IBAction func didTappedMySalesSummeryBtn(_ sender: Any) {
        mySalesSummaryView.isHidden = false
        myRewardsSummaryView.isHidden = true
        
    }
    
    
    @IBAction func didTappedMyRewardSummaryBtn(_ sender: Any) {
        mySalesSummaryView.isHidden = true
        myRewardsSummaryView.isHidden = false
    }
    
    
    @IBAction func didTappedOrderSummaryBtn(_ sender: Any) {
//        let vc = iOS_CL_Cus_MyPerformanceVC()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}

extension iOS_CL_Cus_MyPerformanceVC{
    private func configuration(){
        
    }
    
    
    private func tableViewConfiguration(){
        myPerformanceTV.delegate = self
        myPerformanceTV.dataSource = self
        myPerformanceTV.register(iOS_CL_Cus_MyPerformenceTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_MyPerformenceTVC.identifier)
    }
    
}


extension iOS_CL_Cus_MyPerformanceVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_MyPerformenceTVC.identifier, for: indexPath) as? iOS_CL_Cus_MyPerformenceTVC
        guard let cell else{
            fatalError("Error in iOS_CL_Cus_MyPerformenceTVC")
        }
        return cell
    }
}
