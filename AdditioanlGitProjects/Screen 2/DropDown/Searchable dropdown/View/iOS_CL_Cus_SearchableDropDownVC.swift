//
//  iOS_CL_Cus_SearchableDropDownVC.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 17/07/24.
//

import UIKit

protocol SearchableDropDownDelegate{
    func selectedDropdownData(statusName: String?,statusId: Int?)
}

class iOS_CL_Cus_SearchableDropDownVC: UIViewController {

    @IBOutlet weak var closeBtnView: UIView!
    @IBOutlet weak var noDataFoundLbl: UILabel!
    @IBOutlet weak var headerNameLbl: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dropDownTV: UITableView!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var tableViewheight: NSLayoutConstraint!
    
    
    var dropdownDataArray = [DropdownDataModels]()
    var tempArray = [DropdownDataModels]()
    var delegate: SearchableDropDownDelegate?
    var SearchaBarIsHidden = true
    var headerNameIsHidden = true
    var closeBtnIshidden = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageConfigure()
    }
    
    @IBAction func didTappedCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view == self.view{
            dismiss(animated: true)
        }
    }
    
    func pageConfigure(){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.tempArray = self.dropdownDataArray
            self.searchBar.isHidden = self.SearchaBarIsHidden
            self.headerNameLbl.isHidden = self.headerNameIsHidden
            self.closeBtnView.isHidden = self.closeBtnIshidden
            self.noDataFoundLbl.isHidden = true
            dropDownTV.register(DropdownTVC.nib(), forCellReuseIdentifier: DropdownTVC.identifier)
            dropDownTV.delegate = self
            dropDownTV.dataSource = self
            self.searchBar.delegate = self
            
            if self.dropdownDataArray.count > 0 {
                let height = dropdownDataArray.count * 40
				let maxheight = Int(self.view.frame.height - 300)
                height > maxheight ? (self.tableViewheight.constant =  CGFloat(maxheight)) : (self.tableViewheight.constant =  CGFloat(height))
                self.noDataFoundLbl.isHidden = true
            }else{
                self.tableViewheight.constant = CGFloat(0)
                self.noDataFoundLbl.isHidden = false
            }
            self.dropDownTV.reloadData()
        }
    }
}


extension iOS_CL_Cus_SearchableDropDownVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DropdownTVC.identifier, for: indexPath) as? DropdownTVC
        guard let cell = cell else{
            fatalError("Cell initialize failed")
        }
        cell.selectionStyle = .none
        cell.statusNameLbl.text = self.dropdownDataArray[indexPath.row].statusName ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = self.dropdownDataArray[indexPath.row]
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.delegate?.selectedDropdownData(statusName: selectedData.statusName, statusId: selectedData.statusId)
            self.dismiss(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

// MARK: - Searchbar Delegate
extension iOS_CL_Cus_SearchableDropDownVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard self.tempArray.count > 0 else {return}
        let filterArray = self.tempArray.filter{ ($0.statusName!.localizedCaseInsensitiveContains(searchBar.text!))}
        if self.searchBar.text != ""{
            self.dropdownDataArray.removeAll(keepingCapacity: true)
            self.dropdownDataArray = filterArray
            self.dropDownTV.reloadData()
        }else{
            self.dropdownDataArray = self.tempArray
            self.dropDownTV.reloadData()
        }
    }
  
}
