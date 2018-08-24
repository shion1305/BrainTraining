//
//  TimeCountChallenge_CollectionViewCell.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/20.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit


class TimeCountChallenge_CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var TargetTime: UILabel!
    @IBOutlet weak var Result: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
