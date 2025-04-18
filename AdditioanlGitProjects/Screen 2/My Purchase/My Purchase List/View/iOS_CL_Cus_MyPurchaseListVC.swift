//
//  iOS_CL_Cus_MyPurchaseListVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 22/10/24.
//

import UIKit

class iOS_CL_Cus_MyPurchaseListVC: AppViewController {

	@IBOutlet weak var searchTF: UITextField!
	@IBOutlet weak var purchaseListTV: UITableView!
	@IBOutlet weak var filterView: GradientView!
	
	var myPurchaseList = [LstInvoiceListings]()
	var filterData = MyPurchaseFilterModels()
	var noDatafound : NoDataFound?
	
	var viewModel: MyPurchaseListVM_InputProtocol
	init(viewModel: MyPurchaseListVM_InputProtocol){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.noDatafound = NoDataFound(view: self.purchaseListTV)
		self.tableViewSetup()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.myPurchaseListApi()
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		self.filterView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
	}
	
	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func didSelectSearchBtn(_ sender: GradientButton) {
		self.myPurchaseListApi()
	}
	
	@IBAction func didSelectFilterBtn(_ sender: UIButton) {
		let view = iOS_CL_Cus_PurchaseListFilterVC()
		view.modalTransitionStyle = .crossDissolve
		view.modalPresentationStyle = .overFullScreen
		view.filterData = self.filterData
		view.delegate = self
		self.present(view, animated: true)
	}
	
	
}


extension iOS_CL_Cus_MyPurchaseListVC: UITableViewDelegate,UITableViewDataSource{
	
	private func tableViewSetup(){
		self.purchaseListTV.register(iOS_CL_Cus_PurchaseListTVCell.nib(), forCellReuseIdentifier: iOS_CL_Cus_PurchaseListTVCell.identifier)
		self.purchaseListTV.delegate = self
		self.purchaseListTV.dataSource = self
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.myPurchaseList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_PurchaseListTVCell.identifier, for: indexPath) as? iOS_CL_Cus_PurchaseListTVCell
		guard let cell else{
			return UITableViewCell()
		}
		let data =  myPurchaseList[indexPath.row]
		cell.cpNameLbl.text = data.locationCode ?? "-"
		cell.invDateLbl.text = data.invoiceDate ?? "-"
		cell.orderNumberLbl.text = data.orderNo ?? "-"
		cell.invoiceNumberLbl.text = data.invoiceNo ?? "-"
		cell.pointsLbl.text = "\(data.points ?? 0)"
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedData = self.myPurchaseList[indexPath.row]
		let viewModel = VMFactory.shared.purchaseDetailsVM()
		let view = iOS_CL_Cus_PurchaseDetailsVC(viewModel: viewModel)
		view.myPurchaseDetailsData = selectedData
		self.navigationController?.pushViewController(view, animated: true)
	}
	
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if indexPath.row == (self.myPurchaseList.count - 1) && self.filterData.noOfElement > 0{
			self.filterData.startIndex += 1
			self.filterData.noOfElement = 0
			let searchText = self.searchTF.text ?? ""
			self.viewModel.myPurchaseListApi(searchText: searchText)
		}
	}
	
}

extension iOS_CL_Cus_MyPurchaseListVC: MyPurchaseListVM_OutputProtocol{
	func MypurchaseListResponse(result: [LstInvoiceListings]) {
		self.myPurchaseList += result
		self.filterData.noOfElement = result.count
		if self.myPurchaseList.count > 0{
			self.noDatafound?.hideNoDataFound()
		}else{
			self.noDatafound?.showNoDataFound()
		}
		self.purchaseListTV.reloadData()
	}
	
	
}

extension iOS_CL_Cus_MyPurchaseListVC: MyPuchaseListFilterDelegate{
	func didSelectFilter(filterData: MyPurchaseFilterModels) {
		self.filterData = filterData
		self.myPurchaseListApi()
	}
	
	private func myPurchaseListApi(){
		self.myPurchaseList.removeAll()
		self.filterData.startIndex = 1
		self.filterData.noOfElement = 0
		let searchText = self.searchTF.text ?? ""
		self.viewModel.myPurchaseListApi(searchText: searchText)
	}
}
