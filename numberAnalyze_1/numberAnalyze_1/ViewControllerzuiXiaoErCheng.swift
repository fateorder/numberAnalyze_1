//
//  ViewControllerzuiXiaoErCheng.swift
//  numberAnalyze_1
//
//  Created by Feast on 16/1/10.
//  Copyright © 2016年 Feast. All rights reserved.
//

import UIKit

var z_A = [[Double]]()
var z_b = [[Double]]()
var z_m: Int = 10
var z_n: Int = 10


class ViewControllerzuiXiaoErCheng: UIViewController {
      
      @IBOutlet weak var z_AField: UITextField!
      
      @IBOutlet weak var z_bField: UITextField!
      
      @IBOutlet weak var z_mField: UITextField!
      
      @IBOutlet weak var z_nField: UITextField!
      
      @IBOutlet weak var z_AnsField: UITextView!
      
      @IBOutlet weak var z_AnsField1: UITextView!
      
      @IBAction func z_Button(sender: UIButton) {
            
            
            z_m = (z_mField.text! as NSString).integerValue
            z_n = (z_nField.text! as NSString).integerValue
            
            for var i = 0; i < z_m; i++ {
                  z_A.append(Array(count: z_n, repeatedValue: 0.0))
            }
            
            for var i = 0; i < z_m; i++ {
                  z_b.append(Array(count: 1, repeatedValue: 0))
            }

            var tempAMatrix: [String] = z_AField.text!.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ",;"))
            
            for var index1 = 0 ; index1 < z_m ;index1++ {
                  for var index2 = 0 ;index2 < z_n ;index2++ {
                        z_A[index1][index2] = Double(tempAMatrix[index1 * z_n + index2])!
                  }
            }
            
            var tempbMatrix: [String] = z_bField.text!.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ",;"))
            
            for var index = 0;index < z_n; index++ {
                  z_b[index][0] = Double(tempbMatrix[index])!
            }
            
            
            //输出答案
            let t = zMatrixMuitipie(zZhuangZhi(z_A, m: z_m, n: z_n), y: z_A , b: z_n, n: z_m, m: z_n)
            
            let t1 = zMatrixMuitipie(zZhuangZhi(z_A, m: z_m, n: z_n), y: z_b , b: z_n, n: z_m, m: 1)
            
        
            z_AnsField.text = String(t)
            z_AnsField1.text = String(t1)
            
      }
      
      func zZhuangZhi(x:[[Double]], m:Int, n:Int)->[[Double]]{
            var ans: [[Double]] = [[Double]]()
            
            for var i = 0; i < n; i++ {
                  ans.append(Array(count: m, repeatedValue: 0))
            }
            
            for var i = 0; i < m; i++ {
                  for var j = 0; j < n; j++ {
                        ans[j][i] = x[i][j];
                  }
            }
            return ans
      }
      
      
      
      
      func zMatrixMuitipie (x: [[Double]], y: [[Double]], b: Int, n:Int, m:Int) -> [[Double]]
      {
            
            var ans: [[Double]] = [[Double]]()
            
            for var i = 0; i < b; i++ {
                  ans.append(Array(count: m, repeatedValue: 0))
            }
            
            for (var index1 = 0; index1 < b; index1++ ){
                  for (var index2 = 0; index2 < m; index2++ ){
                        for var index3 = 0; index3 < n; index3++ {
                        ans[index1][index2] += x[index1][index3] * y[index3][index2]
                  
                        }
                  }
            }
            
            return ans
      }
      

      
      
      
}
