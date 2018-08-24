//
//  Concentration_result.swift
//  Brain Training
//
//  Created by 海城高校情報科 on 2018/08/25.
//  Copyright © 2018年 海城高校情報科. All rights reserved.
//

import UIKit

class Concentration_result: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Back_To_Home(_ sender: UIButton) {
        present((self.storyboard?.instantiateViewController(withIdentifier: "Home"))!, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
