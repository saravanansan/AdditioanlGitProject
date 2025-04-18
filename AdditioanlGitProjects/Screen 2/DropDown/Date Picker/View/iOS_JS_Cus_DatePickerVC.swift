//
//  iOS_CL_Cus_DatePickerVC.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 17/07/24.
//

import UIKit


protocol DatePickerDelegate{
    func didUpdateDate(date: String)
}


class iOS_CL_Cus_DatePickerVC: UIViewController {

    @IBOutlet weak var datePickerView: UIDatePicker!
    
    var selectedDate = ""
    var delegate: DatePickerDelegate?
    var itsComefrom : DatePickerCategory = .otherDate
    var dateFormatValue : DateFormatString = .yyyy_mm_dd
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.datePickerConfigure()
    }

    @IBAction func didTappedOkBtn(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatValue.rawValue
        let selectedDate = formatter.string(from: datePickerView.date)
        self.delegate?.didUpdateDate(date: selectedDate)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedCancelbtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func datePickerConfigure(){
        switch itsComefrom {
        case .dob:
            datePickerView.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
        case .otherDate:
            datePickerView.maximumDate = Date()
        case .todayDate:
            print("jshvsdj")
//            datePickerView.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: today)!
            datePickerView.maximumDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        }
        
        if selectedDate != ""{
            let Requiredformatter = DateFormatter()
            Requiredformatter.dateFormat = dateFormatValue.rawValue
            if let convertedDate = Requiredformatter.date(from: selectedDate){
                datePickerView.date = convertedDate
            }
        }
    }

}

enum DatePickerCategory{
    case dob
    case otherDate
    case todayDate
}


@frozen enum DateFormatString : String{
    case dd_mm_yyyy = "dd-MM-yyyy"
    case yyyy_mm_dd = "yyyy-MM-dd"
    case mm_dd_yyyy = "MM-dd-yyyy"
    case yyyy_dd_mm = "yyyy-dd-MM"
	
	case dd_mm_yyyy_slag = "dd/MM/yyyy"
	case yyyy_mm_dd_slag = "yyyy/MM/dd"
	case mm_dd_yyyy_slag = "MM/dd/yyyy"
	case yyyy_dd_mm_slag = "yyyy/dd/MM"
}
