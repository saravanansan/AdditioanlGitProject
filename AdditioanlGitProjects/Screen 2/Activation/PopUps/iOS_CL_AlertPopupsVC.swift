//
//  iOS_CL_AlertPopupsVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 14/11/24.
//

import UIKit

protocol SelectedDataDelegate{
    func updateselectedName(selectedName: String, selectedID: Int)
}

class iOS_CL_AlertPopupsVC: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var heightOfTV: NSLayoutConstraint!
    @IBOutlet weak var dataListTV: UITableView!
    
    
    
    var delegate: SelectedDataDelegate?
    var dataList = [DropdownDataModels]()
    var selectedStatusID = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalCommit()
    }
    
    private func initalCommit(){
        self.dataListTV.register(iOS_CL_AlertPopupTVC.nib(), forCellReuseIdentifier: iOS_CL_AlertPopupTVC.identifier)
        self.dataListTV.delegate = self
        self.dataListTV.dataSource = self
    }
}



extension iOS_CL_AlertPopupsVC: UITableViewDelegate,UITableViewDataSource{
    
    //MARK: Tableview Delegate method:-
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowNumber = self.dataList.count
        let height = rowNumber * 50
        let maxheight = Int(self.view.frame.height - 160)
        DispatchQueue.main.async {
            height <= maxheight ? (self.heightOfTV.constant = CGFloat(height)) : (self.heightOfTV.constant = CGFloat(maxheight))
        }
        return rowNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_AlertPopupTVC.identifier, for: indexPath) as? iOS_CL_AlertPopupTVC
        guard let cell else{
            fatalError("Tableview cell initialization failed")
        }
        tableView.separatorStyle = .none
        _ = self.dataList[indexPath.row]
        cell.nameLbl.text = self.dataList[indexPath.row].statusName ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.dataList[indexPath.row]
        self.delegate?.updateselectedName(selectedName: data.statusName ?? "", selectedID: data.statusId ?? -1)
        self.dismiss(animated: true)
    }
    
    
}
