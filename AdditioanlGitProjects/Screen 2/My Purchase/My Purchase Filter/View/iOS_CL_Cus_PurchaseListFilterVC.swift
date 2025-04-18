//
//  iOS_CL_Cus_PurchaseListFilterVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 23/10/24.
//

import UIKit

protocol MyPuchaseListFilterDelegate{
	func didSelectFilter(filterData: MyPurchaseFilterModels)
}


class iOS_CL_Cus_PurchaseListFilterVC: AppViewController {

	@IBOutlet weak var headingView: GradientView!
	@IBOutlet weak var filterImage: UIImageView!
	@IBOutlet weak var filterView: UIViewDesignable!
	@IBOutlet weak var fromDateTF: UITextField!
	@IBOutlet weak var toDateTF: UITextField!
	
	var delegate: MyPuchaseListFilterDelegate?
	var filterData = MyPurchaseFilterModels()
	let Requiredformatter = DateFormatter()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		Requiredformatter.dateFormat = filterData.dateFormat.rawValue
		self.applySwipeGesture()
		self.initalCommit()
        // Do any additional setup after loading the view.
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

	
	@IBAction func didSelectTodateBtn(_ sender: UIButton) {
		self.routeToDatePicker(date: toDateTF.text ?? "", datePicker: .toDate,cate: .otherDate)
	}
	
	@IBAction func didSelectFilterBtn(_ sender: GradientButton) {
		if self.filterData.fromDate == "" && self.filterData.toDate == ""{
			self.MotionToast(message: "Please select date range!", toastType: .error)
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
extension iOS_CL_Cus_PurchaseListFilterVC{
	private func applySwipeGesture() {
		let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDismiss))
		swipeGesture.direction = .down
		self.headingView.addGestureRecognizer(swipeGesture)
	}
	
	@objc private func swipeToDismiss() {
		let height = filterView.bounds.height
		let bottomSpace = self.view.superview?.safeAreaInsets.bottom
		UIView.animate(withDuration: 0.6, animations: { [weak self] in
			self?.filterImage.transform = CGAffineTransform(rotationAngle: .zero)
			self?.view.backgroundColor = .black.withAlphaComponent(0)
			self?.filterView.transform = CGAffineTransform(translationX: 0, y: (height - 50 - (bottomSpace ?? 0)))
		}, completion: { [weak self] _ in
			self?.dismiss(animated: false)
		})
		 
	}
	
	
	 private func animateOut(completion: @escaping () -> ()) {
		let height = filterView.bounds.height
		 let bottomSpace = self.view.superview?.safeAreaInsets.bottom
		 UIView.animate(withDuration: 0.6, animations: { [weak self] in
			 self?.filterImage.transform = CGAffineTransform(rotationAngle: .zero)
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
			self?.filterImage.transform = CGAffineTransform(rotationAngle: .pi)
		}
	}
}


extension iOS_CL_Cus_PurchaseListFilterVC{
	private func initalCommit(){
		self.fromDateTF.text = self.filterData.fromDate
		self.toDateTF.text = self.filterData.toDate
	}
	
	private func resetData(){
		self.fromDateTF.text = ""
		self.toDateTF.text = ""
		
		self.filterData.fromDate = ""
		self.filterData.toDate = ""
	}
}


//MARK: Date picker configure
extension iOS_CL_Cus_PurchaseListFilterVC: DatePickerDelegate{
	func routeToDatePicker(date: String,datePicker : MyPurchaseFilterModels.DatePickerCategorys,cate: DatePickerCategory = .otherDate){
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
