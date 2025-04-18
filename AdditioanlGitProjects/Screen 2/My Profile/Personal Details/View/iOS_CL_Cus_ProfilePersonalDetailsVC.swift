//
//  iOS_CL_Cus_ProfilePersonalDetailsVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import UIKit

class iOS_CL_Cus_ProfilePersonalDetailsVC: AppViewController {

	@IBOutlet weak var fullNameTitleLbl: UILabel!
	@IBOutlet weak var fullNameTF: UITextField!
	
	@IBOutlet weak var firmAddressTitleNameLbl: UILabel!
	@IBOutlet weak var firmAddressTF: UITextField!
	
	@IBOutlet weak var permanentAddressTitleLbl: UILabel!
	@IBOutlet weak var permanentAddressTF: UITextField!
	
	@IBOutlet weak var temporaryAddressTitleLbl: UILabel!
	@IBOutlet weak var temporaryAddressTF: UITextField!
	
	@IBOutlet weak var mobileNumberTitleLbl: UILabel!
	@IBOutlet weak var mobileNumberTF: UITextField!
	
	@IBOutlet weak var whatsappNoTitleLbl: UILabel!
	@IBOutlet weak var whatsappNumberTF: UITextField!
	@IBOutlet weak var whatsappNumberCheckBox: UIButtonDesignable!
	
	@IBOutlet weak var emailTitleLbl: UILabel!
	@IBOutlet weak var emailTF: UITextField!
	
	@IBOutlet weak var stateTitleLbl: UILabel!
	@IBOutlet weak var stateTF: UITextField!
	
	@IBOutlet weak var cityTitleLbl: UILabel!
	@IBOutlet weak var cityNameTF: UITextField!
	
	@IBOutlet weak var districtyNameTitleLbl: UILabel!
	@IBOutlet weak var districtNameTF: UITextField!
	
	@IBOutlet weak var pinCodeTF: UITextField!
	@IBOutlet weak var dobTF: UITextField!
	@IBOutlet weak var dobBtn: UIButton!
	
	@IBOutlet weak var marriedCircleImage: UIImageDesignable!
	@IBOutlet weak var marriedTitleLbl: UILabel!
	@IBOutlet weak var marriedBtn: UIButton!
	
	@IBOutlet weak var unmarriedCircleImage: UIImageDesignable!
	@IBOutlet weak var unmarriedTitleLbl: UILabel!
	@IBOutlet weak var unMarriedBtn: UIButton!
	
	@IBOutlet weak var maritalStatusTitleLbl: UILabel!
	
	@IBOutlet weak var anniversarydateTitleLbl: UILabel!
	@IBOutlet weak var anniversaryDateTF: UITextField!
	
	@IBOutlet weak var spouceNameTitleLbl: UILabel!
	@IBOutlet weak var spouceNameTF: UITextField!
	
	@IBOutlet weak var spouceDOBTF: UITextField!
	
	@IBOutlet weak var childrenTitleLbl: UILabel!
	
	@IBOutlet weak var child1TF: UITextField!
	@IBOutlet weak var child1GenderTF: UITextField!
	@IBOutlet weak var child1_DOBTF: UITextField!
	
	@IBOutlet weak var child2NameTF: UITextField!
	@IBOutlet weak var child2_GenderTF: UITextField!
	@IBOutlet weak var child2_DOBTF: UITextField!
	
	@IBOutlet weak var child3NameTF: UITextField!
	@IBOutlet weak var child3_GenderTF: UITextField!
	@IBOutlet weak var child3_DOBTF: UITextField!
	
	@IBOutlet weak var submitBtn: GradientButton!
	@IBOutlet weak var mySalesSuperStartLbl: UILabel!
	
	@IBOutlet weak var childrensDataSV: UIStackView!
	
	
	var delegate: Profile_PersonalDetails_Delegate?
	var personal =  PersonalDetailsVCModels()
	let Requiredformatter = DateFormatter()
	var superStarData: HierarchyMapDetails?
	var personalDetails : PersonalDetailsModels?
	
	var viewmodels: ProfilePersonalDetails_InputProtocol
	init(viewmodels: ProfilePersonalDetails_InputProtocol){
		self.viewmodels = viewmodels
		
		super.init(nibName: nil, bundle: nil)
		self.viewmodels.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.personalDetailsIsEditable(status: false)
		Requiredformatter.dateFormat = personal.dateFormat.rawValue
		self.mobileNumberTF.delegate = self
		self.whatsappNumberTF.delegate = self
		self.pinCodeTF.delegate = self
		self.mySalesSuperStarLblConfig()
    }
	
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.viewmodels.getPersonalDetails(userName: Constants.loyaltyID)
	}

	
	@IBAction func didSelectFirmAddressInfo(_ sender: UIButton) {
		let message = "Firm Address should be matched with GST Address if GST is applicable."
		self.alertMessgae(message: message)
	}
	
	@IBAction func didSelectPermanentAddressInfo(_ sender: UIButton) {
		let message = "Permanent Address should be matched with Aadhaar / Secondary ID Address."
		self.alertMessgae(message: message)
	}
	
	@IBAction func didSelectWhatsappNumberCheckBox(_ sender: UIButtonDesignable) {
//		guard self.personal.isFormEditable else{
//			return
//		}
		self.whatsAppstatusBtnConfig(status: !self.personal.whatsAppCheckBoxStatus)
	}
	
	@IBAction func didSelectStateName(_ sender: UIButton) {
		/*
		guard self.personal.isFormEditable else{
			return
		}
		self.personal.dropdownSelection = .stateList
		self.viewmodels.getStateList { result in
			self.navigateToDropdown(data: result,searchBarIsHidden: false)
		}
		*/
	}
	
	@IBAction func didSelectCityName(_ sender: UIButton) {
		/*
		guard self.personal.isFormEditable else{
			return
		}
		guard self.personal.stateID != -1 else{
			self.errorMessage(error: "Please select the state name")
			return
		}
		self.personal.dropdownSelection = .cityList
		self.viewmodels.getCityList(stateID: self.personal.stateID) { result in
			self.navigateToDropdown(data: result,searchBarIsHidden: false)
		}
		 */
	}
	
	
	@IBAction func didSelectDistrictName(_ sender: UIButton) {
		/*guard self.personal.isFormEditable else{
			return
		}
		guard self.personal.stateID != -1 else{
			self.errorMessage(error: "Please select the state name")
			return
		}
		self.personal.dropdownSelection = .district
		self.viewmodels.getDistrictList(stateID: self.personal.stateID) { result in
			self.navigateToDropdown(data: result,searchBarIsHidden: false)
		}*/
	}
	
	
	@IBAction func didSelectDOB(_ sender: UIButton) {
		/*guard self.personal.isFormEditable else{
			return
		}
		self.routeToDatePicker(date: dobTF.text ?? "", datePicker: .birthDay,cate: .dob)
		 */
	}
	
	
	
	@IBAction func didSelectMarriedbtn(_ sender: UIButton) {
		/*
		guard self.personal.isFormEditable else{
			return
		}
		guard self.personal.maritalStatus != 1 else{return}
		self.maritalBtnStatusConfig(maritalStatus: 1)
		 */
	}
	
	
	@IBAction func didSelectunmarriedBtn(_ sender: UIButton) {
		/*guard self.personal.isFormEditable else{
			return
		}
		guard self.personal.maritalStatus != 0 else{return}
		self.maritalBtnStatusConfig(maritalStatus: 0)
		 */
	}
	
	@IBAction func didSelectAnniversaryDate(_ sender: UIButton) {
		
		self.routeToDatePicker(date: anniversaryDateTF.text ?? "", datePicker: .anivarasary,cate: .otherDate)
	}
	
	
	@IBAction func didSelectSpouceDOB(_ sender: Any) {

		self.routeToDatePicker(date: self.spouceDOBTF.text ?? "", datePicker: .spouseDOB,cate: .otherDate)
	}
	
	@IBAction func didSelectChild1_Gender(_ sender: UIButton) {

		self.personal.dropdownSelection = .child1Gender
		let genderList = self.viewmodels.getGenderList()
		self.navigateToDropdown(data: genderList)
	}
	
	@IBAction func didSelectChild1_DOB(_ sender: UIButton) {

		self.routeToDatePicker(date: self.child1_DOBTF.text ?? "", datePicker: .child1DOB,cate: .otherDate)
	}
	
	@IBAction func didSelectChild2_Gender(_ sender: UIButton) {

		self.personal.dropdownSelection = .child2Gender
		let genderList = self.viewmodels.getGenderList()
		self.navigateToDropdown(data: genderList)
	}
	
	
	@IBAction func didSelectChild2_DOB(_ sender: UIButton) {

		self.routeToDatePicker(date: self.child2_DOBTF.text ?? "", datePicker: .child2DOB,cate: .otherDate)
	}
	
	
	@IBAction func didSelectChild3_Gender(_ sender: UIButton) {

		self.personal.dropdownSelection = .child3Gender
		let genderList = self.viewmodels.getGenderList()
		self.navigateToDropdown(data: genderList)
	}
	
	
	@IBAction func didSelectChild3_DOB(_ sender: UIButton) {

		self.routeToDatePicker(date: self.child3_DOBTF.text ?? "", datePicker: .Child3DOB,cate: .otherDate)
	}

	
	@IBAction func didSelectSubmitBtn(_ sender: GradientButton) {
//		guard self.personal.isFormEditable else{
//			self.delegate?.profileName = self.fullNameTF.text ?? ""
//			self.delegate?.mobileNumber = self.mobileNumberTF.text ?? ""
//			self.delegate?.goNextPage()
//			return
//		}
		if self.fullNameTF.text == ""{
			ToastMessage.shared.showToast(message: "Please enter Full Name")
		}else if firmAddressTF.text == ""{
			ToastMessage.shared.showToast(message: "Please enter Firm address")
		}else if self.permanentAddressTF.text == ""{
			ToastMessage.shared.showToast(message: "Please enter Permanent address (As per Aadhar)")
		}else if self.temporaryAddressTF.text == ""{
			ToastMessage.shared.showToast(message: "Please enter current/Temporary address")
		}else if self.mobileNumberTF.text == ""{
			ToastMessage.shared.showToast(message: "Please enter mobile number")
		}else if self.mobileNumberTF.text?.count != 10{
			ToastMessage.shared.showToast(message: "Please enter valid mobile number")
		}else if self.whatsappNumberTF.text == "" {
			ToastMessage.shared.showToast(message: "Please enter whatsapp number")
		}else if self.whatsappNumberTF.text?.count != 10{
			ToastMessage.shared.showToast(message: "Please enter valid whatsapp number")
		}
		/*else if self.whatsappNumberTF.text != self.mobileNumberTF.text && self.personal.whatsAppCheckBoxStatus{
			self.MotionToast(message: "Mobile number and whatsapp number are not same", toastType: .error)
		}*/
		else if self.emailTF.text != "" && !((self.emailTF.text ?? "").isValidEmail){
			ToastMessage.shared.showToast(message: "Please enter a valid Email ID")
		}else if self.personal.stateID == -1{
			ToastMessage.shared.showToast(message: "Please select State name")
		}else if self.personal.cityId == -1{
			ToastMessage.shared.showToast(message: "Please select City name")
		}else if self.personal.districtID == -1{
			ToastMessage.shared.showToast(message: "Please select district name")
		}else if self.pinCodeTF.text == ""{
			ToastMessage.shared.showToast(message: "Please enter Pincode")
		}else if self.pinCodeTF.text?.count != 6{
			ToastMessage.shared.showToast(message: "Please enter a valid Pincode")
		}else if self.dobTF.text == ""{
			ToastMessage.shared.showToast(message: "Please select date of birth")
		}else if self.personal.maritalStatus == -1{
			ToastMessage.shared.showToast(message: "Please select the marital status")
		}else{
			//api call
			self.mobileNumberExistancy()
			
		}
	}
	
	private func alertMessgae(message: String,title: String = "",btnName: String = "OK"){
		let vc = iOS_CL_Cus_AlertMessageVC()
		vc.alertMessage = message
		vc.titleName = title
		vc.okBtnName = btnName
		vc.modalPresentationStyle = .overFullScreen
		vc.modalTransitionStyle = .crossDissolve
		self.present(vc, animated: true)
	}
	
	private func mySalesSuperStarLblConfig(){
		let text = self.mySalesSuperStartLbl.text ?? ""
		let attributedString = NSMutableAttributedString(string: text)
		attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
		self.mySalesSuperStartLbl.attributedText = attributedString
		
		self.mySalesSuperStartLbl.isUserInteractionEnabled = true
		let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnSuperstarLabel(_ :)))
		tapgesture.numberOfTapsRequired = 1
		self.mySalesSuperStartLbl.addGestureRecognizer(tapgesture)
	}
	
	//MARK: - tapped super star Label
	@objc func tappedOnSuperstarLabel(_ gesture: UITapGestureRecognizer) {
		let vc = iOS_CL_Cus_MySalesSuperStarVC()
		vc.modalTransitionStyle = .crossDissolve
		vc.superStarData = self.superStarData
		vc.modalPresentationStyle = .overFullScreen
		self.present(vc, animated: true)
	}
	
	func goToOTPPage(email: String?,mobileNumber: String?){
		let viewModel = VMFactory.shared.regosterOTPVM()
		let vc = iOS_CL_Cus_RegisterOTPVC(viewmodels: viewModel)
		vc.modalPresentationStyle = .overFullScreen
		vc.mobileNumber = mobileNumber
		vc.emailID = email
		vc.delegate = self
		self.present(vc, animated: false)
	}
}



//MARK: - View Models Output
extension iOS_CL_Cus_ProfilePersonalDetailsVC: ProfilePersonalDetails_OutputProtocol,SuccessSubmissionProtocol{
	func errorMessage(error: String) {
		ToastMessage.shared.showToast(message: error)
	}
	
	func personalDetailsSubmitSuccess(){
		ToastMessage.shared.showToast(message: "Your Personal details saved successfully",bgColor: AppColor.yellow1!,textColor: .black)
		self.viewmodels.getPersonalDetails(userName: Constants.loyaltyID)
		
		let vc = iOS_CL_Cus_SuccessSubmissionVC()
		vc.message = "Your Personal details saved successfully"
		vc.proceedBtnName = "Proceed"
		vc.delegate = self
		vc.modalPresentationStyle = .overFullScreen
		self.present(vc, animated: false)
	}
	
	func didSelectProceedBtn() {
		
		
	}
	
	func personalDetailsResponse(data: PersonalDetailsModels) {
		self.personalDetails = data
		self.delegate?.personalDataUpdate(data: data)
		if let personalDetails = data.objCustomer{
			self.personalDetailsDataConfig(data: personalDetails)
		}else{
			self.personal.isFormEditable = false
			self.personalDetailsIsEditable(status: false)
		}
		
		if let childDetails = data.customerFamilyList{
			self.childDataConfig(data: childDetails)
		}
		
	}
	
	/*Personal Details*/
	private func personalDetailsDataConfig(data: ObjCustomer){
		var fullName = data.firstName ?? ""
		if data.lastName ?? "" != ""{
			fullName += " \(data.lastName ?? "")"
		}
		self.fullNameTF.text = fullName
		self.firmAddressTF.text = data.address1 ?? ""
		self.permanentAddressTF.text = data.address3 ?? ""
		self.temporaryAddressTF.text = data.address2 ?? ""
		self.mobileNumberTF.text = data.customerMobile ?? ""
		self.whatsappNumberTF.text = data.whatsAppNumber ?? ""
		self.emailTF.text = data.customerEmail ?? ""
	
		self.pinCodeTF.text = data.customerZip ?? ""
		let dob = (data.jdob ?? "").split(separator: " ")
		self.dobTF.text = DateFormat.shared.customDateFormat(date: "\(dob[0])")
		self.maritalBtnStatusConfig(maritalStatus: data.maritalStatus ?? -1)
		
		let anniversarr = (data.anniversary ?? "").split(separator: "T")
		self.anniversaryDateTF.text = DateFormat.shared.customDateFormat(date: "\(anniversarr[0])")
		
		if data.whatsAppNumber ?? "" == "" || data.whatsAppNumber ?? "" == "--"{
			self.personal.isFormEditable = true
			self.submitBtn.setTitle("Update", for: .normal)
		}else{
			self.personal.isFormEditable = false
			self.submitBtn.setTitle("Update", for: .normal)
		}
		self.personalDetailsIsEditable(status: false)
		
		
		self.personal.stateID = data.customerStateId ?? -1
		self.viewmodels.getStateList { result in
			self.stateTF.text = result.filter{($0.statusId ?? -1) == data.customerStateId ?? -1}.first?.statusName ?? ""
		}
		

		self.personal.cityId = data.customerCityId ?? -1
		self.viewmodels.getCityList(stateID: self.personal.stateID){ result in
			self.cityNameTF.text = result.filter{($0.statusId ?? -1) == data.customerCityId ?? -1}.first?.statusName ?? ""
		}
		
		self.personal.districtID = data.districtId ?? -1
		self.viewmodels.getDistrictList(stateID: self.personal.stateID){ result in
			self.districtNameTF.text = result.filter{($0.statusId ?? -1) == data.districtId ?? -1}.first?.statusName ?? ""
		}
	}
	
	
	private func childDataConfig(data: [CustomerFamilyList]){
		
		if data.count > 0{
			let dob = (data[0].familyMemberBirthday ?? "").split(separator: "T")
			self.spouceNameTF.text = data[0].familyMemberName ?? ""
			self.spouceDOBTF.text = "\(dob[0])"
		}
		
		// children details
		if data.count > 1{
			let dob = (data[1].familyMemberBirthday ?? "").split(separator: "T")
			self.child1TF.text = data[1].familyMemberName ?? ""
			self.child2_GenderTF.text = data[1].childGender ?? ""
			self.child1_DOBTF.text = DateFormat.shared.customDateFormat(date: "\(dob[0])")
		}
		
		if data.count > 2{
			let dob = (data[2].familyMemberBirthday ?? "").split(separator: "T")
			self.child2NameTF.text = data[2].familyMemberName ?? ""
			self.child2_GenderTF.text = data[2].childGender ?? ""
			self.child2_DOBTF.text = DateFormat.shared.customDateFormat(date: "\(dob[0])")
		}
		
		if data.count > 3{
			let dob = (data[3].familyMemberBirthday ?? "").split(separator: "T")
			self.child3NameTF.text = data[3].familyMemberName ?? ""
			self.child3_GenderTF.text = data[3].childGender ?? ""
			self.child3_DOBTF.text = DateFormat.shared.customDateFormat(date: "\(dob[0])")
		}
	}
	
	private func personalDetailsIsEditable(status : Bool){
		self.fullNameTF.isEnabled = status
		self.firmAddressTF.isEnabled = status
		self.permanentAddressTF.isEnabled = status
		self.temporaryAddressTF.isEnabled = true
		self.mobileNumberTF.isEnabled = true
		self.whatsappNumberTF.isEnabled = true
		self.emailTF.isEnabled = true
		self.pinCodeTF.isEnabled = status
		self.spouceNameTF.isEnabled = status
		self.child1TF.isEnabled = true
		self.child2NameTF.isEnabled = true
		self.child3NameTF.isEnabled = true
	}
	
	private func maritalBtnStatusConfig(maritalStatus : Int){
		self.personal.maritalStatus = maritalStatus
		if maritalStatus == 1{
			UIView.animate(withDuration: 0.5) {
				self.childrensDataSV.isHidden = false
				self.unmarriedCircleImage.image = nil
				self.marriedCircleImage.image = UIImage(systemName: "circle.inset.filled")
			}
		}else if self.personal.maritalStatus == 0{
			UIView.animate(withDuration: 0.5) {
				self.childrensDataSV.isHidden = true
				self.unmarriedCircleImage.image = UIImage(systemName: "circle.inset.filled")
				self.marriedCircleImage.image = nil
			}
		}else{
			UIView.animate(withDuration: 0.5) {
				self.childrensDataSV.isHidden = true
				self.unmarriedCircleImage.image = nil
				self.marriedCircleImage.image = nil
			}
		}
	}
	
	private func whatsAppstatusBtnConfig(status: Bool){
		self.personal.whatsAppCheckBoxStatus = status
		if status{
			self.whatsappNumberCheckBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
			self.whatsappNumberTF.text = self.mobileNumberTF.text
			self.whatsappNumberTF.isEnabled = false
		}else{
			self.whatsappNumberCheckBox.setImage(nil, for: .normal)
			self.whatsappNumberTF.isEnabled = true
		}
	}
	
}


extension iOS_CL_Cus_ProfilePersonalDetailsVC: UITextFieldDelegate{
	func textFieldDidChangeSelection(_ textField: UITextField) {
		if textField == self.mobileNumberTF && self.personal.whatsAppCheckBoxStatus{
			self.whatsappNumberTF.text = textField.text
		}
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		if textField == self.mobileNumberTF || textField == self.whatsappNumberTF{
			return self.mobileNumberCharacterValdiation(string) && isWithinMaxLength(textField.text, range: range, replacementString: string, maxLenth: 10)
		}else if textField == self.pinCodeTF{
			return isWithinMaxLength(textField.text, range: range, replacementString: string, maxLenth: 6)
		}else{
			return true
		}
		
	}
	
	private func mobileNumberCharacterValdiation(_ string: String) -> Bool{
		let numberSet = CharacterSet.decimalDigits
		let characterSet = CharacterSet(charactersIn: string)
		return numberSet.isSuperset(of: characterSet)
	}
	
	private func isWithinMaxLength(_ currentText: String?, range: NSRange, replacementString string: String,maxLenth: Int) -> Bool {
		let currentTextLength = currentText?.count ?? 0
		let newTextLength = currentTextLength + string.count - range.length
		return newTextLength <= maxLenth
	}
}


extension iOS_CL_Cus_ProfilePersonalDetailsVC: SearchableDropDownDelegate{
	func selectedDropdownData(statusName: String?,statusId: Int?) {
		switch self.personal.dropdownSelection{
			case .stateList:
				guard self.personal.stateID != statusId else{return}
				self.stateTF.text = statusName ?? ""
				self.personal.stateID = statusId ?? 0
				self.cityNameTF.text = ""
				self.personal.cityId = -1
				
				self.districtNameTF.text = ""
				self.personal.districtID = -1
			case .cityList:
				self.cityNameTF.text = statusName ?? ""
				self.personal.cityId = statusId ?? -1
			case .district:
				self.districtNameTF.text = statusName ?? ""
				self.personal.districtID = statusId ?? -1
			case .child1Gender:
				self.child1GenderTF.text = statusName ?? ""
			case .child2Gender:
				self.child2_GenderTF.text = statusName ?? ""
			case .child3Gender:
				self.child3_GenderTF.text = statusName ?? ""
		}
	}
	
	func navigateToDropdown(data: [DropdownDataModels],searchBarIsHidden : Bool = true){
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



extension iOS_CL_Cus_ProfilePersonalDetailsVC: DatePickerDelegate{
	func didUpdateDate(date: String) {
		switch self.personal.datePickerType{
			case .anivarasary:
				self.anniversaryDateTF.text = date
			case .birthDay:
				self.dobTF.text = date
			case .spouseDOB:
				self.spouceDOBTF.text = date
			case .child1DOB:
				self.child1_DOBTF.text = date
			case .child2DOB:
				self.child2_DOBTF.text = date
			case .Child3DOB:
				self.child3_DOBTF.text = date
		}
	}
	
	func routeToDatePicker(date: String,datePicker : PersonalDetailsVCModels.DatePickerCategoryEnum,cate: DatePickerCategory = .otherDate){
		DispatchQueue.main.async {
			let vc = iOS_CL_Cus_DatePickerVC()
			vc.modalTransitionStyle = .crossDissolve
			vc.modalPresentationStyle = .overFullScreen
			vc.delegate = self
			vc.itsComefrom = cate
			vc.selectedDate = date //toDate
			self.personal.datePickerType = datePicker //.toDate
			vc.dateFormatValue = self.personal.dateFormat
			self.present(vc, animated: true)
		}
	}
	
	
	
}


extension iOS_CL_Cus_ProfilePersonalDetailsVC{
	private func mobileNumberExistancy(){
		guard let mobile = self.mobileNumberTF.text else{
			self.emailValidationApi()
			return
		}
		
		guard self.personalDetails?.objCustomer?.customerMobile != mobile else{
			self.emailValidationApi()
			return
		}
		
		self.viewmodels.mobileNumberExistancy(userName: mobile){ result in
			if result{
				self.emailValidationApi()
			}
		}
	}
	
	private func whatsAppNumberexistancy(){
		guard let whatsapp = self.whatsappNumberTF.text else{
			self.emailValidationApi()
			return
		}
		
		guard self.personalDetails?.objCustomer?.whatsAppNumber != whatsapp else{
			self.emailValidationApi()
			return
		}
		
		self.viewmodels.mobileNumberExistancy(userName: whatsapp){ result in
			if result{
				self.emailValidationApi()
			}
		}
	}
	
	private func emailValidationApi(){
		guard let email = self.emailTF.text, self.emailTF.text != "" else{
			self.profileUpdate()
			return
		}
		
		
		guard self.personalDetails?.objCustomer?.customerEmail != email else{
			self.profileUpdate()
			return
		}
		
		self.viewmodels.mobileNumberExistancy(userName: email){ result in
			if result{
				self.profileUpdate()
			}
		}
	}
	
	private func profileUpdate(){
		let email = self.emailTF.text == self.personalDetails?.objCustomer?.customerEmail ? nil : self.emailTF.text
		let mobileNumber = self.mobileNumberTF.text == self.personalDetails?.objCustomer?.customerMobile ? nil : self.emailTF.text
		if let email , let mobileNumber{
			self.goToOTPPage(email: email, mobileNumber: mobileNumber)
		}else{
			self.personalDetailsSavingApi()
		}
		
	}
	
	private func personalDetailsSavingApi(){
		let spouceData : [String : Any] = spouceData(dob: self.spouceDOBTF.text ?? "", name: self.spouceNameTF.text ?? "")
		
		let child1 = self.childDataRequest(gender: self.child1GenderTF.text ?? "", dob: self.child1_DOBTF.text ?? "", name: self.child1TF.text ?? "")
		
		let child2 = self.childDataRequest(gender: self.child2_GenderTF.text ?? "", dob: self.child2_DOBTF.text ?? "", name: self.child2NameTF.text ?? "")
		
		let child3 = self.childDataRequest(gender: self.child3_GenderTF.text ?? "", dob: self.child3_DOBTF.text ?? "", name: self.child3NameTF.text ?? "")
		
		var customerfamilyList : [[String: Any]] = []
		if spouceData.count > 0{
			customerfamilyList.append(spouceData)
		}
		if child1.count > 0{
			customerfamilyList.append(child1)
		}
		if child2.count > 0{
			customerfamilyList.append(child2)
		}
		if child3.count > 0{
			customerfamilyList.append(child3)
		}
		
		let request : [String : Any] = [
			"ActionType": 9,
			"ActorId": Constants.userID,
			"CustomerFamilyList": customerfamilyList,
			"ObjCustomerDetails": [
				"JAnniversary": DateFormat.shared.customDateFormat(date: self.anniversaryDateTF.text ?? "",fromDate: "dd/MM/yyyy",toDate: "yyyy-MM-dd"),
				"MaritalStatus": self.personal.maritalStatus,
				"WhatsAppNumber": self.whatsappNumberTF.text ?? ""
			],
			"ObjCustomerJson":[
				"Address1": self.firmAddressTF.text ?? "",
				"Address2": self.temporaryAddressTF.text ?? "",
				"Address3": self.permanentAddressTF.text ?? "",
				"CityId": self.personal.cityId,
				"DistrictId": self.personal.districtID,
				"Email": self.emailTF.text ?? "",
				"FirstName": self.fullNameTF.text ?? "",
				"DOB": DateFormat.shared.customDateFormat(date: self.dobTF.text ?? "",fromDate: "dd/MM/yyyy",toDate: "yyyy-MM-dd"),
				"Mobile": self.mobileNumberTF.text ?? "",
				"StateId": self.personal.stateID,
				"Zip": self.pinCodeTF.text ?? ""
			]
		]
		
		print(request)
		
		self.viewmodels.personalDetailsSavingApi(param: request)
	}
	
	func childDataRequest(gender: String,dob: String,name: String) -> [String : Any]{
		guard gender != "" || dob != "" || name != "" else{
			return [:]
		}
		
		var childData: [String : Any] = [:]
		
		childData["ChildGender"] = gender
		childData["FamilyMemberBirthday"] = DateFormat.shared.customDateFormat(date: dob,fromDate: "dd/MM/yyyy",toDate: "yyyy-MM-dd")
		childData["FamilyMemberName"] = name
		if gender == "Male"{
			childData["Relationship"] = "Son"
		}else if gender == "Female"{
			childData["Relationship"] = "Daughter"
		}else{
			childData["Relationship"] = ""
		}
		
		return childData
	}
	
	func spouceData(dob: String,name: String) -> [String : Any]{
		guard dob != "" || name != "" else{
			return [:]
		}
		var childData: [String : Any] = [:]

		childData["FamilyMemberBirthday"] = DateFormat.shared.customDateFormat(date: dob,fromDate: "dd/MM/yyyy",toDate: "yyyy-MM-dd")
		childData["FamilyMemberName"] = name
		childData["Relationship"] = "Spouce"
		return childData
	}
}


extension iOS_CL_Cus_ProfilePersonalDetailsVC: RegisterOTPVC_Delegate{
	func otpValidateSuccess() {
		self.personalDetailsSavingApi()
	}
}
