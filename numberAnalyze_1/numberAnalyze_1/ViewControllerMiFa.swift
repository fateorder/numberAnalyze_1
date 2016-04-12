



//
//  ViewControllerMiFa.swift
//  numberAnalyze_1
//
//  Created by Feast on 16/1/4.
//  Copyright © 2016年 Feast. All rights reserved.
//

import UIKit

var miFaMatrix1 = [[Double]]()
var miFaMatrix2 = [Double]()
var miFaWeiDu: Int = 2
var miFaJingDu:Double = 1.0
var miFaLamda: Double = 1.0

class ViewControllerMiFa: UIViewController {

      
      @IBOutlet weak var miFaWeiDuField: UITextField!
      
      @IBOutlet weak var miFaJingDuField: UITextField!

      @IBOutlet weak var miFaMatrixField: UITextField!
      
      
      @IBOutlet weak var miFaAnsField: UITextView!
      
      
      @IBAction func miFaButton(sender: UIButton) {
            
            miFaMatrix1 = [
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0]]
            
            miFaMatrix2 = [0,0,0,0,0,0,0,0]
            
            var miFaAns: [String] = [String]()
            
            miFaJingDu = (miFaJingDuField.text! as NSString).doubleValue
            miFaWeiDu = (miFaWeiDuField.text! as NSString).integerValue
            
            var tempMatrix: [String] = miFaMatrixField.text!.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ",;"))
            
            for var index1 = 0; index1 < miFaWeiDu; index1++ {
                  for var index2 = 0; index2 < miFaWeiDu; index2++ {
                  miFaMatrix1[index1][index2] = Double(tempMatrix[index1 * miFaWeiDu + index2])!
                  }
            }
            
            for var index1 = 0; index1 < miFaWeiDu; index1++ {
                  miFaMatrix2[index1] = 1
            }
            
            miFaLamda = miFaMatrix2.maxElement()!
            
            var i: Double = 1.0
            
            while i > miFaJingDu {
                  miFaMatrix2 = miFaMatrixMuitipie(miFaMatrix1, y: miFaMatrix2, n: miFaWeiDu)
                  let tempLamda: Double = miFaMatrix2.maxElement()!
                  
                  miFaMatrix2 = miFaMatrixChu(miFaMatrix2, y: tempLamda, n: miFaWeiDu)
                  
                  let tempJingDu: Double = miFaLamda - tempLamda
                  if tempJingDu > 0 {
                        i = tempJingDu
                  } else {
                        i = -tempJingDu
                  }
                  miFaLamda = tempLamda
                  
                  var tempMatrix: [Double] = [Double]()
                  for var index = 0; index < miFaWeiDu; index++ {
                        tempMatrix.append(miFaMatrix2[index])
                  }
                  
                  miFaAns.append(String(miFaLamda) + String(tempMatrix) )
                   
            }
            

            miFaAnsField.text = String(miFaAns)
      }
      
      
      func miFaMatrixMuitipie (x: [[Double]], y: [Double], n: Int) -> [Double]
      {
            
            var ans: [Double] = [Double]()
            ans = [0,0,0,0,0,0,0];
            for (var index1 = 0; index1 < n; index1++ ){
                  for (var index2 = 0; index2 < n; index2++ ){
                      ans[index1] += x[index1][index2] * y[index2]
                  }
            }
            
            return ans
      }
      
      func miFaMatrixChu(x: [Double], y: Double, n: Int) -> [Double]
      {
            var ans: [Double] = [Double]()
            ans = [0,0,0,0,0,0,0];
            for (var index1 = 0; index1 < n; index1++){
                  ans[index1] = x[index1] / y
            }
            return ans
      }
      
      
      
      
}
