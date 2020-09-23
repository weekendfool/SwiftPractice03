//
//  TapButtonAction.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

// 数字ボタンが押された時の処理を担当
import Foundation
import UIKit

class NumberButtonAction {
    // タップされた時のアクション
    // タップされた数字を返却する
    func NumberButtonTapped(inputNumberString:String?, targetButtonInstance:UIButton, targetNumber:Int?) -> String {
        print("inputNumberString:\(inputNumberString)")
        var outputString:String? //　返り値用の変数
        if let inputNumberString = inputNumberString, let targetNumber = targetNumber {
            // 表示されている桁数が規定以下の場合の処理
            if inputNumberString.count < 10 {
               
                //　inputNumberStringが初期値0以外の場合の処理
                if inputNumberString != "0" {
                    switch targetNumber {
                    case 0...9:
                        outputString = inputNumberString + String(targetNumber)
                    case 00:
                        outputString = inputNumberString + String(targetNumber)
                    default:
                        print("targetNumber Is Not Right")
                        outputString = "error"
                    }
                    
                } else {
                    //　inputNumberStringが初期値0の場合の処理
                    switch targetNumber {
                    case 0...9:
                        outputString = String(targetNumber)
                    case 00:
                        outputString = "0"
                    default:
                        print("targetNumber Is Not Right")
                        outputString = "error"
                    }
                }
            } else if inputNumberString.count == 9 && targetNumber == 00 {
                // 桁数が9でかつ00のボタンが押された場合
                outputString = inputNumberString + "0"
            }
        }
        print("inputNumberString, targetNumber Nil Error")
        return String(outputString!)
    }

    
}


