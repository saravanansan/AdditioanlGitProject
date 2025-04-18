//
//  iOS_CL_Cus_OrderCarVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import UIKit

class iOS_CL_Cus_OrderCarVC: UIViewController {
    
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var subCategoryLbl: UILabel!
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var brandProductQtyTV: UITableView!
    @IBOutlet weak var cartCountLbl: GradientLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewConfig()
    }
    
    @IBAction func myCartBtn(_ sender: Any) {
        let vc = iOS_CL_Cus_MyCartVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension iOS_CL_Cus_OrderCarVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "iOS_CL_Cus_OrderCartTVC") as? iOS_CL_Cus_OrderCartTVC else{
            fatalError("Error in iOS_CL_Cus_OrderCartTVC")
        }
        return cell
    }
}


extension iOS_CL_Cus_OrderCarVC{
    private func tableViewConfig(){
        self.brandProductQtyTV.register(iOS_CL_Cus_OrderCartTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_OrderCartTVC.identifier)
        self.brandProductQtyTV.delegate = self
        self.brandProductQtyTV.dataSource = self
    }
    
    private func configuration(){
        self.cartCountLbl.layer.cornerRadius = 5
        
    }
}
