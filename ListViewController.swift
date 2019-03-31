//
//  ListViewController.swift
//  cell展开练习
//
//  Created by 方瑾 on 2019/2/13.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit
let friendInfos : [(name:String,address:String,details:[String])] = [("王健林","北京",["给自己定一个目标...","csdc","cdds"]),
                                                                     ("马化腾","北京",["给自己定一个目标...","csdc","cdds"]),
                                                                     ("董明珠","北京",["格力...","csdc","cdds"]),
                                                                     ("马云","北京",["我不爱钱...","csdc","cdds"]),
                                                                     ("王健林","北京",["给自己定一个目标...","csdc","cdds"]),
                                                                     ("马化腾","北京",["给自己定一个目标...","csdc","cdds"]),
                                                                     ("董明珠","北京",["格力...","csdc","cdds"]),
                                                                     ("马云","北京",["我不爱钱...","csdc","cdds"]),
                                                                     ("王健林","北京",["给自己定一个目标...","csdc","cdds"]),
                                                                     ("马化腾","北京",["给自己定一个目标...","csdc","cdds"]),
                                                                     ("董明珠","北京",["格力...","csdc","cdds"]),
                                                                     ("马云","北京",["我不爱钱...","csdc","cdds"]),
                                                                     ("王健林","北京",["给自己定一个目标...","csdc","cdds"]),
                                                                     ("马化腾","北京",["给自己定一个目标...","csdc","cdds"]),
                                                                     ("董明珠","北京",["格力...","csdc","cdds"]),
                                                                     ("马云","北京",["我不爱钱...","csdc","cdds"])]



class ListViewController: UIViewController {
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    var isExpanded = true
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
        avatarImageView.layer.masksToBounds = true
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        avatarImageView.image = UIImage(named: "王健林")
        nameLabel.text = "王健林"
        detailLabel.text = "房地产"

        
    }
    

    
  
}
extension ListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendInfos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell",for:indexPath) as! InfoTableViewCell
        cell.row = indexPath.row   //每行显示什么
//        cell.nameLabel.text = friendInfos[indexPath.row].name
//        cell.addressLabel.text = friendInfos[indexPath.row].address
        cell.row = indexPath.row
        cell.setupData()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isExpanded {
            return 120
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let myView = UIView()         //
//        let subLabel : UILabel = {
//            let label = UILabel()
//            label.frame = CGRect(x: 10, y: 10, width: 60, height: 20)
//            label.backgroundColor = .green
//            label.text = "TEST"
//            return label
//        }()
//        myView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80)
//        myView.backgroundColor = .red
//        myView.addSubview(subLabel)//在一个视图上添加一个子视图
//        return myView
        let headerView = ExpandableHeaderView()
        headerView.headerDelegate = self
        headerView.titleLabel.text = "第\(section+1)个section"
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
}
extension ListViewController: ExpandaCellDelegate {
    func expandaCells() {
        isExpanded = !isExpanded
//        friendsTableView.reloadData()  //为了把改变的画面显示出来
        //逐行刷新tableView
        friendsTableView.beginUpdates()//开始更新
        friendsTableView.endUpdates()//结束更新
        for i in 0..<friendInfos.count {
            friendsTableView.reloadRows(at: [IndexPath(row: i, section: 0)], with: .automatic)//自动动画效果
        }
    }
    
    
}
