//
//  HomeCollectionViewCell.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/19.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Title: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
