//
//  ViewController.swift
//  numberAnalyze_1
//
//  Created by Feast on 15/9/23.
//  Copyright (c) 2015年 Feast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

      @IBOutlet weak var a0: UITextField!
      @IBOutlet weak var a1: UITextField!
      @IBOutlet weak var a2: UITextField!
      @IBOutlet weak var a3: UITextField!
      
      @IBOutlet weak var a: UITextField!
      @IBOutlet weak var b: UITextField!
      @IBOutlet weak var requier: UITextField!
      
      @IBOutlet weak var output: UILabel!
      
      @IBAction func calaulate(sender: UIButton) {
            let temp = (requier.text! as NSString).doubleValue
            let k = fun0(temp)
            
            var x1 = (a.text! as NSString).doubleValue
            var x2 = (b.text! as NSString).doubleValue
            
            for _ in 1...k{
                  let answer1 = fun1( x1 )
                  let answer2 = fun1( x2 )
                  let answer3 = fun1( (x1+x2)/2 )
                  if answer1 * answer3 < 0 {
                        x2 = (x1 + x2)/2
                  }else if answer2 * answer3 < 0 {
                        x1 = (x1 + x2)/2
                  }
            }
            
            let ot = (x1 + x2)/2
            output.text = "\(ot)"
            
      }
      
      private func fun1(x: Double)-> Double {
            let aa0 = (a0.text! as NSString).doubleValue
            let aa1 = (a1.text! as NSString).doubleValue
            let aa2 = (a2.text! as NSString).doubleValue
            let
            aa3 = (a3.text! as NSString).doubleValue
            
            var answer = 0.0
            answer = aa0 * pow(x,3) + aa1 * pow(x, 2) + aa2 * pow(x, 1) + aa3
            
            return answer
      }
      
      private func fun2(x: Double)-> Double {
            let aa0 = (a0.text! as NSString).doubleValue
            let aa1 = (a1.text! as NSString).doubleValue
            let aa2 = (a2.text! as NSString).doubleValue
            let aa3 = (a3.text! as NSString).doubleValue
            
            var answer = 0.0
            answer = aa0 * pow(x,3) + aa1 * pow(x, 2) + aa2 * pow(x, 1) + aa3
            
            return answer
      }
      
      private func fun0(k: Double)-> Int {
            let aa = (a.text! as NSString).doubleValue
            let bb = (b.text! as NSString).doubleValue
            
            let temp1:Double = 3 * pow(10, 3) * (bb - aa)
            let k = log(temp1) / log(2.0)
            
            var answer :Int = 0
            answer = Int(k) + 1
            
            return answer
      }
      
      

      
}

