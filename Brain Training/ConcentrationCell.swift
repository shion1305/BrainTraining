
import UIKit

class SampleButton: UIButton {
    
    let onImage = UIImage(named: "image")
    let offImage = UIImage(named: "image2")
    
    var isTapped: Bool = false {
        didSet {
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isTapped = false
        self.setImage(offImage, for: .Normal)
        self.addTarget(self, action: Selector(("tapButton:")), forControlEvents: UIControlEvents.touchUpInside)
    }1
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        self.addTarget(self,action:"tapButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isTaped = false
    }
    
    func tapButton(sender: UIButton) {
        if sender == self {
            isTapped = !isTapped
        }
    }
}





////
////  ConcentrationCell.swift
////  Brain Training
////
////  Created by 海城高校情報科 on 2018/08/23.
////  Copyright © 2018年 海城高校情報科. All rights reserved.
////
//
//import UIKit
//
//class ConcentrationCell: UIButton {
//    var a = 1
//
//    override init(frame: CGRect) {
//
//        super.init(frame: frame)
//
//        let button = UIButton(frame: CGRectZero) { () -> Void in
//            self.a *= 2
//        }
//        self.addSubview(button)
//
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
