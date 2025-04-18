//
//  iOS_CL_TopicListVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit

protocol TopicNameDelegate{
	func updateTopicName(topicName: String, topicID: Int)
}


class iOS_CL_TopicListVC: AppViewController {

	
	@IBOutlet weak var heightOfTV: NSLayoutConstraint!
	@IBOutlet weak var selectTopicInfoLbl: UILabel!
	@IBOutlet weak var topicListTV: UITableView!
	
	
	var delegate: TopicNameDelegate?
	var helpTopicList = [DropdownDataModels]()
	var selectedStatusID = -1
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.initalCommit()
    }

	@IBAction func didSelectCloseBtn(_ sender: UIButton) {
		self.dismiss(animated: true)
	}
	
	
	private func initalCommit(){
		self.topicListTV.register(iOS_CL_Cus_TopicListTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_TopicListTVC.identifier)
		self.topicListTV.delegate = self
		self.topicListTV.dataSource = self
	}
	
	
}



extension iOS_CL_TopicListVC: UITableViewDelegate,UITableViewDataSource{
	
	//MARK: Tableview Delegate method:-
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let rowNumber = self.helpTopicList.count
		let height = rowNumber * 50
		let maxheight = Int(self.view.frame.height - 160)
		DispatchQueue.main.async {
			height <= maxheight ? (self.heightOfTV.constant = CGFloat(height)) : (self.heightOfTV.constant = CGFloat(maxheight))
		}
		return rowNumber
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_TopicListTVC.identifier, for: indexPath) as? iOS_CL_Cus_TopicListTVC
		guard let cell else{
			fatalError("Tableview cell initialization failed")
		}
		tableView.separatorStyle = .none
		let data = self.helpTopicList[indexPath.row]
		cell.topicNameLbl.text = self.helpTopicList[indexPath.row].statusName ?? ""
		if self.selectedStatusID == data.statusId{
			cell.bgView.backgroundColor = AppColor.yellow1?.withAlphaComponent(0.16)
		}else{
			cell.bgView.backgroundColor = .white
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let data = self.helpTopicList[indexPath.row]
		self.delegate?.updateTopicName(topicName: data.statusName ?? "", topicID: data.statusId ?? -1)
		self.dismiss(animated: true)
	}
}
