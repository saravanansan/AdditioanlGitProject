//
//  iOS_CL_Cus_RedemptionCatalogeMyCartVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 26/11/24.
//

import UIKit

class iOS_CL_Cus_RedemptionCatalogeMyCartVC: UIViewController {

    @IBOutlet weak var myCartTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }

    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension iOS_CL_Cus_RedemptionCatalogeMyCartVC{
    private func configuration(){
        self.myCartTV.delegate = self
        self.myCartTV.dataSource = self
        self.myCartTV.register(iOS_CL_Cus_RedemptionCatalogeMyCartTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_RedemptionCatalogeMyCartTVC.identifire)
    }
}

extension iOS_CL_Cus_RedemptionCatalogeMyCartVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_RedemptionCatalogeMyCartTVC.identifire, for: indexPath) as? iOS_CL_Cus_RedemptionCatalogeMyCartTVC
        guard let cell else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
