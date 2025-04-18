//
//  iOS_CL_Cus_Offers_PromotionsVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 25/11/24.
//

import UIKit

class iOS_CL_Cus_Offers_PromotionsVC: UIViewController, OffersAndPromotionsVM_OutputProtocol {

    @IBOutlet weak var offersTV: UITableView!
    
    var viewModel : OfferersAndPromotionsVM_InputProtocol
    
    init(viewModel: OfferersAndPromotionsVM_InputProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableviewConfiguration()
    }
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension iOS_CL_Cus_Offers_PromotionsVC{
    func tableviewConfiguration(){
        self.offersTV.delegate = self
        self.offersTV.dataSource = self
        self.offersTV.register(iOS_CL_Cus_Offers_PromotionsTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_Offers_PromotionsTVC.identifier)
    }
}


extension iOS_CL_Cus_Offers_PromotionsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_Offers_PromotionsTVC.identifier) as? iOS_CL_Cus_Offers_PromotionsTVC
        guard let cell else{
            return UITableViewCell()
        }
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = iOS_CL_Cus_Offers_PromotionsDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
