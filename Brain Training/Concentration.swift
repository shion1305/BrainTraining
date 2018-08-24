//
//  Concentration.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/23.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit

class Concentration: UIViewController {
    internal var isDefined: Bool=false;
    internal var numElement_pre = 0
    internal var randomInt = [Int](repeating: 0, count: 25)
    internal var cell_sort_by_number = [[Int]](repeating: [0,0], count: 13)
    internal var pre_randomInt = [Int](repeating: 0, count: 25)
    internal var special = (Int)(arc4random_uniform(13)+1)
    internal var cells : [UIButton] = []
    internal var openStatement : [Int] = [0,0]
    internal var cleared : [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    internal var timeFailed :Int = 0
    @IBOutlet weak var Cell1: UIButton!
    @IBOutlet weak var Cell2: UIButton!
    @IBOutlet weak var Cell3: UIButton!
    @IBOutlet weak var Cell4: UIButton!
    @IBOutlet weak var Cell5: UIButton!
    @IBOutlet weak var Cell6: UIButton!
    @IBOutlet weak var Cell7: UIButton!
    @IBOutlet weak var Cell8: UIButton!
    @IBOutlet weak var Cell9: UIButton!
    @IBOutlet weak var Cell10: UIButton!
    @IBOutlet weak var Cell11: UIButton!
    @IBOutlet weak var Cell12: UIButton!
    @IBOutlet weak var Cell13: UIButton!
    @IBOutlet weak var Cell14: UIButton!
    @IBOutlet weak var Cell15: UIButton!
    @IBOutlet weak var Cell16: UIButton!
    @IBOutlet weak var Cell17: UIButton!
    @IBOutlet weak var Cell18: UIButton!
    @IBOutlet weak var Cell19: UIButton!
    @IBOutlet weak var Cell20: UIButton!
    @IBOutlet weak var Cell21: UIButton!
    @IBOutlet weak var Cell22: UIButton!
    @IBOutlet weak var Cell23: UIButton!
    @IBOutlet weak var Cell24: UIButton!
    @IBOutlet weak var Cell25: UIButton!
    internal var listFailed: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cells = [Cell1, Cell2, Cell3, Cell4, Cell5, Cell6, Cell7, Cell8, Cell9, Cell10, Cell11, Cell12, Cell13, Cell14, Cell15, Cell16, Cell17, Cell18, Cell19, Cell20, Cell21, Cell22, Cell23, Cell24, Cell25]
        
        for i:Int in 1..<14{
            if i==special{
                pre_randomInt[numElement_pre]=i
                numElement_pre = numElement_pre+1
            }else{
                pre_randomInt[numElement_pre]=i
                numElement_pre = numElement_pre+1
                pre_randomInt[numElement_pre]=i
                numElement_pre = numElement_pre+1
            }
            print(pre_randomInt)
        }
        
        for i in 0..<25{
            let x = UInt32.init(25-i)
            let n :Int = (Int)(arc4random_uniform(x))
            randomInt[i] = pre_randomInt[n]
            pre_randomInt.remove(at: n)
            
        }
        print(randomInt)
        
        for i in 0..<25{
            if cell_sort_by_number[randomInt[i]-1][0]==0{
                cell_sort_by_number[randomInt[i]-1][0] = i+1
            }else{
                cell_sort_by_number[randomInt[i]-1][1] = i+1
            }
        }
        print(cell_sort_by_number)
        
        for i in 0..<25{
            cells[i].layer.borderColor = UIColor.black.cgColor
            cells[i].layer.borderWidth = 2
            cells[i].setTitle("", for: UIControlState.normal)
            cells[i].setTitleColor(UIColor.blue, for: .normal)
            cells[i].addTarget(self, action: #selector(Concentration.onClick(sender: )), for: .touchDown)
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onClick(sender: UIButton){
        if type(of: sender) == UIButton.self{
            let senderName: Int = Identification(sender: sender)
            if cleared[Identification(sender: sender)] == false {
                if openStatement[0]==0{
                    sender.setTitle(String(randomInt[senderName]), for: .normal)
                    openStatement[0] = senderName+1
                }else if openStatement[1]==0{
                    if (senderName+1) != openStatement[0]{
                        sender.setTitle(String(randomInt[senderName]), for: .normal)
                        openStatement[1] = senderName+1
                        if randomInt[senderName]==randomInt[openStatement[0]-1]{
                            print("Cleared!!")
                            cleared[senderName]=true
                            cleared[openStatement[0]-1]=true
                            sender.setTitleColor(UIColor.red, for: .normal)
                            cells[openStatement[0]-1].setTitleColor(UIColor.red, for: .normal)
                            if checkClear(){
                                present((self.storyboard?.instantiateViewController(withIdentifier: "ConcentrationResult"))!, animated: true,completion: nil)
                            }
                        }else{
                            print("Failed")
//                            if (sender.titleLabel?.textColor == UIColor.blue) && (cells[openStatement[0]-1].titleLabel?.textColor == UIColor.blue){
//                                sender.titleLabel?.textColor=UIColor.yellow
//                                sender.titleLabel?.textColor=UIColor.yellow
//                                print("SHION")
//                            }else if (sender.titleLabel?.textColor == UIColor.blue) && (cells[openStatement[0]-1].titleLabel?.textColor == UIColor.yellow){
//                                sender.titleLabel?.textColor=UIColor.yellow
//                                sender.titleLabel?.textColor=UIColor.blue
//                                if arc4random_uniform(2)==0{
//                                    let n = Int((cells[openStatement[0]-1].titleLabel?.text)!)!
//                                    print(cell_sort_by_number[Int((cells[openStatement[0]-1].titleLabel?.text)!)!][1])
////                                    cell_sort_by_number[Int((cells[openStatement[0]-1].titleLabel?.text)!)!] = special
//                                    special = n
//
//                                }else{
//                                    let n = randomInt[Int((cells[openStatement[0]-1].titleLabel?.text)!)!]
//                                    randomInt[Int((cells[openStatement[0]-1].titleLabel?.text)!)!] = special
//                                    special = n
//                                }
//                                reconpile()
//                            }
                        }
                    }
                }else{
                    if cleared[openStatement[0]-1]==false && cleared[openStatement[0]-1]==false{
                        cells[openStatement[0]-1].setTitle("", for: .normal)
                        cells[openStatement[1]-1].setTitle("", for: .normal)
                    }
                    sender.setTitle(String(randomInt[Identification(sender: sender)]), for: .normal)
                    openStatement=[Identification(sender: sender)+1, 0]
                }
            }
        }
    }
    
    func Identification(sender : UIButton) -> Int {
        var result: Int? = nil
        for i in 0..<25{
            if cells[i]==sender{
                result=i
            }
        }
        print(result)
        return result!
    }
    
    func checkClear() -> Bool{
        var numClear : Int = 0
        for i in 0..<25{
            if cleared[i]==true{
                numClear+=1
            }
        }
        if numClear==24{
            return true
        }else{
            return false
        }
    }
    
    func reconpile(){
        for i in 0..<25{
            if cell_sort_by_number[randomInt[i]-1][0]==0{
                cell_sort_by_number[randomInt[i]-1][0] = i+1
            }else{
                cell_sort_by_number[randomInt[i]-1][1] = i+1
            }
        }
//        for i in 0..<25{
//            cells[i].layer.borderWidth = 2
//            cells[i].setTitle("", for: UIControlState.normal)
//            cells[i].addTarget(self, action: #selector(Concentration.onClick(sender: )), for: .touchDown)
//        }
    }
}
