//
//  ForumWriteController.swift
//  SJS-Project
//
//  Created by 정수범 on 2022/01/25.
//

import UIKit

class ForumWriteViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var titleOfPost: UITextField!    // 글 제목
    @IBOutlet weak var contentOfPost: UITextView!   // 글 내용
    
    override func viewDidLoad() {
        contentOfPost.textColor = UIColor.lightGray
        contentOfPost.text = "내용을 입력하세요"
        contentOfPost.delegate = self
    }
    
    // 저장 버튼 눌렀을 때
    @IBAction func save(_ sender: Any) {
        // 내용을 입력하지 않았을 때 경고창을 띄운다.
        guard self.contentOfPost.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        // ForumData 객체를 생성하고 데이터를 담는다.
        let data = ForumData()
        
        data.title = titleOfPost.text       // 제목
        data.regdate = Date()               // 작성일
        data.content = contentOfPost.text   // 내용
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.forumList.append(data)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
}

extension ForumWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 입력하세요"
            textView.textColor = UIColor.lightGray
        }
    }
}
