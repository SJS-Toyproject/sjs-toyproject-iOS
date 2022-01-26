//
//  ForumCell.swift
//  SJS-Project
//
//  Created by 정수범 on 2022/01/25.
//

import UIKit

class ForumCell: UITableViewCell {

    @IBOutlet weak var subject: UILabel!            // 글의 제목
    @IBOutlet weak var profileImage: UIImageView!   // 작성자 프로필 사진
    @IBOutlet weak var writer: UILabel!             // 작성자 이름
    @IBOutlet weak var regdate: UILabel!            // 작성일
    @IBOutlet weak var img: UIImageView!            // 이미지

}
