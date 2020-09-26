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
//    @objc func oneButtonTapped() {
//        print("oneButtonTapped")
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 1)
//
//        }
//    }
//    @objc func tewButtonTapped() {
//        if let inputNumber = inputNumber {
//            print("tewButtonTapped")
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 2)
//
//        }
//    }
//    @objc func threeButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 3)
//            print("threeButtonTapped")
//        }
//    }
//    @objc func fourButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 4)
//            print("fourButtonTapped")
//        }
//    }
//    @objc func fiveButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 5)
//            print("fiveButtonTapped")
//        }
//    }
//    @objc func sixButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 6)
//            print("sixButtonTapped")
//        }
//    }
//    @objc func sevenButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 7)
//            print("sevenButtonTapped")
//        }
//    }
//    @objc func eightButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 8)
//            print("eightButtonTapped")
//        }
//    }
//    @objc func nineButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 9)
//            print("nineButtonTapped")
//        }
//    }
//    @objc func zeroButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 0)
//            print("zeroButtonTapped")
//        }
//    }
//    @objc func ooButtonTapped() {
//        if let inputNumber = inputNumber {
//            answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 00)
//            print("ooButtonTapped")
//        }
//    }
    
    
    
    func numberButtonTapped(inputNumberString:String?, targetNumber:Int?) -> String {
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
            return String(outputString!)
        }
        print("inputNumberString, targetNumber Nil Error")
        return "error"
    }

    
}


