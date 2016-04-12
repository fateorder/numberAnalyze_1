//
//  ViewController_Newton.swift
//  numberAnalyze_1
//
//  Created by Feast on 15/10/23.
//  Copyright © 2015年 Feast. All rights reserved.
//

import UIKit

class ViewController_Newton: UIViewController {

      @IBOutlet weak var ND_a0: UITextField!
      
      @IBOutlet weak var ND_a1: UITextField!
      
      @IBOutlet weak var ND_a2: UITextField!
      
      @IBOutlet weak var ND_a3: UITextField!
      
      @IBOutlet weak var ND_x: UITextField!
      
      @IBOutlet weak var ND_k: UITextField!
      
      @IBOutlet weak var ND_result: UILabel!
    
     
      @IBAction func ND_result(sender: UIButton) {
            var ND_xx = (ND_x.text! as NSString).doubleValue
            let ND_kk = (ND_k.text! as NSString).integerValue
            
            
                        for _ in 0 ... ND_kk  {
                              if ND_fun2(ND_xx) != 0 {
                                    ND_xx = ND_xx - ND_fun1(ND_xx) / ND_fun2(ND_xx)
                              }
                              else {
                                    break
                              }
                        }
            
                        ND_result.text = "\(ND_xx)"
            
            
      }
    
      
      
    override func viewDidLoad() {
        super.viewDidLoad()

      
        // Do any additional setup after loading the view.
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
      
      
            private func ND_fun1 (x:Double)->Double{
                  let ND_aa0 = (ND_a0.text! as NSString).doubleValue
                  let ND_aa1 = (ND_a1.text! as NSString).doubleValue
                  let ND_aa2 = (ND_a2.text! as NSString).doubleValue
                  let ND_aa3 = (ND_a3.text! as NSString).doubleValue

                  return ND_aa0 * pow(x, 3) + ND_aa1 * pow(x, 2) + ND_aa2 * pow(x, 1) + ND_aa3
            }
            private func ND_fun2 (x:Double)->Double{
                  let ND_aa0 = (ND_a0.text! as NSString).doubleValue
                  let ND_aa1 = (ND_a1.text! as NSString).doubleValue
                  let ND_aa2 = (ND_a2.text! as NSString).doubleValue
      
                  return 3 * ND_aa0 * pow(x, 3) + 2 * ND_aa1 * pow(x, 2) + ND_aa2 * pow(x, 1)
            }
      

      
      
      

}
