//
//  ViewController.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/18.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    let SampleCell:String="SampleCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleCell, for: indexPath) as! InputCollectionView
        cell.numLabel.text="2"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.dragInteractionEnabled = false
        collectionView.isScrollEnabled = false
        let width: CGFloat = collectionView.frame.width / 3 - 7
        let height: CGFloat = collectionView.frame.height / 4 - 7
        return CGSize(width: width, height: height)
    }
    
    @IBAction func BACK(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
