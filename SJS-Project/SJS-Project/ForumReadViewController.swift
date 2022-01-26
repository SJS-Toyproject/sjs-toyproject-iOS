//
//  ForumReadController.swift
//  SJS-Project
//
//  Created by 정수범 on 2022/01/25.
//

import UIKit

class ForumReadViewController: UIViewController {
    
    // 데이터를 저장하는 변수
    var param: ForumData?
    
    @IBOutlet weak var subject: UILabel!        // 제목
    @IBOutlet weak var content: UITextView!     // 내용
    @IBOutlet weak var regdate: UILabel!        // 작성일
    
    override func viewDidLoad() {
        self.subject.text = param?.title
        self.content.text = param?.content
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        self.regdate.text = formatter.string(from: (param?.regdate)!)
    }
}
