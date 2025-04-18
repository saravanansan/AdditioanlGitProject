//
//  iOS_CL_LodgeQueryListVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/09/24.
//

import UIKit

class iOS_CL_LodgeQueryListVC: AppViewController {
	
	@IBOutlet weak var queryListTV: UITableView!
	@IBOutlet weak var filterView: GradientView!
	
	var lodgeQueryListArray : [ObjCustomerAllQueryJsonList] = []
	var nodataFound : NoDataFound?
	var viewModel : LodgeQueryListVM_InputProtocol

	
	var filterData = LodgeQueryFilterModels()
	
	init(viewModel: LodgeQueryListVM_InputProtocol){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.nodataFound = NoDataFound(view: self.queryListTV)
		self.initalConfig()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.lodgeQueryListApi()
	}
	
	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func didSelectCreateQuery(_ sender: UIButton) {
		let viewmodels = VMFactory.shared.createLodgeQuery()
		let vc = iOS_CL_Cus_NewQueryVC(viewModel: viewmodels)
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func didSelectFilterBtn(_ sender: UIButton) {
		let vc = iOS_CL_Cus_LodgeQueryFilterVC()
		vc.modalPresentationStyle = .overFullScreen
		vc.filterData = self.filterData
		vc.delegate = self
		self.navigationController?.present(vc, animated: false)
	}
	
	private func initalConfig(){
		self.filterData.filterStatusList = self.viewModel.filterStatusDataConfig()
		self.filterView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
		self.queryListTV.register(iOS_CL_LodgeQueryListTVC.nib(), forCellReuseIdentifier: iOS_CL_LodgeQueryListTVC.identifier)
		self.queryListTV.delegate = self
		self.queryListTV.dataSource = self
		self.queryListTV.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 100, right: 0)
		
	}
	
}


extension iOS_CL_LodgeQueryListVC: UITableViewDelegate,UITableViewDataSource{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.lodgeQueryListArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_LodgeQueryListTVC.identifier, for: indexPath) as? iOS_CL_LodgeQueryListTVC
		
		guard let cell else {return UITableViewCell()}
		let data = self.lodgeQueryListArray[indexPath.row]
		let query_date = (data.jCreatedDate ?? "-").split(separator: " ")
		var time = ""
		if query_date.count > 2{
			time = "\(query_date[1]) \(query_date[2])"
		}else if query_date.count > 1{
			time = "\(query_date[1])"
		}
		let ticketStatus = data.ticketStatus
		
		cell.refNumberLbl.text = data.customerTicketRefNo ?? "-"
		cell.statusLbl.text = data.ticketStatus ?? "-"
		cell.queryDetailsText.text = data.helpTopic ?? "-"
		cell.dateLbl.text = DateFormat.shared.customDateFormat(date: "\(query_date[0])")
		cell.timeLbl.text = time
		
		if ticketStatus?.uppercased() == "Pending".uppercased() || ticketStatus?.uppercased() == "RE-OPEN"{
			cell.statusViewBackground.backgroundColor = UIColor.systemOrange
		}else if ticketStatus?.uppercased() == "Resolved".uppercased() || ticketStatus?.uppercased() == "Resolved-Follow up".uppercased(){
			cell.statusViewBackground.backgroundColor = UIColor.systemGreen
		}else if ticketStatus?.uppercased() == "Closed".uppercased(){
			cell.statusViewBackground.backgroundColor = UIColor.systemRed
		}else{
			cell.statusViewBackground.backgroundColor = UIColor.systemRed
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let data = self.lodgeQueryListArray[indexPath.row]
		let viewModels = VMFactory.shared.lodgeQueryDetails()
		let vc = iOS_CL_Cus_QueryChatDetailsVC(viewModel: viewModels)
		vc.lodgeQueryDetails = data
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if indexPath.row == (self.lodgeQueryListArray.count - 1) && self.filterData.noOfElement > 0{
			self.filterData.startIndex += 1
			self.filterData.noOfElement = 0
			self.viewModel.lodgeQueryListApi(statusID: self.filterData.statusID, fromDate: self.filterData.fromDate, toDate: self.filterData.toDate,index: self.filterData.startIndex)
		}
	}
	
	
}



extension iOS_CL_LodgeQueryListVC: LodgeQueryListVM_OutputProtocol{
	func errorMessage(error: String) {
		
	}
	
	func lodgeQueryList(result: LodgeQueryListModels?, error: String?) {
		self.nodataFound?.hideNoDataFound()
		
		if let list = result?.objCustomerAllQueryJsonList{
			self.lodgeQueryListArray += list
			self.filterData.noOfElement = list.count
		}
		
		if self.lodgeQueryListArray.count == 0{
			self.nodataFound?.showNoDataFound()
		}
		
		self.queryListTV.reloadData()
	}
	
	
}

extension iOS_CL_LodgeQueryListVC: LodgeQueryFilterDelegate{
	func didSelectFilter(filterData: LodgeQueryFilterModels) {
		self.filterData = filterData
		self.lodgeQueryListApi()
	}
	
	private func lodgeQueryListApi(){
		self.lodgeQueryListArray.removeAll()
		self.filterData.startIndex = 1
		self.filterData.noOfElement = 0
		self.viewModel.lodgeQueryListApi(statusID: self.filterData.statusID, fromDate: self.filterData.fromDate, toDate: self.filterData.toDate, index: self.filterData.startIndex)
	}
}

