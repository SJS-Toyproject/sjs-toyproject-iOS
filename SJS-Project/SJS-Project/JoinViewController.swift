//
//  JoinViewController.swift
//  SJS-Project
//
//  Created by 정수범 on 2022/01/24.
//

import UIKit
import Alamofire

class JoinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var birthdayField: UITextField!
    let birthdayPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createDatePickerView()
    }
    
    // 생일 DatePicker 생성
    func createDatePickerView() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        birthdayPicker.preferredDatePickerStyle = .wheels
        birthdayPicker.datePickerMode = .date
        
        birthdayField.inputAccessoryView = toolbar
        birthdayField.inputView = birthdayPicker
    }
    
    // 생일 DatePicker의 done 버튼이 눌렸을 때
    @objc func donePressed() {
        let formatter = DateFormatter()
        
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy/MM/dd"
        
        birthdayField.text = formatter.string(from: birthdayPicker.date)
        self.view.endEditing(true)
    }
    
}
