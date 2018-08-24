//
//  Home.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/19.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit

class Home: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let items: [String] = ["計算トレーニング", "時間感覚チャレンジ", "難関神経衰弱"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 2 - 7
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HOMEDEFAULT", for: indexPath) as! HomeCollectionViewCell
        defaultCell.Title.text = items[indexPath.row]
        defaultCell.Image.image = UIImage(named: "concentration.jpg")
        return defaultCell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            present(self.storyboard!.instantiateViewController(withIdentifier: "CalculationChallenge"), animated: true, completion: nil)
        case 1:
            present(self.storyboard!.instantiateViewController(withIdentifier: "TimeCountChallenge"), animated: true, completion: nil)
        case 2:
            present(self.storyboard!.instantiateViewController(withIdentifier: "Concentration"), animated: true, completion: nil)
        default:
            print("Error")
        }
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {}
    /*

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
