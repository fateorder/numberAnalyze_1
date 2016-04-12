//
//  ViewController_EF.swift
//  numberAnalyze_1
//
//  Created by Feast on 15/9/28.
//  Copyright © 2015年 Feast. All rights reserved.
//


import UIKit

class ViewController_EF: UIViewController {

      @IBOutlet weak var a: UITextField!
      @IBOutlet weak var b: UITextField!
      
      @IBOutlet weak var count: UITextField!
      
      @IBOutlet weak var output: UILabel!
      
      
      @IBAction func EF(sender: UIButton) {
            
            let a0 = (a.text! as NSString).doubleValue
            let b0 = (b.text! as NSString).doubleValue
            let c0 = (count.text! as NSString).doubleValue
            
            let k:Double = log(pow(10,c0) * (a0 - b0))/log(2)
            let answer = ceil(k)
            
            output.text = "\(answer)"
            
      }
      
      
      func fun0 (x:Double)->Double{
            return 0-1-cos(x)
      }
      
}