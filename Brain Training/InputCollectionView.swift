//
//  CollectionViewCell.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/18.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit

class InputCollectionView: UICollectionViewCell {
    @IBOutlet weak var numLabel: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //this restores default informarion for cell in collectionview
    }
}
