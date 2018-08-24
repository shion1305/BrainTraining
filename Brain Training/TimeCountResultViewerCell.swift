//
//  TimeCountResultViewerCell.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/21.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit

class TimeCountResultViewerCell: UITableViewCell {
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var TargetTime: UILabel!
    @IBOutlet weak var ResultTime: UILabel!
    @IBOutlet weak var Result_difference: UILabel!
    @IBOutlet weak var Rank: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
