//
//  ViewControll_Jacobi.swift
//  numberAnalyze_1
//
//  Created by Feast on 15/10/28.
//  Copyright © 2015年 Feast. All rights reserved.
//

import UIKit

var A = [[Double]]()
var b = [Double]()
var x = [Double]()
var xx = [Double]()
var size: Int = 3
var Max: Int = 100
var residual:Double = 0.0
var sum: Double = 0.0
var dis: Double = 0.0
var dif: Double = 0.0
var eps: Double = pow(10.0, -3.0)

class ViewControll_Jacobi: UIViewController {
      
      
      @IBOutlet weak var jacobiSize: UITextField!
      @IBOutlet weak var jacobiEps: UITextField!
      @IBOutlet weak var jacobiMatrix: UITextField!
      @IBOutlet weak var jacobibMatrix: UITextField!
      @IBOutlet weak var countMax: UITextField!
      
      @IBOutlet weak var jacobiResult: UILabel!
      
      @IBAction func jacobiResult(sender: UIButton) {
      
            A = [
                  [8,-3,2,0,0,0,0,0],
                  [4,11,-1,0,0,0,0,0],
                  [6,3,12,-15,0,0,0,0],
                  [0,0,-15,45,0,0,0,0],
                  [0,-5,0,0,30,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0]
                  ]
            b = [20,33,36,0,0,0,0,0]
            x = [0,0,0,0,0,0,0,0]
            xx = [0,0,0,0,0,0,0,0]
            
            // 初始化数据
             Max = (countMax.text! as NSString).integerValue
            size = (jacobiSize.text! as NSString).integerValue

            eps = pow(10.0, (jacobiEps.text! as NSString).doubleValue * (-1.0) )
            //矩阵A的读取
            var tempAMatrix: [String] = jacobiMatrix.text!.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ",;"))
            
            for var index1 = 0 ; index1 < size ;index1++ {
                  for var index2 = 0 ;index2 < size ;index2++ {
                        A[index1][index2] = Double(tempAMatrix[index1 * size + index2])!
                  }
            }
            
            //矩阵B的读取
            
            var tempBMatrix: [String] = jacobibMatrix.text!.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ",;"))
            
            for var index = 0 ; index < size ; index++ {
                  b[index] = Double(tempBMatrix[index])!
            }
            
            
            jacobi()
            
            jacobiResult.text = "\(xx)"
      
      
      }
      
      
      
      @IBAction func gaussSeidel(sender: UIButton) {
     
            
            A = [
                  [8,-3,2,0,0,0,0,0],
                  [4,11,-1,0,0,0,0,0],
                  [6,3,12,-15,0,0,0,0],
                  [0,0,-15,45,0,0,0,0],
                  [0,-5,0,0,30,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0]
            ]
            b = [20,33,36,0,0,0,0,0]
            x = [0,0,0,0,0,0,0,0]
            xx = [0,0,0,0,0,0,0,0]
            
            // 初始化数据
            Max = (countMax.text! as NSString).integerValue
            size = (jacobiSize.text! as NSString).integerValue
            
            eps = pow(10.0, (jacobiEps.text! as NSString).doubleValue * (-1.0) )
            //矩阵A的读取
            var tempAMatrix: [String] = jacobiMatrix.text!.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ",;"))
            
            for var index1 = 0 ; index1 < size ;index1++ {
                  for var index2 = 0 ;index2 < size ;index2++ {
                        A[index1][index2] = Double(tempAMatrix[index1 * size + index2])!
                  }
            }
            
            //矩阵B的读取
            
            var tempBMatrix: [String] = jacobibMatrix.text!.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ",;"))
            
            for var index = 0 ; index < size ; index++ {
                  b[index] = Double(tempBMatrix[index])!
            }
            
            
            
            
            gaussSeidel()
            jacobiResult.text = "\(xx)"
            
            
      }
      
      
      
      
      
      func jacobi() {
            for var k = 1; (k < Max)  ; k++ {
                  
                  
                  for  var i = 0; i < size; i++ {
                        for var j = 0 ; j < size; j++ {
                              if i != j {
                                    sum += A[i][j] * xx[j]
                              }
                        }
                        x[i] = (b[i]-sum) / A[i][i];
                        sum = 0.0
                  }
                 
                  
                  xx = x
                 
            }
            
      }
      
      
      func gaussSeidel(){
            
            
            for var k = 1 ; k < Max ; k++ {
                  
                  
                  for  var i = 0; i < size; i++ {
                        for var j = 0 ; j < size; j++ {
                              if j < i {
                                    sum += A[i][j] * x[j]
                              }
                              if j > i {
                                    sum += A[i][j] * xx[j]
                              }
                        }
                        x[i] = (b[i]-sum) / A[i][i];
                        sum = 0.0
                  }
                  
                  xx = x
                  
            }
            
      }
      
      

}
