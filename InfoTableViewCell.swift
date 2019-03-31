//
//  InfoTableViewCell.swift
//  cell展开练习
//
//  Created by 方瑾 on 2019/2/13.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit


class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var borderLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    var row :Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        borderLabel.layer.cornerRadius = 5
        borderLabel.layer.masksToBounds = true
        
        borderLabel.layer.borderWidth = 0.5
        borderLabel.layer.borderColor = UIColor.blue.cgColor
    }

    func setupData() {
        nameLabel.text = friendInfos[row!].name
        addressLabel.text = friendInfos[row!].address
        var text = ""
        for i in 0..<friendInfos[row!].details.count {
            text += friendInfos[row!].details[i]
        }
        detailLabel.text = text
    }

}
