//
//  ViewControllerEuler.swift
//  numberAnalyze_1
//
//  Created by Feast on 16/1/3.
//  Copyright © 2016年 Feast. All rights reserved.
//

import UIKit

class ViewControllerEuler: UIViewController {

      @IBOutlet weak var EulerBuChang: UITextField!
      
      @IBOutlet weak var EulerMax: UITextField!
      
      @IBOutlet weak var EulerAns: UITextView!
      
      @IBAction func EulerCal(sender: UIButton) {
            let h = (EulerBuChang.text!as NSString).doubleValue
            let n = (EulerMax.text! as NSString).doubleValue
            var ans: [String] = [String]()
            var x: Double = 0.0
            var y :Double = 1.0
            ans.append("x=\(x),y=\(y)")
            while x < n {
                  x = x + h
                  y = y + h * Y( x, y: y)
                  ans.append("x=\(x),y=\(y)")
            }
            EulerAns.text = "\(ans)"
            
      }
      
      
      @IBAction func mulEulerCal(sender: UIButton) {
            let h = (EulerBuChang.text!as NSString).doubleValue
            let n = (EulerMax.text! as NSString).doubleValue
            var ans: [String] = [String]()
            var x: Double = 0.0
            var y :Double = 1.0
            ans.append("x=\(x),y=\(y)")
            while x < n {
                  x = x + h
                  let tempy = y + h * Y( x, y: y)
                  y = y + ( Y( x, y: y) + Y(x, y: tempy)) * h / 2.0
                  ans.append("x=\(x),y=\(y)")
            }
            EulerAns.text = "\(ans)"
            
      }
      
      
      
      
      
      
      func Y (x: Double, y: Double) -> Double{
            return -2.0 * x * y
      }
      
      

}
