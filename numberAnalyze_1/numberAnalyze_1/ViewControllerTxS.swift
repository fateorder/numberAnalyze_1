//
//  ViewControllerTxS.swift
//  numberAnalyze_1
//
//  Created by Feast on 16/1/3.
//  Copyright © 2016年 Feast. All rights reserved.
//

import UIKit

class ViewControllerTxS: UIViewController {

   
      @IBOutlet weak var TxSBuChang: UITextField!
      
      @IBOutlet weak var TxSTiXingAns: UILabel!
      @IBOutlet weak var TxSSimpsonAns: UILabel!
      
      @IBAction func TxSTiXing(sender: UIButton) {

            let h = (TxSBuChang.text! as NSString).doubleValue
            
            var x: Double = 0.0
            var answer: Double = 0.0
            
            answer += F( 0.0 )
            x += h
            while x < 1 {
                  answer += 2 * F( x )
                   x += h
            }
            answer += F( 1.0 )
            answer = answer * h * ( 1 / 2 )
            TxSTiXingAns.text =  String(answer)
            
      }
      
      @IBAction func TxSSimpson(sender: UIButton) {
            let h = (TxSBuChang.text! as NSString).doubleValue
            
            var x: Double = 0.0
            var answer: Double = 0.0
            
            while x <= (1 - 2 * h) {
                  answer += F(x) + 4 * F(x + h) + F(x + 2.0 * h)
                  x += 2 * h
            }
            
            answer = answer * ( 2 * h ) * (1 / 6)
            TxSSimpsonAns.text = String(answer)
      
      }
      
      
      
      private func F (x: Double) -> Double
      {
            return 4 / (1 + x*x)
      }

}
