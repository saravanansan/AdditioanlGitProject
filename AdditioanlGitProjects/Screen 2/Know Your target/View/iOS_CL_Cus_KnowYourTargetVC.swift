//
//  iOS_CL_Cus_KnowYourTargetVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit
import MotionToastView

class iOS_CL_Cus_KnowYourTargetVC: AppViewController {

	
	@IBOutlet weak var BrandQtr1TVHieght: NSLayoutConstraint!
	
	
	
	//Annual Target
	@IBOutlet weak var annualTargetContainer: UIViewDesignable!
	@IBOutlet weak var annualTargetArrowImage: UIImageView!
	@IBOutlet weak var annualTargetMsgLbl: UILabel!
	@IBOutlet weak var annualTargetProgressbar: CustomeProgressBar!
	@IBOutlet weak var AT_StartDateLbl: UILabel!
	@IBOutlet weak var AT_EndDateLbl: UILabel!
	@IBOutlet weak var annualTargetDetailsView: UIViewDesignable!
	
	// Quarterly Target
	@IBOutlet weak var QuarterlyTargetContainer: UIViewDesignable!
	@IBOutlet weak var quarterlyDetailsSV: UIStackView!
	@IBOutlet weak var quarterlyTargetArrowImage: UIImageView!
	@IBOutlet weak var QT_qtr1LockScreen: UIView!
	@IBOutlet weak var QT_qtr1_DateLbl: UILabel!
	@IBOutlet weak var QT_qtr1_AchivePtsLbl: UILabel!
	@IBOutlet weak var QT_qtr1_TargetPtsLbl: UILabel!
	@IBOutlet weak var QT_qtr1_percentageLbl: UILabel!
	@IBOutlet weak var QT_qtr1_ProgressBar: CustomeProgressBar!
	
	@IBOutlet weak var QT_qtr2LockScreen: UIView!
	@IBOutlet weak var QT_qtr2_DateLbl: UILabel!
	@IBOutlet weak var QT_qtr2_AchivePtsLbl: UILabel!
	@IBOutlet weak var QT_qtr2_TargetPtsLbl: UILabel!
	@IBOutlet weak var QT_qtr2_percentageLbl: UILabel!
	@IBOutlet weak var QT_qtr2_ProgressBar: CustomeProgressBar!
	
	@IBOutlet weak var QT_qtr3LockScreen: UIView!
	@IBOutlet weak var QT_qtr3_DateLbl: UILabel!
	@IBOutlet weak var QT_qtr3_AchivePtsLbl: UILabel!
	@IBOutlet weak var QT_qtr3_TargetPtsLbl: UILabel!
	@IBOutlet weak var QT_qtr3_percentageLbl: UILabel!
	@IBOutlet weak var QT_qtr3_ProgressBar: CustomeProgressBar!
	
	@IBOutlet weak var QT_qtr4LockScreen: UIView!
	@IBOutlet weak var QT_qtr4_DateLbl: UILabel!
	@IBOutlet weak var QT_qtr4_AchivePtsLbl: UILabel!
	@IBOutlet weak var QT_qtr4_TargetPtsLbl: UILabel!
	@IBOutlet weak var QT_qtr4_percentageLbl: UILabel!
	@IBOutlet weak var QT_qtr4_ProgressBar: CustomeProgressBar!
	
	// Brand Wise Target
	@IBOutlet weak var brandWiseTargetContainerView: UIViewDesignable!
	
	@IBOutlet weak var brandWiseTargetArrowImage: UIImageView!
	@IBOutlet weak var brandWiseDetailsSV: UIStackView!
	@IBOutlet weak var BD_Qtr1TV: UITableView!
	@IBOutlet weak var BD_Qtr1_NoDatafoundLbl: UILabel!
	
	@IBOutlet weak var BD_Qtr2TV: UITableView!
	@IBOutlet weak var BD_Qtr2TVHeight: NSLayoutConstraint!
	@IBOutlet weak var BD_Qtr2_NoDatafoundLbl: UILabel!
	
	
	@IBOutlet weak var BD_Qtr3TV: UITableView!
	@IBOutlet weak var BD_Qtr3TVHeight: NSLayoutConstraint!
	@IBOutlet weak var BD_Qtr3_NoDatafoundLbl: UILabel!
	
	
	@IBOutlet weak var BD_Qtr4TV: UITableView!
	@IBOutlet weak var BD_Qtr4TVHeight: NSLayoutConstraint!
	@IBOutlet weak var BD_Qtr4_NoDatafoundLbl: UILabel!
	
	// Monthly Target
	@IBOutlet weak var MonthlyTargetTV: UITableView!
	@IBOutlet weak var monthlyTargetContainer: UIViewDesignable!
	
	
	var knowYourTargetDetails: KnowYourTargetModels?
	
	var lstBrandQuater1 = [LstBrandQuater]()
	var lstBrandQuater2 = [LstBrandQuater]()
	var lstBrandQuater3 = [LstBrandQuater]()
	var lstBrandQuater4 = [LstBrandQuater]()
	var monthlyTargetList : [MonthlyTargetModels] = []
	
	var viewModel: KnowYourTargetVM_InputProtocol
	init(viewModel: KnowYourTargetVM_InputProtocol){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.monthlyTargetConf(data: nil)
		self.quarterlyTargetLock()
		self.initialCommits()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.viewModel.knowYourTarget()
	}
	
	@IBAction func didSelectBack(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	private func initialCommits(){
		self.BD_Qtr1TV.register(BrandTargetTVCell.nib(), forCellReuseIdentifier: BrandTargetTVCell.identifier)
		
		self.BD_Qtr1TV.delegate = self
		self.BD_Qtr1TV.dataSource = self
		
		self.BD_Qtr2TV.register(BrandTargetTVCell.nib(), forCellReuseIdentifier: BrandTargetTVCell.identifier)
		
		self.BD_Qtr2TV.delegate = self
		self.BD_Qtr2TV.dataSource = self
		
		self.BD_Qtr3TV.register(BrandTargetTVCell.nib(), forCellReuseIdentifier: BrandTargetTVCell.identifier)
		
		self.BD_Qtr3TV.delegate = self
		self.BD_Qtr3TV.dataSource = self
		
		self.BD_Qtr4TV.register(BrandTargetTVCell.nib(), forCellReuseIdentifier: BrandTargetTVCell.identifier)
		
		self.BD_Qtr4TV.delegate = self
		self.BD_Qtr4TV.dataSource = self
		
		self.MonthlyTargetTV.register(iOS_CL_MonthlyTargetTVCell.nib(), forCellReuseIdentifier: iOS_CL_MonthlyTargetTVCell.identifier)
		self.MonthlyTargetTV.delegate = self
		self.MonthlyTargetTV.dataSource = self
		
	}
	
	@IBAction func didSelectAnnualTarget(_ sender: UIButton) {
		UIView.animate(withDuration: 0.6) {
			if self.annualTargetDetailsView.isHidden{
				self.annualTargetContainer.borderWidth = 1
				self.annualTargetArrowImage.transform = CGAffineTransform(rotationAngle: .pi)
			}else{
				self.annualTargetContainer.borderWidth = 0
				self.annualTargetArrowImage.transform = CGAffineTransform(rotationAngle: .zero)
			}
			self.annualTargetDetailsView.isHidden = !self.annualTargetDetailsView.isHidden
			
		}
	}
	
	@IBAction func didSelectQuartelyTarget(_ sender: UIButton) {
		UIView.animate(withDuration: 0.6) {
			if self.quarterlyDetailsSV.isHidden{
				self.QuarterlyTargetContainer.borderWidth = 1
				self.quarterlyTargetArrowImage.transform = CGAffineTransform(rotationAngle: .pi)
			}else{
				self.QuarterlyTargetContainer.borderWidth = 0
				self.quarterlyTargetArrowImage.transform = CGAffineTransform(rotationAngle: .zero)
			}
			self.quarterlyDetailsSV.isHidden = !self.quarterlyDetailsSV.isHidden
		}
	}
	
	@IBAction func didSelectBrandWiseTarget(_ sender: UIButton) {
		UIView.animate(withDuration: 0.6) {
			if self.brandWiseDetailsSV.isHidden{
				self.brandWiseTargetContainerView.borderWidth = 1
				self.brandWiseTargetArrowImage.transform = CGAffineTransform(rotationAngle: .pi)
			}else{
				self.brandWiseTargetContainerView.borderWidth = 0
				self.brandWiseTargetArrowImage.transform = CGAffineTransform(rotationAngle: .zero)
			}
			self.brandWiseDetailsSV.isHidden = !self.brandWiseDetailsSV.isHidden
		}
	}
	
	@IBAction func didSelectBD_Qtr1(_ sender: UIButton) {
		self.BD_Qtr1TV.reloadData()
		UIView.animate(withDuration: 0.6) {
			self.BD_Qtr1TV.isHidden = !self.BD_Qtr1TV.isHidden
			self.BD_Qtr1_NoDatafoundLbl.isHidden = !(!self.BD_Qtr1TV.isHidden && self.lstBrandQuater1.count == 0)
		}
	}
	
	@IBAction func didSelect_BD_Qtr2(_ sender: UIButton) {
		self.BD_Qtr2TV.reloadData()
		UIView.animate(withDuration: 0.6) {
			self.BD_Qtr2TV.isHidden = !self.BD_Qtr2TV.isHidden
			self.BD_Qtr2_NoDatafoundLbl.isHidden = !(!self.BD_Qtr2TV.isHidden && self.lstBrandQuater2.count == 0)
		}
	}
	
	@IBAction func didSelect_BD_Qtr3(_ sender: UIButton) {
		self.BD_Qtr3TV.reloadData()
		UIView.animate(withDuration: 0.6) {
			self.BD_Qtr3TV.isHidden = !self.BD_Qtr3TV.isHidden
			self.BD_Qtr3_NoDatafoundLbl.isHidden = !(!self.BD_Qtr3TV.isHidden && self.lstBrandQuater3.count == 0)
		}
	}
	
	@IBAction func didSelect_BD_Qtr4(_ sender: UIButton) {
		self.BD_Qtr4TV.reloadData()
		UIView.animate(withDuration: 0.6) {
			self.BD_Qtr4TV.isHidden = !self.BD_Qtr4TV.isHidden
			self.BD_Qtr4_NoDatafoundLbl.isHidden = !(!self.BD_Qtr4TV.isHidden && self.lstBrandQuater4.count == 0)
		}
	}
	
	@IBAction func didSelect_Monthly_Target(_ sender: UIButton) {
		UIView.animate(withDuration: 0.6) {
			self.MonthlyTargetTV.isHidden = !self.MonthlyTargetTV.isHidden
			self.MonthlyTargetTV.reloadData()
		}
	}
	
}

//MARK: - Tableview Delegate
extension iOS_CL_Cus_KnowYourTargetVC: UITableViewDelegate,UITableViewDataSource{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if tableView == self.BD_Qtr1TV{
			//brand wise quater 1
			let height = 90 * self.lstBrandQuater1.count
			height > 360 ? (BrandQtr1TVHieght.constant = 340) : (BrandQtr1TVHieght.constant = CGFloat(height))
			return self.lstBrandQuater1.count
		}else if tableView == self.BD_Qtr2TV{
			//brand wise quater 2
			let height = 90 * self.lstBrandQuater2.count
			height > 360 ? (BD_Qtr2TVHeight.constant = 340) : (BD_Qtr2TVHeight.constant = CGFloat(height))
			return self.lstBrandQuater2.count
		}else if tableView == self.BD_Qtr3TV{
			//brand wise quater 3
			let height = 90 * self.lstBrandQuater3.count
			height > 360 ? (BD_Qtr3TVHeight.constant = 340) : (BD_Qtr3TVHeight.constant = CGFloat(height))
			return self.lstBrandQuater3.count
		}else if tableView == self.BD_Qtr4TV{
			//brand wise quater 4
			let height = 90 * self.lstBrandQuater4.count
			height > 360 ? (BD_Qtr4TVHeight.constant = 340) : (BD_Qtr4TVHeight.constant = CGFloat(height))
			return self.lstBrandQuater4.count
		}else if tableView == self.MonthlyTargetTV{
			return self.monthlyTargetList.count
		}else{
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if tableView == self.BD_Qtr1TV{
			//brand wise quater 1
			return brandWiseQtr1TVCellForAt(tableView: tableView, indexPath: indexPath)
		}else if tableView == self.BD_Qtr2TV{
			//brand wise quater 2
			return brandWiseQtr2TVCellForAt(tableView: tableView, indexPath: indexPath)
		}else if tableView == self.BD_Qtr3TV{
			//brand wise quater 3
			return brandWiseQtr3TVCellForAt(tableView: tableView, indexPath: indexPath)
		}else if tableView == self.BD_Qtr4TV{
			//brand wise quater 4
			return brandWiseQtr4TVCellForAt(tableView: tableView, indexPath: indexPath)
		}else if tableView == self.MonthlyTargetTV{
			//Monthly Target
			return monthlyTargetTVCellForAt(tableView: tableView, indexPath: indexPath)
		}else{
			return UITableViewCell()
		}
		
		
	}
	

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 90
	}
	
}


//MARK: - View Models Output
extension iOS_CL_Cus_KnowYourTargetVC: KnowYourTargetVM_OutputProtocol{
	func knowTargetDetails(result: KnowYourTargetModels?) {
		if (result?.lstAnnualCustomerTargetDetails?.count ?? 0) > 0,let annualTarget = result?.lstAnnualCustomerTargetDetails?[0] {
			self.annualTargetConfig(annualTarget: annualTarget)
		}
		
		if (result?.lstQuaterlyBaseTargetDetails?.count ?? 0) > 0,let quarterlyTarget = result?.lstQuaterlyBaseTargetDetails?[0] {
			self.quarterlyTargetConfig(data: quarterlyTarget)
		}

		if (result?.lstBrandQuaterlyBaseTargetDetails?.count ?? 0) > 0,let bransWiseTarget = result?.lstBrandQuaterlyBaseTargetDetails?[0] {
			self.brandwiseTargetConfig(data: bransWiseTarget)
		}
		
		if (result?.lstCustomerMonthlyTargets?.count ?? 0) > 0,let monthlyTarget = result?.lstCustomerMonthlyTargets?[0]{
			self.monthlyTargetConf(data: monthlyTarget)
		}
	}
	
	func errorMessage(error: String) {
		self.MotionToast(message: error, toastType: .error)
	}
}


//	MARK: - Annual Traget Config
extension iOS_CL_Cus_KnowYourTargetVC{
	private func annualTargetConfig(annualTarget: LstAnnualCustomerTargetDetails){
		let achive = (Double(annualTarget.annualTarget ?? "") ?? 0) * 0.6
		self.AT_StartDateLbl.text = "April \(annualTarget.yearStart ?? "")"
		self.AT_EndDateLbl.text = "March \(annualTarget.yearEnd ?? "")"
		self.annualTargetProgressbar.pointsValue = annualTarget.consumeTarget ?? "0"
		self.annualTargetProgressbar.progressTrackValue = (Double(annualTarget.consumeTarget ?? "") ?? 0) / (Double(annualTarget.annualTarget ?? "") ?? 1)
		self.annualTargetMsgLbl.text = "Achieve \(numbersFormat.format(value: Int(achive))) of your annual target 31st Dec \(annualTarget.yearStart ?? "")"
	}
	
}


//	MARK: - Quarterly Traget Config
extension iOS_CL_Cus_KnowYourTargetVC{
	private func quarterlyTargetConfig(data: LstQuaterlyBaseTargetDetails){
		let financeYear = GetQuarterDetails.getFinanceYearRange()

		self.QT_qtr1_DateLbl.text = "April to June - \(financeYear.startYear)"
		self.QT_qtr1_AchivePtsLbl.text = numbersFormat.format(value: Int(data.consumeQuaterly_1 ?? "0") ?? 0)
		self.QT_qtr1_TargetPtsLbl.text = "/ \(numbersFormat.format(value: Int(data.quaterly_1 ?? "0") ?? 0))"
		let qtr1Percentage = (Double(data.consumeQuaterly_1 ?? "0") ?? 0) / (Double(data.quaterly_1 ?? "1") ?? 1)
		self.QT_qtr1_percentageLbl.text = "\(Int(qtr1Percentage * 100))%"
		self.QT_qtr1_ProgressBar.progressTrackValue = qtr1Percentage
		
		self.QT_qtr2_DateLbl.text = "July to Sept - \(financeYear.startYear)"
		self.QT_qtr2_AchivePtsLbl.text = numbersFormat.format(value: Int(data.consumeQuaterly_2 ?? "0") ?? 0)
		self.QT_qtr2_TargetPtsLbl.text = "/ \(numbersFormat.format(value: Int(data.quaterly_2 ?? "0") ?? 0))"
		let qtr2Percentage = (Double(data.consumeQuaterly_2 ?? "0") ?? 0) / (Double(data.quaterly_2 ?? "1") ?? 1)
		self.QT_qtr2_percentageLbl.text = "\(Int(qtr2Percentage * 100))%"
		self.QT_qtr2_ProgressBar.progressTrackValue = qtr2Percentage
		
		self.QT_qtr3_DateLbl.text = "Oct to Dec - \(financeYear.startYear)"
		self.QT_qtr3_AchivePtsLbl.text = numbersFormat.format(value: Int(data.consumeQuaterly_3 ?? "0") ?? 0)
		self.QT_qtr3_TargetPtsLbl.text = "/ \(numbersFormat.format(value: Int(data.quaterly_3 ?? "0") ?? 0))"
		let qtr3Percentage = (Double(data.consumeQuaterly_3 ?? "0") ?? 0) / (Double(data.quaterly_3 ?? "1") ?? 1)
		self.QT_qtr3_percentageLbl.text = "\(Int(qtr3Percentage * 100))%"
		self.QT_qtr3_ProgressBar.progressTrackValue =  qtr3Percentage
		
		self.QT_qtr4_DateLbl.text = "Jan to March - \(financeYear.endYear)"
		self.QT_qtr4_AchivePtsLbl.text = numbersFormat.format(value: Int(data.consumeQuaterly_4 ?? "0") ?? 0)
		self.QT_qtr4_TargetPtsLbl.text = "/ \(numbersFormat.format(value: Int(data.quaterly_4 ?? "0") ?? 0))"
		let qtr4Percentage = (Double(data.consumeQuaterly_4 ?? "0") ?? 0) / (Double(data.quaterly_3 ?? "1") ?? 1)
		self.QT_qtr4_percentageLbl.text = "\(Int(qtr4Percentage * 100))%"
		self.QT_qtr4_ProgressBar.progressTrackValue = qtr4Percentage
	}
	
	private func quarterlyTargetLock(){
		let lockscrean = [self.QT_qtr1LockScreen,
						  self.QT_qtr2LockScreen,
						  self.QT_qtr3LockScreen,
						  self.QT_qtr4LockScreen]
		for data in lockscrean.enumerated(){
			if data.offset < GetQuarterDetails.getCurrentQuarter(){
				data.element?.isHidden =  true
			}else{
				data.element?.isHidden =  false
			}
		}
	}
}
	

//	MARK: - Brand wise Traget Config
extension iOS_CL_Cus_KnowYourTargetVC{
	private func brandwiseTargetConfig(data: LstBrandQuaterlyBaseTargetDetails){
		self.lstBrandQuater1 = data.lstBrandQuater1 ?? []
		self.lstBrandQuater2 = data.lstBrandQuater2 ?? []
		self.lstBrandQuater3 = data.lstBrandQuater3 ?? []
		self.lstBrandQuater4 = data.lstBrandQuater4 ?? []
	}
	
	
	//MARK:	Brandwise qtr 1 Table view cell config
	private func brandWiseQtr1TVCellForAt(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: BrandTargetTVCell.identifier, for: indexPath) as? BrandTargetTVCell
		guard let cell else{return UITableViewCell()}
		let data = self.lstBrandQuater1[indexPath.row]
		let percentage = (Double(data.consumeAmount ?? "0") ?? 0) / (Double(data.quaterlyAmount ?? "0") ?? 0)
		
		cell.brandNameLbl.text = data.brand ?? "-"
		cell.achivedPointsLbl.text = numbersFormat.format(value: Int(data.consumeAmount ?? "0") ?? 0)
 
		cell.totalTargetPointsLbl.text = "/ \(numbersFormat.format(value: Int(data.quaterlyAmount ?? "0") ?? 0))"
		cell.percentageLbl.text = "\(Int(percentage * 100)) %"
		cell.progressView.progressTrackValue = percentage
		return cell
	}
	
//MARK:	Brandwise qtr 2 Table view cell config
	private func brandWiseQtr2TVCellForAt(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: BrandTargetTVCell.identifier, for: indexPath) as? BrandTargetTVCell
		guard let cell else{return UITableViewCell()}
		let data = self.lstBrandQuater3[indexPath.row]
		let percentage = (Double(data.consumeAmount ?? "0") ?? 0) / (Double(data.quaterlyAmount ?? "1") ?? 1)
		
		cell.brandNameLbl.text = data.brand ?? "-"
		cell.achivedPointsLbl.text = numbersFormat.format(value: Int(data.consumeAmount ?? "0") ?? 0)
		cell.totalTargetPointsLbl.text = "/ \(numbersFormat.format(value: Int(data.quaterlyAmount ?? "0") ?? 0))"
		cell.percentageLbl.text = "\(Int(percentage * 100)) %"
		cell.progressView.progressTrackValue = percentage
		return cell
	}
	
	//MARK:	Brandwise qtr 3 Table view cell config
	private func brandWiseQtr3TVCellForAt(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: BrandTargetTVCell.identifier, for: indexPath) as? BrandTargetTVCell
		guard let cell else{return UITableViewCell()}
		let data = self.lstBrandQuater3[indexPath.row]
		let percentage = (Double(data.consumeAmount ?? "0") ?? 0) / (Double(data.quaterlyAmount ?? "1") ?? 1)
		
		cell.brandNameLbl.text = data.brand ?? "-"
		cell.achivedPointsLbl.text = numbersFormat.format(value: Int(data.consumeAmount ?? "0") ?? 0)
		cell.totalTargetPointsLbl.text = "/ \(numbersFormat.format(value: Int(data.quaterlyAmount ?? "0") ?? 0))"
		cell.percentageLbl.text = "\(Int(percentage * 100)) %"
		cell.progressView.progressTrackValue = percentage
		return cell
	}
	
	//MARK:	Brandwise qtr 4 Table view cell config
	private func brandWiseQtr4TVCellForAt(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: BrandTargetTVCell.identifier, for: indexPath) as? BrandTargetTVCell
		guard let cell else{return UITableViewCell()}
		let data = self.lstBrandQuater4[indexPath.row]
		let percentage = (Double(data.consumeAmount ?? "0") ?? 0) / (Double(data.quaterlyAmount ?? "1") ?? 1)
		
		cell.brandNameLbl.text = data.brand ?? "-"
		cell.achivedPointsLbl.text = numbersFormat.format(value: Int(data.consumeAmount ?? "0") ?? 0)
		cell.totalTargetPointsLbl.text = "/ \(numbersFormat.format(value: Int(data.quaterlyAmount ?? "0") ?? 0))"
		cell.percentageLbl.text = "\(Int(percentage * 100)) %"
		cell.progressView.progressTrackValue = percentage
		return cell
	}
}

//	MARK: - Monthly Traget Config
extension iOS_CL_Cus_KnowYourTargetVC{
	private func monthlyTargetConf(data: LstCustomerMonthlyTargets?){
		self.monthlyTargetList = [
			MonthlyTargetModels(quaterlyAmount: data?.april, consumeAmount: data?.aprilConsume,monthName: "Apil"),
			MonthlyTargetModels(quaterlyAmount: data?.may, consumeAmount: data?.mayConsume ,monthName: "May"),
			MonthlyTargetModels(quaterlyAmount: data?.june, consumeAmount: data?.juneConsume,monthName: "Jun"),
			MonthlyTargetModels(quaterlyAmount: data?.july, consumeAmount: data?.julyConsume,monthName: "Jul"),
			MonthlyTargetModels(quaterlyAmount: data?.august, consumeAmount: data?.augustConsume,monthName: "Aug"),
			MonthlyTargetModels(quaterlyAmount: data?.september, consumeAmount: data?.septemberConsume,monthName: "Sep"),
			MonthlyTargetModels(quaterlyAmount: data?.october, consumeAmount: data?.octoberConsume,monthName: "Oct"),
			MonthlyTargetModels(quaterlyAmount: data?.november, consumeAmount: data?.novemberConsume,monthName: "Nov"),
			MonthlyTargetModels(quaterlyAmount: data?.december , consumeAmount: data?.decemberConsume ,monthName: "Dec"),
			MonthlyTargetModels(quaterlyAmount: data?.january, consumeAmount: data?.januaryConsume,monthName: "Jan")
			,MonthlyTargetModels(quaterlyAmount: data?.february, consumeAmount: data?.februaryConsume,monthName: "Feb")
			,MonthlyTargetModels(quaterlyAmount: data?.march, consumeAmount: data?.marchConsume ,monthName: "Mar")
		]
	}
	
	//MARK:	Monthly Target Table view cell config
	private func monthlyTargetTVCellForAt(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_MonthlyTargetTVCell.identifier, for: indexPath) as? iOS_CL_MonthlyTargetTVCell
		guard let cell else{return UITableViewCell()}
		let data = self.monthlyTargetList[indexPath.row]
		let percentage = (Double(data.consumeAmount ?? "0") ?? 0) / (Double(data.quaterlyAmount ?? "1") ?? 0)
		
		cell.monthNameLbl.text = data.monthName ?? "XX"
		cell.achivedPointsLbl.text = numbersFormat.format(value: Int(data.consumeAmount ?? "0") ?? 0)
		cell.targetPointsLbl.text = "/ \(numbersFormat.format(value:Int(data.quaterlyAmount ?? "0") ?? 0))"
		cell.percentageLbl.text = "\(Int(percentage * 100)) %"
		cell.progressBar.progressTrackValue = percentage
		return cell
	}
}
