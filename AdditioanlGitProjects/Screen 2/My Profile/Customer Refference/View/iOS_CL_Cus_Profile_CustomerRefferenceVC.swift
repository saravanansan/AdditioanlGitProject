//
//  iOS_CL_Cus_Profile_CustomerRefferenceVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import UIKit

class iOS_CL_Cus_Profile_CustomerRefferenceVC: AppViewController {

	@IBOutlet weak var averageBillingTitleLbl: UILabel!
	@IBOutlet weak var averageBillingMonthTF: UITextField!
	
	@IBOutlet weak var deliveryTimeTitleLbl: UILabel!
	@IBOutlet weak var deliveryTimeTF: UITextField!
	
	@IBOutlet weak var warehouse_Yes_View: UIViewDesignable!
	@IBOutlet weak var warehouse_Yes_Img: UIImageDesignable!
	
	@IBOutlet weak var warehouse_No_View: UIViewDesignable!
	@IBOutlet weak var warehouse_No_Img: UIImageDesignable!
	
	@IBOutlet weak var sharedOrOwn_warehouseSV: UIStackView!
	@IBOutlet weak var sharedOrOwnWH_YesView: UIViewDesignable!
	@IBOutlet weak var sharedOrOwnWH_Yes_Img: UIImageDesignable!
	
	@IBOutlet weak var sharedOrOwn_No_View: UIViewDesignable!
	@IBOutlet weak var sharedOrOwn_No_Img: UIImageDesignable!
	
	@IBOutlet weak var haveDeliveryPerson_Yes_View: UIViewDesignable!
	@IBOutlet weak var haveDeliveryPerson_Yes_Img: UIImageDesignable!
	
	@IBOutlet weak var haveDeliveryPerson_No_View: UIViewDesignable!
	@IBOutlet weak var haveDeliveryPerson_No_Img: UIImageDesignable!
	
	@IBOutlet weak var retailerBaseTF: UITextField!
	@IBOutlet weak var warehouseAreaTF: UITextField!
	
	@IBOutlet weak var haveDeliveryVehicle_Yes_View: UIViewDesignable!
	@IBOutlet weak var haveDeliveryVehicle_Yes_Img: UIImageDesignable!
	
	@IBOutlet weak var haveDeliveryVehicle_No_View: UIViewDesignable!
	@IBOutlet weak var haveDeliveryVehicle_No_Img: UIImageDesignable!
	
	@IBOutlet weak var haveBillingSoftwareTF: UITextField!
	
	@IBOutlet weak var retailer_counter_Yes_View: UIViewDesignable!
	@IBOutlet weak var retailer_counter_Yes_Img: UIImageDesignable!
	
	@IBOutlet weak var retailer_counter_No_View: UIViewDesignable!
	@IBOutlet weak var retailer_counter_No_Img: UIImageDesignable!
	
	@IBOutlet weak var homeLocation_Yes_View: UIViewDesignable!
	@IBOutlet weak var homeLocation_Yes_Img: UIImageDesignable!
	
	@IBOutlet weak var homeLocation_No_View: UIViewDesignable!
	@IBOutlet weak var homeLocation_No_Img: UIImageDesignable!
	
	@IBOutlet weak var areaCoveredTF: UITextField!

	@IBOutlet weak var termsAndCondBtn: UIButton!
	@IBOutlet weak var submitBtn: GradientButton!
	@IBOutlet weak var billingSoftwareBtn: UIButton!
	
	
	var delegate: Profile_CustomerRefference_Delegate?
	var customerRefferenceDetails = [LstCustomerQuestions4]()
	var isEditableForm = false
	var haveWareHouseValue = -1
	var haveOwnWarehouseValue = -1
	var haveDeliveryPersonValue = -1
	var haveDeliveryVehicleValue = -1
	var haveWholesaleCounterValue = -1
	var firmLocationIsHomeLocationValue = -1
	var selectedName = ""
	var selectedNameID = -1, avaragebillingMonthID = -1, deliveryTimingID = -1
	var selectedOptions: SelectedData = .billing
	
	var viewmodels: Profile_CustomerRefference_InputProtocol
	init(viewmodels: Profile_CustomerRefference_InputProtocol){
		self.viewmodels = viewmodels
		super.init(nibName: nil, bundle: nil)
		self.viewmodels.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()
		self.haveBillingSoftwareTF.delegate = self
		self.retailerBaseTF.delegate = self
		self.retailerBaseTF.keyboardType = .numberPad
    }

	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.viewmodels.getCustomerRefferenceDetails(ActorId: Constants.userID)
	}
	
	
	@IBAction func didSelectAvgBillingPerMonth(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.selectedOptions = SelectedData.billing
		self.viewmodels.avarageBillingPerMonth(ActorId: UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "", answer_id: "Expected LINC Average Billing per Month "){ result in
			self.navigateToDropdown(data: result)
		}
	}

	@IBAction func didSelectDeliveryTime(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.selectedOptions = SelectedData.deliveryTime
		self.viewmodels.deliveryTimeApi(ActorId: UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "", answer_id: "Delivery Time "){ result in
			self.navigateToDropdown(data: result)
		}
	}
	
	@IBAction func didSelectWarehouseYesBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		guard self.haveWareHouseValue != 1 else{return}
		self.haveWarehouseBtnConfig(value: 1)
		self.haveOwnwarehouseBtnConf(value: -1)
	}
	
	@IBAction func didSelectWarehouseNoBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		guard self.haveWareHouseValue != 0 else{return}
		self.haveWarehouseBtnConfig(value: 0)
		self.haveOwnwarehouseBtnConf(value: -1)
	}
	
	
	@IBAction func didSelectSharedOrOwnYesBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.haveOwnwarehouseBtnConf(value: 1)
	}
	
	@IBAction func didSelectSharedOrOwnNoBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.haveOwnwarehouseBtnConf(value: 0)
	}
	
	@IBAction func haveDeliveryPersonYesBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.haveDeliveryPersonBtnConf(value: 1)
	}
	
	@IBAction func haveDeliveryPersonNoBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.haveDeliveryPersonBtnConf(value: 0)
	}
	
	@IBAction func haveDeliveryVehicle_Yes(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.haveDeliveryVehicleBtnConf(value: 1)
	}
	
	@IBAction func haveDeliveryVehicle_NoBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.haveDeliveryVehicleBtnConf(value: 0)
	}
	
	@IBAction func haveBillingSoftware(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.selectedOptions = SelectedData.billingSoftware
		self.viewmodels.billingSoftware(ActorId: "\(Constants.userID)", answer_id: "Do You have Billing Software?")
		
	}
	
	@IBAction func retailer_counter_YesBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.haveWholesaleCounterBtnConf(value: 1)
	}
	
	@IBAction func retailer_counter_NoBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.haveWholesaleCounterBtnConf(value: 0)
	}
	
	@IBAction func homeLocation_YesBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.firmLocationISHomeLocationBtnConf(value: 1)
	}
	
	@IBAction func homeLocation_NoBtn(_ sender: UIButton) {
		guard self.isEditableForm else{return}
		self.firmLocationISHomeLocationBtnConf(value: 0)
	}
	
	@IBAction func didSelectTermsAndCondition(_ sender: UIButton) {
		let viewmodels = VMFactory.shared.termsAndCondVM()
		let view = iOS_CL_Cus_TermsAndCondVC(viewModels: viewmodels)
		view.delegate = self
		self.navigationController?.pushViewController(view, animated: true)
	}
	
	
	@IBAction func didASelectSubmitBtn(_ sender: GradientButton) {
		let data = haveWareHouseValue == 1 ? "Yes" : "No"
		let ownWarehouse = haveOwnWarehouseValue == 1 ? "Yes": "No"
		let deliveryPersions = haveDeliveryPersonValue == 1 ? "Yes": "No"
		let deliveryVehicle = haveDeliveryVehicleValue == 1 ? "Yes" : "No"
		let ownRetailerWarHouse = haveWholesaleCounterValue == 1 ? "Yes" : "No"
		let firmLocation = firmLocationIsHomeLocationValue == 1 ? "Yes" : "No"
		
		if averageBillingMonthTF.text?.count == 0{
			ToastMessage.shared.showToast(message: "Please enter Average billing per month")
		}else if deliveryTimeTF.text?.count == 0{
			ToastMessage.shared.showToast(message: "Please enter Delivery Time")
		}else if haveWareHouseValue == -1{
			ToastMessage.shared.showToast(message: "Please select warehose vlaue")
		}else if haveOwnWarehouseValue == -1 && haveWareHouseValue == 1{
			ToastMessage.shared.showToast(message: "Please select own warehose vlaue")
		}else if haveDeliveryPersonValue == -1{
			ToastMessage.shared.showToast(message: "Please select delivery persion")
		}else if retailerBaseTF.text?.count == 0{
			ToastMessage.shared.showToast(message: "Please enter Retailer base")
		}else if warehouseAreaTF.text?.count == 0 {
			ToastMessage.shared.showToast(message: "Please enter warehouse Sq.Ft area")
		}else if haveDeliveryVehicleValue == -1{
			ToastMessage.shared.showToast(message: "Please select delivery vehicle")
		}else if haveBillingSoftwareTF.text?.count == 0{
			ToastMessage.shared.showToast(message: "Please select billing software")
		}else if haveWholesaleCounterValue == -1{
			ToastMessage.shared.showToast(message: "Please select own retail or wholesale")
		}else if firmLocationIsHomeLocationValue == -1{
			ToastMessage.shared.showToast(message: "Please select home location")
		}else if areaCoveredTF.text?.count == 0{
			ToastMessage.shared.showToast(message: "Please enter Area Covered")
		}else if  self.termsAndCondBtn.currentImage == UIImage(systemName: "square"){
			ToastMessage.shared.showToast(message: "Please Accept Terms And Condition")
		}else{
			self.viewmodels.saveAPI(ActorId: UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "", billingPerMonth: "\(self.avaragebillingMonthID)", DeliveryTime: "\(self.deliveryTimingID)", warehouse: "\(data)", OwnWarehouse: "\(ownWarehouse)" ,DeliveryPerion: "\(deliveryPersions)", existingRetailser: "\(self.retailerBaseTF.text ?? "")", wareHouseSqft: "\(self.warehouseAreaTF.text ?? "")", deliveryVehicle: "\(deliveryVehicle)", billingSoftware: "\(self.haveBillingSoftwareTF.text ?? "")", ownRetailerOrWareHouse: "\(ownRetailerWarHouse)", firmLocation: "\(firmLocation)", areaCovered: "\(self.areaCoveredTF.text ?? "")")
		}
		
	}
	
	
	private func initalCommits(){
		self.haveWarehouseBtnConfig(value: -1)
		self.haveOwnwarehouseBtnConf(value: -1)
		self.haveDeliveryPersonBtnConf(value: -1)
		self.haveDeliveryVehicleBtnConf(value: -1)
		self.haveWholesaleCounterBtnConf(value: -1)
		self.firmLocationISHomeLocationBtnConf(value: -1)
	}
}


extension iOS_CL_Cus_Profile_CustomerRefferenceVC{
	private func haveWarehouseBtnConfig(value: Int){
		self.haveWareHouseValue = value
		switch value{
			case 0:
				UIView.animate(withDuration: 0.8) {
					self.sharedOrOwn_warehouseSV.isHidden = true
				}
				self.warehouse_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.warehouse_Yes_View.backgroundColor = .clear
				self.warehouse_No_Img.image = UIImage(named: "selected_Radio_Img")
				self.warehouse_No_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
			case 1:
				UIView.animate(withDuration: 0.8) {
					self.sharedOrOwn_warehouseSV.isHidden = false
				}
				self.warehouse_Yes_Img.image = UIImage(named: "selected_Radio_Img")
				self.warehouse_Yes_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
				self.warehouse_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.warehouse_No_View.backgroundColor = .clear
			default:
				self.warehouse_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.warehouse_Yes_View.backgroundColor = .clear
				self.warehouse_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.warehouse_No_View.backgroundColor = .clear
				self.sharedOrOwn_warehouseSV.isHidden = true
		}
	}
	
	private func haveOwnwarehouseBtnConf(value: Int){
		self.haveOwnWarehouseValue = value
		switch value{
			case 0:
				self.sharedOrOwnWH_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.sharedOrOwnWH_YesView.backgroundColor = .clear
				self.sharedOrOwn_No_Img.image = UIImage(named: "selected_Radio_Img")
				self.sharedOrOwn_No_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
			case 1:
				self.sharedOrOwnWH_Yes_Img.image = UIImage(named: "selected_Radio_Img")
				self.sharedOrOwnWH_YesView.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
				self.sharedOrOwn_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.sharedOrOwn_No_View.backgroundColor = .clear
			default:
				self.sharedOrOwnWH_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.sharedOrOwnWH_YesView.backgroundColor = .clear
				self.sharedOrOwn_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.sharedOrOwn_No_View.backgroundColor = .clear
		}
	}
	
	private func haveDeliveryPersonBtnConf(value: Int){
		self.haveDeliveryPersonValue = value
		switch value{
			case 0:
				self.haveDeliveryPerson_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.haveDeliveryPerson_Yes_View.backgroundColor = .clear
				self.haveDeliveryPerson_No_Img.image = UIImage(named: "selected_Radio_Img")
				self.haveDeliveryPerson_No_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
			case 1:
				self.haveDeliveryPerson_Yes_Img.image = UIImage(named: "selected_Radio_Img")
				self.haveDeliveryPerson_Yes_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
				self.haveDeliveryPerson_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.haveDeliveryPerson_No_View.backgroundColor = .clear
			default:
				self.haveDeliveryPerson_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.haveDeliveryPerson_Yes_View.backgroundColor = .clear
				self.haveDeliveryPerson_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.haveDeliveryPerson_No_View.backgroundColor = .clear
		}
	}
	
	private func haveDeliveryVehicleBtnConf(value: Int){
		self.haveDeliveryVehicleValue = value
		switch value{
			case 0:
				self.haveDeliveryVehicle_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.haveDeliveryVehicle_Yes_View.backgroundColor = .clear
				self.haveDeliveryVehicle_No_Img.image = UIImage(named: "selected_Radio_Img")
				self.haveDeliveryVehicle_No_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
			case 1:
				self.haveDeliveryVehicle_Yes_Img.image = UIImage(named: "selected_Radio_Img")
				self.haveDeliveryVehicle_Yes_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
				self.haveDeliveryVehicle_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.haveDeliveryVehicle_No_View.backgroundColor = .clear
			default:
				self.haveDeliveryVehicle_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.haveDeliveryVehicle_Yes_View.backgroundColor = .clear
				self.haveDeliveryVehicle_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.haveDeliveryVehicle_No_View.backgroundColor = .clear
		}
	}
	
	private func haveWholesaleCounterBtnConf(value: Int){
		self.haveWholesaleCounterValue = value
		switch value{
			case 0:
				self.retailer_counter_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.retailer_counter_Yes_View.backgroundColor = .clear
				self.retailer_counter_No_Img.image = UIImage(named: "selected_Radio_Img")
				self.retailer_counter_No_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
			case 1:
				self.retailer_counter_Yes_Img.image = UIImage(named: "selected_Radio_Img")
				self.retailer_counter_Yes_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
				self.retailer_counter_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.retailer_counter_No_View.backgroundColor = .clear
			default:
				self.retailer_counter_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.retailer_counter_Yes_View.backgroundColor = .clear
				self.retailer_counter_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.retailer_counter_No_View.backgroundColor = .clear
		}
	}
	
	private func firmLocationISHomeLocationBtnConf(value: Int){
		self.firmLocationIsHomeLocationValue = value
		switch value{
			case 0:
				self.homeLocation_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.homeLocation_Yes_View.backgroundColor = .clear
				self.homeLocation_No_Img.image = UIImage(named: "selected_Radio_Img")
				self.homeLocation_No_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
			case 1:
				self.homeLocation_Yes_Img.image = UIImage(named: "selected_Radio_Img")
				self.homeLocation_Yes_View.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.30)
				self.homeLocation_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.homeLocation_No_View.backgroundColor = .clear
			default:
				self.homeLocation_Yes_Img.image = UIImage(named: "deselect_Radio_Img")
				self.homeLocation_Yes_View.backgroundColor = .clear
				self.homeLocation_No_Img.image = UIImage(named: "deselect_Radio_Img")
				self.homeLocation_No_View.backgroundColor = .clear
		}
	}
}


extension iOS_CL_Cus_Profile_CustomerRefferenceVC: Profile_CustomerRefference_OutputProtocol{
	func customerRefernceDetailsConfig(data: [LstCustomerQuestions4]?) {
		if (data?.count ?? 0) > 0{
			self.termsAndCondBtn.isHidden = true
			self.submitBtn.isHidden = true
			self.retailerBaseTF.isEnabled = false
			self.warehouseAreaTF.isEnabled = false
			self.areaCoveredTF.isEnabled = false
			self.isEditableForm = false
		}else{
			self.termsAndCondBtn.isHidden = false
			self.submitBtn.isHidden = false
			self.retailerBaseTF.isEnabled = false
			self.warehouseAreaTF.isEnabled = false
			self.areaCoveredTF.isEnabled = false
			self.isEditableForm = true
		}
		self.customerRefferenceDetails = data ?? []
		for selectedData in data ?? []{
			switch selectedData.question{
				case "Expected LINC Average Billing per Month":
					self.viewmodels.avarageBillingPerMonth(ActorId: UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "", answer_id: "Expected LINC Average Billing per Month "){ result in
						self.averageBillingMonthTF.text = result.filter{"\($0.statusId ?? -1)" == selectedData.answer}.first?.statusName ?? ""
					}
					
				case "Delivery Time":
					self.viewmodels.deliveryTimeApi(ActorId:"\(Constants.userID)", answer_id: "Delivery Time "){ result in
						self.deliveryTimeTF.text = result.filter{"\($0.statusId ?? -1)" == selectedData.answer}.first?.statusName ?? ""
					}
				case "Do You have Warehouse?":
					if selectedData.answer == "Yes"{
						self.haveWarehouseBtnConfig(value: 1)
					}else{
						self.haveWarehouseBtnConfig(value: 0)
					}
				case "Do you Have Shared Or Own Warehouse?":
					if selectedData.answer == "Yes"{
						self.haveOwnwarehouseBtnConf(value: 1)
					}else{
						self.haveOwnwarehouseBtnConf(value: 0)
					}
				case "Do you have a Delivery Person?":
					if selectedData.answer == "Yes"{
						self.haveDeliveryPersonBtnConf(value: 1)
					}else{
						self.haveDeliveryPersonBtnConf(value: 0)
					}
				case "Existing Retailer Base":
					self.retailerBaseTF.text = selectedData.answer ?? ""
				case "WareHouse sqFtArea":
					self.warehouseAreaTF.text = selectedData.answer ?? ""
				case "Do You have Delivery Vechicle?":
					if selectedData.answer == "Yes"{
						self.haveDeliveryVehicleBtnConf(value: 1)
					}else{
						self.haveDeliveryVehicleBtnConf(value: 0)
					}
				case "Do You have Billing Software?":
					self.haveBillingSoftwareTF.text = selectedData.answer ?? ""
				case "Do you Own Retailer And Warehouse Counter":
					if selectedData.answer == "Yes"{
						self.haveWholesaleCounterBtnConf(value: 1)
					}else{
						self.haveWholesaleCounterBtnConf(value: 0)
					}
				case "Firm Location is Your Home Location":
					if selectedData.answer == "Yes"{
						self.firmLocationISHomeLocationBtnConf(value: 1)
					}else{
						self.firmLocationISHomeLocationBtnConf(value: 0)
					}
				case "Area Covered":
					self.areaCoveredTF.text = selectedData.answer ?? ""
				default:
					print("no data match")
			}
			
		}
	}
	
	func submitCR() {
		self.viewmodels.getCustomerRefferenceDetails(ActorId: Constants.userID)
	}
	

	func errorMessage(error: String) {
		self.MotionToast(message: error, toastType: .error)
	}
	
}



extension iOS_CL_Cus_Profile_CustomerRefferenceVC: SuccessSubmissionProtocol{
	func didSelectProceedBtn() {
		self.navigationController?.popToRootViewController(animated: true)
	}
}

extension iOS_CL_Cus_Profile_CustomerRefferenceVC: SearchableDropDownDelegate{
	func selectedDropdownData(statusName: String?,statusId: Int?) {
		switch selectedOptions{
			case .billing:
				self.selectedName = statusName ?? ""
				self.avaragebillingMonthID = statusId ?? -1
				self.averageBillingMonthTF.text = statusName ?? ""
			case .deliveryTime:
				self.selectedName = statusName ?? ""
				self.deliveryTimingID = statusId ?? -1
				self.deliveryTimeTF.text = statusName ?? ""
			case .billingSoftware:
				self.billingSoftwareDropdownValue(statusName: statusName, statusId: statusId)
		}
		
	}
	
	private func billingSoftwareDropdownValue(statusName: String?,statusId: Int?){
		if statusName == "Other"{
			self.billingSoftwareBtn.isUserInteractionEnabled = false
			self.haveBillingSoftwareTF.placeholder = ""
			self.haveBillingSoftwareTF.text = ""
			self.haveBillingSoftwareTF.isUserInteractionEnabled = true
			self.haveBillingSoftwareTF.becomeFirstResponder()
		}else{
			self.selectedName = statusName ?? ""
			self.selectedNameID = statusId ?? -1
			self.haveBillingSoftwareTF.text = statusName ?? ""
		}
	}
	
	
	func navigateToDropdown(data: [DropdownDataModels],searchBarIsHidden : Bool = true){
		guard data.count > 0 else {
			ToastMessage.shared.showToast(message: "No data found!")
			return
		}
		DispatchQueue.main.async { [weak self] in
			guard let self = self else {return}
			let vc = iOS_CL_Cus_SearchableDropDownVC()
			vc.delegate = self
			vc.modalTransitionStyle = .crossDissolve
			vc.modalPresentationStyle = .overFullScreen
			vc.dropdownDataArray = data
			vc.SearchaBarIsHidden = searchBarIsHidden
			vc.closeBtnIshidden = searchBarIsHidden
			self.present(vc, animated: true)
		}
	}
}

// MARK: - Text field delegate
extension iOS_CL_Cus_Profile_CustomerRefferenceVC: UITextFieldDelegate{
	
	//TextField Should Change Character
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if textField == self.retailerBaseTF{
			let currentText = textField.text ?? ""
			guard let stringRange = Range(range, in: currentText) else { return false }
			let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
			return (Int(updatedText) ?? 0) <= 1000
		}else{
			return true
		}
	}
	
	
	
	//TextField text change delegate
	func textFieldDidChangeSelection(_ textField: UITextField) {
		if self.haveBillingSoftwareTF == textField{
			/*Billing software */
			self.billingSoftwareTextChange(textField)
		}else if self.retailerBaseTF == textField{
			/*Retailer Base */
			self.reatilerBaseTextChange(textField)
		}
	}
	
	/*Billing software text change*/
	private func billingSoftwareTextChange(_ textField: UITextField){
		if textField.text == "Other",self.billingSoftwareBtn.isUserInteractionEnabled{
			self.billingSoftwareBtn.isUserInteractionEnabled = false
			self.haveBillingSoftwareTF.placeholder = ""
			self.haveBillingSoftwareTF.text = ""
			self.haveBillingSoftwareTF.becomeFirstResponder()
		}else if textField.text == "",!self.billingSoftwareBtn.isUserInteractionEnabled{
			self.billingSoftwareBtn.isUserInteractionEnabled = true
			self.haveBillingSoftwareTF.placeholder = "Select"
			self.haveBillingSoftwareTF.text = ""
			self.haveBillingSoftwareTF.isUserInteractionEnabled = false
			self.haveBillingSoftwareTF.endEditing(true)
		}
	}
	
	
	private func reatilerBaseTextChange(_ textField: UITextField){
		if (Int(textField.text ?? "0") ?? 0) == 0{
			textField.text = ""
		}
	}
}


//Terms and condition Delegate
extension iOS_CL_Cus_Profile_CustomerRefferenceVC: TermsAndCondDelegate{
	func termsAndCondUpdate(status: Bool) {
		if status {
			self.termsAndCondBtn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
		}else{
			self.termsAndCondBtn.setImage(UIImage(systemName: "square"), for: .normal)
		}
	}
	
	
}
