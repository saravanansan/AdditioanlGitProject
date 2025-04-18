//
//  iOS_CL_Cus_MyyCartVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 26/11/24.
//

import UIKit

class iOS_CL_Cus_MyCartVC: UIViewController {
    
    @IBOutlet weak var myCartListingTV: UITableView!
    @IBOutlet weak var cartValueLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }

    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTappedSubmitBtn(_ sender: Any) {
    }
}


extension iOS_CL_Cus_MyCartVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_MyCartTVC.identifier, for: indexPath) as? iOS_CL_Cus_MyCartTVC
        guard let cell else{
            return UITableViewCell()
        }
        return cell
    }
}


extension iOS_CL_Cus_MyCartVC{
    func configuration(){
        self.myCartListingTV.delegate = self
        self.myCartListingTV.dataSource = self
        self.myCartListingTV.register(iOS_CL_Cus_MyCartTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_MyCartTVC.identifier)
    }
}
