//
//  ViewControllerLBG.swift
//  numberAnalyze_1
//
//  Created by Feast on 16/1/1.
//  Copyright © 2016年 Feast. All rights reserved.
//

import UIKit

class ViewControllerLBG: UIViewController {
      
      
      @IBOutlet weak var LBGAnswer: UILabel!
      
      
      @IBAction func LBG(sender: UIButton) {
            LBGAnswer.text = String( R1() )
      }
      
      private func F (x: Double) -> Double
      {
            return 4 / (1 + x*x)
      }
      
      private func T1() -> Double
      {
            return ( F( 0 ) + F( 1 ) ) / 2
      }
      
      private func T2() -> Double
      {
            return T1() / 2 + (F( 0.5 )) / 2
      }
      
      private func T4() -> Double
      {
            return T2() / 2 + ( F( 0.25 ) + F( 0.75 ) ) / 4
      }
      
      private func T8() -> Double
      {
            return T4() / 2 + ( F(1/8) + F(3/8) + F(5/8) + F(7/8))/8
      }
      
      private func S1() -> Double
      {
            return (4 * T2() - T1()) / 3
      }
      
      private func S2() -> Double
      {
            return (4 * T4() - T2()) / 3
      }
      
      private func S4() -> Double
      {
            return (4 * T8() - T4()) / 3
      }
      
      private func C1() -> Double
      {
            return (16 * S2() - S1()) / 15
      }
      
      private func C2() -> Double
      {
            return (16 * S4() - S2()) / 15
      }
      
      private func R1() -> Double
      {
            return (64 * C2() - C1()) / 63
      }
      
      
      
      
}
