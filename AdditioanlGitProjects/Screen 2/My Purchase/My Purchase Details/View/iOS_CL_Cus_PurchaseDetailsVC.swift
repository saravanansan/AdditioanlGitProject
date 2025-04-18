//
//  iOS_CL_Cus_PurchaseDetailsVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 22/10/24.
//

import UIKit
import MotionToastView

class iOS_CL_Cus_PurchaseDetailsVC: AppViewController {

	@IBOutlet weak var cpNameLbl: UILabel!
	@IBOutlet weak var invoiceDateLbl: UILabel!
	@IBOutlet weak var orderNumberLbl: UILabel!
	@IBOutlet weak var invoiceNumberLbl: UILabel!
	@IBOutlet weak var pointsBalLbl: UILabel!
	@IBOutlet weak var productDetailsTV: UITableView!
	
	@IBOutlet weak var taxAmountLbl: UILabel!
	@IBOutlet weak var productTotalAmountLbl: UILabel!
	
	var noDataFound: NoDataFound?
	
	
	var productDetailsList = [LstOrderListings]()
	var myPurchaseDetailsData: LstInvoiceListings?
	
	var viewModel : PurchaseDetailsVM_InputProtocol
	init(viewModel: PurchaseDetailsVM_InputProtocol){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.noDataFound = NoDataFound(view: self.productDetailsTV)
		self.productDetailsTV.register(iOS_CL_Cus_PurchaseDetailsTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_PurchaseDetailsTVC.identifier)
		self.productDetailsTV.delegate = self
		self.productDetailsTV.dataSource = self
		self.dataBind()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.viewModel.myPurchaseDetailsListApi(orderNumber: self.myPurchaseDetailsData?.orderNo ?? "", invNo: self.myPurchaseDetailsData?.invoiceNo ?? "")
	}
	
	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
		
	
	@IBAction func didSelectDownloadInv(_ sender: GradientButton) {
		self.viewModel.downloadInvoiceApi(orderNumber: self.myPurchaseDetailsData?.orderNo ?? "", invNo: self.myPurchaseDetailsData?.invoiceNo ?? "")
	}
	
}


extension iOS_CL_Cus_PurchaseDetailsVC: UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.productDetailsList.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_PurchaseDetailsTVC.identifier, for: indexPath) as? iOS_CL_Cus_PurchaseDetailsTVC
		guard let cell else{
			return UITableViewCell()
		}
		let data = self.productDetailsList[indexPath.row]
		if indexPath.row == 0{
			cell.lineLbl.isHidden = true
		}else{
			cell.lineLbl.isHidden = false
		}
		
		cell.materialNameLbl.text = data.productDetails ?? "-"
		cell.qtyLbl.text = data.quanity ?? ""
		cell.totalPointsLbl.text = data.porductAmount ?? ""
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
}


extension iOS_CL_Cus_PurchaseDetailsVC: PurchaseDetailsVM_OutputProtocol{
	func errorMessage(error: String) {
		self.MotionToast(message: error, toastType: .error)
	}
	
	func MypurchaseDetailsListResponse(result: [LstOrderListings]) {
		self.productDetailsList = result
		self.productDetailsTV.reloadData()
		if self.productDetailsList.count > 0{
			self.taxAmountLbl.text = self.productDetailsList[0].gst ?? "0"
			self.productTotalAmountLbl.text = self.productDetailsList[0].total_Amount ?? "0"
			
			self.noDataFound?.hideNoDataFound()
		}else{
			self.noDataFound?.showNoDataFound()
			self.taxAmountLbl.text = "-"
			self.productTotalAmountLbl.text = "-"
			
		}
	}
	
	private func dataBind(){
		self.cpNameLbl.text = self.myPurchaseDetailsData?.locationCode ?? "-"
		self.invoiceDateLbl.text = self.myPurchaseDetailsData?.invoiceDate ?? "-"
		self.orderNumberLbl.text = self.myPurchaseDetailsData?.orderNo ?? "-"
		self.invoiceNumberLbl.text = self.myPurchaseDetailsData?.invoiceNo ?? "-"
		self.pointsBalLbl.text = "\(self.myPurchaseDetailsData?.points ?? 0)"
	}
	
	func saveBase64StringToPDF(pdfString: String, fileName: String) {
		guard
			var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last,
			let convertedData = Data(base64Encoded: pdfString)
		else {
			return
		}
		
		documentsURL.appendPathComponent("\(fileName).pdf")
		
		do {
			try convertedData.write(to: documentsURL)
			print("PDF saved successfully at: \(documentsURL)")
			self.showSavedPdf(url: "\(documentsURL)", fileName: fileName)
		} catch {
			self.MotionToast(message: "Invoice download failed!", toastType: .error)
			print("Error saving PDF: \(error.localizedDescription)")
		}
	}
	
	
	func showSavedPdf(url: String, fileName: String) {
		do {
			let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
			let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
			
			for url in contents {
				if url.description.contains("\(fileName).pdf") {
					let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
					self.present(activityViewController, animated: true, completion: nil)
				}
			}
		} catch {
			// Handle error
			print("Error",error.localizedDescription)
			self.MotionToast(message: "Invoice download failed!", toastType: .error)
		}
	}
}
