//
//  TimeCountChallengeResultViewer.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/20.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit

class TimeCountChallengeResultViewer: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var MessageField: UILabel!
    var result : [Double]! = Array(repeating: 0, count: 20)
    internal var resultSum : Double! = 0
    internal var targetSum : Double! = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.estimatedRowHeight=100
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Sample") as! TimeCountResultViewerCell
        cell.Title.text = String(indexPath.row+1) + "回目"
        cell.TargetTime.text = String(round(100 * result[2 * indexPath.row])/100)
        cell.ResultTime.text = String(round(10000 * result[2 * indexPath.row + 1]) / 10000)
        let resultDifference = result[2 * indexPath.row + 1] - result[2 * indexPath.row]
        let resultDifferencePercentage = round(10000 * resultDifference / result[2 * indexPath.row])/100
        cell.Result_difference.text = PlusOrMinus(double: round(resultDifference*1000)/1000) + " (" + PlusOrMinus(double:(resultDifferencePercentage)) + "%)"
        cell.Rank.text = rank(double: resultDifferencePercentage)
      
        //これより下はMessageFieldのためのコード
        
      return cell
    }
    
    @IBAction func Back_To_Home(_ sender: UIBarButtonItem) {
        present((self.storyboard?.instantiateViewController(withIdentifier: "Home"))!, animated: true, completion: nil)
    }
    
    @IBAction func Retry(_ sender: UIBarButtonItem) {
        present((self.storyboard?.instantiateViewController(withIdentifier: "TimeCountChallenge"))!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<10{
            targetSum = round(100 * result[2 * i])/100 + targetSum
            resultSum = Double(round(10000 * result[2 * i + 1]) / 10000) + resultSum
        }
        if targetSum>resultSum{
            MessageField.text = "あなたの秒感覚は"+String(round(10000 * (targetSum-resultSum)/targetSum)/100)+"%早いです。"
        }else if targetSum==resultSum{
            MessageField.text = "あなたの秒感覚は完璧です"
        }else{
            MessageField.text = "あなたの秒感覚は"+String(round(10000 * (resultSum-targetSum)/targetSum)/100)+"%遅いです。"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func PlusOrMinus(double : Double) -> String{
        if double>0{
            return "+" + String(double)
        }else{
            return String(double)
        }
    }
    
    func rank(double:Double) -> String {
        if(-0.5 < double && double<0.5){
            return "S+"
        }else if(-1 < double && double<1){
            return "S-"
        }else if(-2 < double && double<2){
            return "A+"
        }else if(-3 < double && double<3){
            return "A-"
        }else if(-5 < double && double<5){
            return "B+"
        }else if(-8 < double && double<8){
            return "B-"
        }else if(-10 < double && double<10){
            return "C+"
        }else if(-15 < double && double<15){
            return "C-"
        }else if(-25 < double && double<25){
            return "D+"
        }else if(-40 < double && double<40){
            return "D-"
        }else{
            return "E"
        }
    }
}
