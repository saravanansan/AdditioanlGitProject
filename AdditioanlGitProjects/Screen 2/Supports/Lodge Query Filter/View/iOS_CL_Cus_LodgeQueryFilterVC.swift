//
//  iOS_CL_Cus_LodgeQueryFilterVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit


protocol LodgeQueryFilterDelegate: AnyObject{
	func didSelectFilter(filterData: LodgeQueryFilterModels)
}


class iOS_CL_Cus_LodgeQueryFilterVC: AppViewController {

	
	@IBOutlet weak var filgterImage: UIImageView!
	@IBOutlet weak var filterView: UIViewDesignable!
	@IBOutlet weak var fromDateTF: UITextField!
	@IBOutlet weak var toDateTF: UITextField!
	@IBOutlet weak var statusNameTF: UITextField!

	let Requiredformatter = DateFormatter()
	
	var delegate: LodgeQueryFilterDelegate?
	
	var filterData = LodgeQueryFilterModels()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		Requiredformatter.dateFormat = filterData.dateFormat.rawValue
		self.applySwipeGesture()
		self.initalCommit()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.animateIn()
	}
	
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		self.filterView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else{return}
		if touch.view == self.view
		{
			self.animateOut(){}
		}
		
	}
	
	@IBAction func didSelectFilterCloseBtn(_ sender: UIButton) {
		self.animateOut(){}
	}
	
	@IBAction func didSelectFromDate(_ sender: UIButton) {
		self.routeToDatePicker(date: fromDateTF.text ?? "", datePicker: .fromDate,cate: .otherDate)
		
	}
	
	@IBAction func didSelectToDate(_ sender: UIButton) {
		self.routeToDatePicker(date: toDateTF.text ?? "", datePicker: .toDate,cate: .otherDate)
		
		
	}
	
	@IBAction func didSelectStatus(_ sender: UIButton) {
		self.navigateToDropdown(data: self.filterData.filterStatusList, searchBarIsHidden: true)
	}
	
	@IBAction func didSelectFilterBtn(_ sender: GradientButton) {
		
		if self.filterData.statusName == "" && self.filterData.fromDate == "" && self.filterData.toDate == ""{
			self.MotionToast(message: "Please select either status or date or select to both to filter!", toastType: .error)
		}else if self.filterData.fromDate == "" && self.filterData.toDate != ""{
			self.MotionToast(message: "Please select the from date!", toastType: .error)
		}else if self.filterData.fromDate != "" && self.filterData.toDate == ""{
			self.MotionToast(message: "Please select to date!", toastType: .error)
		}else{
			self.delegate?.didSelectFilter(filterData: self.filterData)
			self.animateOut(){}
		}
	}
	
	@IBAction func didSelectResetBtn(_ sender: UIButtonDesignable) {
		self.resetData()
		self.delegate?.didSelectFilter(filterData: self.filterData)
		self.animateOut(){}
	}
	
}


//MARK: Open and closing Animation
extension iOS_CL_Cus_LodgeQueryFilterVC{
	private func applySwipeGesture() {
		let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDismiss))
		swipeGesture.direction = .down
		self.filterView.addGestureRecognizer(swipeGesture)
	}
	
	@objc private func swipeToDismiss() {
		let height = filterView.bounds.height
		let bottomSpace = self.view.superview?.safeAreaInsets.bottom
		UIView.animate(withDuration: 0.6, animations: { [weak self] in
			self?.view.backgroundColor = .black.withAlphaComponent(0)
			self?.filgterImage.transform = CGAffineTransform(rotationAngle: .zero)
			self?.filterView.transform = CGAffineTransform(translationX: 0, y: (height - 50 - (bottomSpace ?? 0)))
		}, completion: { [weak self] _ in
			self?.dismiss(animated: false)
		})
	}
	
	
	 private func animateOut(completion: @escaping () -> ()) {
		 let height = filterView.bounds.height
		  let bottomSpace = self.view.superview?.safeAreaInsets.bottom
		 UIView.animate(withDuration: 0.6, animations: { [weak self] in
			  self?.filgterImage.transform = CGAffineTransform(rotationAngle: .zero)
			 self?.view.backgroundColor = .black.withAlphaComponent(0)
			 self?.filterView.transform = CGAffineTransform(translationX: 0, y: (height - 50 - (bottomSpace ?? 0)))
		 }, completion: { [weak self] _ in
			 completion()
			 self?.dismiss(animated: false)
		 })
	}
	
	private func animateIn() {
		let bottomSpace = self.view.superview?.safeAreaInsets.bottom
		self.view.backgroundColor = .clear
		let height = filterView.bounds.height
		filterView.transform = CGAffineTransform(translationX: 0, y: (height - 70 - (bottomSpace ?? 40)))
		UIView.animate(withDuration: 0.6) { [weak self] in
			self?.filterView.transform = .identity
			self?.view.backgroundColor = .black.withAlphaComponent(0.4)
			self?.filgterImage.transform = CGAffineTransform(rotationAngle: .pi)
		}
	}
}

extension iOS_CL_Cus_LodgeQueryFilterVC{
	private func initalCommit(){
		self.statusNameTF.text = self.filterData.statusName
		self.fromDateTF.text = self.filterData.fromDate
		self.toDateTF.text = self.filterData.toDate
	}
	
	private func resetData(){
		self.statusNameTF.text = ""
		self.fromDateTF.text = ""
		self.toDateTF.text = ""
		self.filterData.statusID = -1
		
		self.filterData.statusName = ""
		self.filterData.fromDate = ""
		self.filterData.toDate = ""
		
	}
	
}


//MARK: Date picker configure
extension iOS_CL_Cus_LodgeQueryFilterVC: DatePickerDelegate{
	func routeToDatePicker(date: String,datePicker : LodgeQueryFilterModels.DatePickerCategorys,cate: DatePickerCategory = .otherDate){
		DispatchQueue.main.async {
			let vc = iOS_CL_Cus_DatePickerVC()
			vc.modalTransitionStyle = .crossDissolve
			vc.modalPresentationStyle = .overFullScreen
			vc.delegate = self
			vc.itsComefrom = cate
			vc.selectedDate = date //toDate
			self.filterData.datePickerType = datePicker //.toDate
			vc.dateFormatValue = self.filterData.dateFormat
			self.present(vc, animated: true)
		}
	}

	
	func didUpdateDate(date: String) {
		switch self.filterData.datePickerType{
		case .fromDate:
				self.dateValidation(fromDate: date, todate: self.filterData.toDate)
		case .toDate:
				self.dateValidation(fromDate: self.filterData.fromDate, todate: date)
			
		}
	}
	
	private func dateValidation(fromDate: String,todate: String){
		guard let fromDate1 = Requiredformatter.date(from: fromDate) else{
			datebind()
			return
		}
		
		guard let todate1 = Requiredformatter.date(from: todate) else{
			datebind()
			return
		}
		
		if todate1 >= fromDate1{
			datebind()
		}else{
			self.MotionToast(message: "From date should smaller than todate", toastType: .error)
		}
		
		func datebind(){
			self.filterData.fromDate = fromDate
			self.fromDateTF.text = fromDate
			self.toDateTF.text = todate
			self.filterData.toDate = todate
		}
		
	}
	
	@frozen enum DatePickerCategorys{
		case fromDate
		case toDate
	}
}


//MARK: Dropdown configure
extension iOS_CL_Cus_LodgeQueryFilterVC: SearchableDropDownDelegate{
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
	
	func selectedDropdownData(statusName: String?, statusId: Int?) {
		self.filterData.statusID = statusId ?? -2
		self.filterData.statusName = statusName ?? ""
		self.statusNameTF.text = statusName ?? ""
	}
}
