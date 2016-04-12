//
//  ViewController_Gauss.swift
//  numberAnalyze_1
//
//  Created by Feast on 15/10/21.
//  Copyright © 2015年 Feast. All rights reserved.
//

import UIKit

var aMatrix = [[Double]]()
var xMatrix = [Double]()
var temp    = [Double]()

var N:Int = 2
var M:Int = 3
var L:Int = 1


class ViewController_Gauss: ViewController{

      
   
      
      @IBOutlet weak var gaussN: UITextField!
      @IBOutlet weak var gaussM: UITextField!
      @IBOutlet weak var gaussMatrix: UITextField!
      @IBOutlet weak var gaussResult: UILabel!
      
      
      
      @IBAction func gaussResult(sender: UIButton) {
           
            //默认值，初始化
            aMatrix = [
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0]
                  
            ]
            temp = [0,0,0,0,0,0,0,0,0]
            xMatrix = [0,0,0,0,0,0,0,0]
            
            N = (gaussN.text! as NSString).integerValue
            M = (gaussM.text! as NSString).integerValue
            L = L - 1
            
            var tempAMatrix: [String] = gaussMatrix.text!.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ",;"))
            
            for var index1 = 0 ; index1 < N ;index1++ {
                  for var index2 = 0 ;index2 < M ;index2++ {
                        aMatrix[index1][index2] = Double(tempAMatrix[index1 * M + index2])!
                  }
            }
            
            
            gauss()
            gaussResult.text = "\(xMatrix)"
      }
     
      
      
       func gauss(){
            var i:Int = 0
            var j:Int = 0
            var l:Int = 0
            var n:Int = 0
            var m:Int = 0
            var k:Int = 0
      //防止下一步中出现分母为零的情况
            for var index = 0 ;index < N ;index++ {
                  if(aMatrix[index][index] == 0){
                        for var end = index + 1 ; end < N ; end++ {
                              if(aMatrix[end][index] != 0){
                                    for var change = 0 ; change < M ; change++ {
                                          let TT = aMatrix[index][change]
                                          aMatrix[index][change] = aMatrix[end][change]
                                          aMatrix[end][change] = TT
                                    }
                              }
                        }
                  }
            }
            
            
            
            
            
      //      第一个repeat-while是将增广矩阵消成上三角形式
      repeat{
            n=0
            for  l = k; l < L; l++ {
                  temp[n++] = aMatrix[l+1][k] / aMatrix[k][k]
                  
            }
            for m = 0 , i = k ; i < N - 1 ; i++ , m++ {
                  for j = k ; j < M ; j++ {
                  aMatrix[i+1][j] -= temp[m] * aMatrix[k][j]
                  }
            }
      k++
      }while(k < N)
            
//      第二个repeat-while是将矩阵消成对角形式，并且重新给k赋值
      k = L-1
      repeat{
            n     = 0
            for(l = k;l>=0;l--){
                  temp[n++] = aMatrix[k-l][k+1] / aMatrix[k+1][k+1]
            }
            for(m = 0,i=k;i>=0;i--,m++){
                  for(j = k;j<M;j++){
                  aMatrix[k-i][j] -= temp[m] * aMatrix[k+1][j]

                  }
            }
      k--
      }while(k >= 0)
//      下一个for是解方程组
            for(i = 0; i < N; i++){
                  xMatrix[i] = aMatrix[i][N] / aMatrix[i][i]
            }
      
      }
      
      

      
     
      
}