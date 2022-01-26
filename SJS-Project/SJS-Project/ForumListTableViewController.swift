//
//  ForumListTableViewController.swift
//  SJS-Project
//
//  Created by 정수범 on 2022/01/25.
//

import UIKit

class ForumListTableViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.forumList.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.appDelegate.forumList[indexPath.row]
        
        let cellId = row.image == nil ? "forumCell" : "forumCellWithImage"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! ForumCell
        
        cell.subject?.text = row.title
        cell.profileImage?.image = row.profileImage
        cell.writer?.text = row.writer
        cell.img?.image = row.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd HH:mm"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.appDelegate.forumList[indexPath.row]
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForumRead") as? ForumReadViewController else {
            return
        }
        
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

