//
//  ExpandableHeaderView.swift
//  cell展开练习
//
//  Created by 方瑾 on 2019/2/13.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit
//协议不属于任何一个类所以要写在外面
protocol ExpandaCellDelegate {
    func expandaCells()
}

class ExpandableHeaderView: UITableViewHeaderFooterView {
    var headerDelegate: ExpandaCellDelegate?

    let titleLabel : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 20, width: UIScreen.main.bounds.width-40, height: 40)
                                                      //(屏幕的宽)
        label.textColor = .white
        label .font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        self.contentView.backgroundColor = .yellow
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changCells))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func changCells(_ sender:UITapGestureRecognizer) {
        headerDelegate?.expandaCells()
        
    }
        
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
