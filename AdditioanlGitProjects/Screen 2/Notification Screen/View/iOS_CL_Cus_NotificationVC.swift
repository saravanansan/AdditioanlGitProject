//
//  iOS_CL_Cus_NotificationVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 23/10/24.
//

import UIKit
import SDWebImage

class iOS_CL_Cus_NotificationVC: UIViewController {
	@IBOutlet weak var nodatafoundLbl: UILabel!
	@IBOutlet weak var notificationListTV: UITableView!
	
	var notificationList = [LstPushHistoryJson]()
	
	var nodataFound : NoDataFound?
	var viewModel : NotificationVM_InputProtocol
	init(viewModel: NotificationVM_InputProtocol){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.nodataFound = NoDataFound(view: self.notificationListTV)
		self.tableViewConfig()
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.viewModel.getNotificationListApi()
	}

	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
}


extension iOS_CL_Cus_NotificationVC: UITableViewDataSource,UITableViewDelegate{
	private func tableViewConfig(){
		self.notificationListTV.register(iOS_CL_Cus_NotificationListTVCell.nib(), forCellReuseIdentifier: iOS_CL_Cus_NotificationListTVCell.identifier)
		self.notificationListTV.delegate = self
		self.notificationListTV.dataSource = self
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.notificationList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_NotificationListTVCell.identifier, for: indexPath) as? iOS_CL_Cus_NotificationListTVCell
		guard let cell else{
			return UITableViewCell()
		}

		let data = self.notificationList[indexPath.row]
		cell.messgaeLbl.numberOfLines = 0
		cell.notificationTitleLbl.text = data.title ?? ""
		cell.messageDateLbl.text = data.jCreatedDate ?? ""
		let imageUrl = URL(string: "\(API_Url_Constant.shared.PROMO_IMG)\(data.imagesURL ?? "")")
		if (data.imagesURL ?? "") != ""{
			cell.imageURL = imageUrl
		}
		cell.readMoreLbl.isHidden = true
		if data.isRead == 0{
//			cell.bgView.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.2)
			cell.bgView.backgroundColor = AppColor.customeGray
			cell.statusimage.tintColor = .lightGray
		}else{
			cell.bgView.backgroundColor = AppColor.customeGray
			cell.statusimage.tintColor = .systemGreen
		}
		if (data.pushMessage?.count ?? 0) > 100{
			cell.readMoreLbl.isHidden = false
		}else{
			cell.readMoreLbl.isHidden = true
		}
		
		if data.isExpanded{
			cell.messgaeLbl.text = data.pushMessage ?? ""
		}else{
			cell.messgaeLbl.text = "\((data.pushMessage ?? "").prefix(90))"
		}
		cell.readMoreLbl.text = data.isExpanded ? "Less" : "More"
		cell.notificationImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "Logo"))
			
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.notificationList[indexPath.row].isExpanded = !self.notificationList[indexPath.row].isExpanded

		let data = self.notificationList[indexPath.row]
		if data.isRead == 0{
			self.notificationList[indexPath.row].isRead = 1
			self.viewModel.notificationReadApi(pushID: "\(data.pushHistoryId ?? 0)")
		}
		
		self.notificationListTV.reloadRows(at: [indexPath], with: .fade)
	}
	
	
	func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		
		let data = self.notificationList[indexPath.row]
		
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {
			(action, sourceView, completionHandler) in
			guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
				self.MotionToast(message: "No Internet connection!", toastType: .error)
				return
			}
			self.viewModel.notificationDeleteApi(pushID: "\(data.pushHistoryId ?? 0)")
			self.notificationList.remove(at: indexPath.row)
			self.notificationListTV.reloadData()
			completionHandler(true)
		})
		
		
		deleteAction.backgroundColor = UIColor.red
		deleteAction.image =  UIImage(systemName: "trash")
		let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
		swipeConfiguration.performsFirstActionWithFullSwipe = true
		return swipeConfiguration
	}
	
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let data = self.notificationList[indexPath.row]
		
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {
			(action, sourceView, completionHandler) in
			guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
				self.MotionToast(message: "No Internet connection!", toastType: .error)
				return
			}
			self.viewModel.notificationDeleteApi(pushID: "\(data.pushHistoryId ?? 0)")
			self.notificationList.remove(at: indexPath.row)
			self.notificationListTV.reloadData()
			completionHandler(true)
		})
		deleteAction.backgroundColor = UIColor.red
		deleteAction.image =  UIImage(systemName: "trash")
		let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
		swipeConfiguration.performsFirstActionWithFullSwipe = true
		return swipeConfiguration
	}
}

extension iOS_CL_Cus_NotificationVC: NotificationVM_OutputProtocol{
	func notificationListResponse(result: NotificationListModels) {
		self.notificationList = result.lstPushHistoryJson ?? []
		
		if self.notificationList.count > 0{
			self.nodataFound?.hideNoDataFound()
		}else{
			self.nodataFound?.showNoDataFound()
		}
		self.notificationListTV.reloadData()
	}
	
	
}


extension iOS_CL_Cus_NotificationVC :NotificationHistoryDelegate{
	func didSelectImageDetails(imageURL: URL) {
		let vc = ImageDetailsViewVC()
		vc.imgURL = imageURL
		vc.modalTransitionStyle = .crossDissolve
		vc.modalPresentationStyle = .overFullScreen
		self.present(vc, animated: true)
	}
	
}
