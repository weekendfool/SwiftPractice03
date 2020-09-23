//
//  TapCalculatorButtonAction.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

// 四則演算用ボタンが押された時の挙動担当
import Foundation
import UIKit

class CalculatorButtonAction {
    // 四則演算用ボタンの押された時のリターン
    
    // タップされた時のアクション:記録した数字と計算記号を返す
    func tapCalculatorButtonAction(inputNumberString:String) -> Int {
        var beforeNumberString:Int? // 返り値である現在値を格納する変数
        beforeNumberString = Int(inputNumberString)
        return beforeNumberString!
    }
    
    func tapEqualButton(inputNumberString:String, calculatorType:Int, beforeNumberString:Int) -> String {
        print("taped:equalButtonTapped")
        var answerNumberString:String? // 返り値である答えを格納する変数
        
        switch calculatorType {
        case 1:
            // 足算
            answerNumberString = String(beforeNumberString + Int(inputNumberString)!)
        case 2:
            // 引き算
            answerNumberString = String(beforeNumberString - Int(inputNumberString)!)
        case 3:
            // 掛け算
            answerNumberString = String(beforeNumberString * Int(inputNumberString)!)
        case 4:
            // 割り算
            if Int(inputNumberString) == 0 {
                // 0で割られていた場合割り算を実行しない
                answerNumberString = "error"
                print("Input 0 error")
            } else {
                // 0で割られていない場合割り算を実行
                answerNumberString = String(beforeNumberString / Int(inputNumberString)!)
            }
        default:
            print("CalculatorType Is Not Right")
            answerNumberString = "error"
        }
        return answerNumberString!
        }
    
    func clearButtonTapped() {
        // 表示変更するだけ？
        }
    
    // 押されたボタンの色変え:リターンなし
func changeCalculatorButtonColor(targetButton:UIButton) {
        targetButton.backgroundColor = UIColor.orange
    }
    
    // 四則演算用ボタンの押された時のボタンの無効化:リターンなし
    func banTapCalculatorButton(additionButton:UIButton, subtractionButton:UIButton, divisionButton:UIButton, multiplicationButton:UIButton, tapCalculatorButtonFlag:Bool) {
        // クリアボタン、イコールボタが押された時の初期化
        if tapCalculatorButtonFlag {
            // ボタンの状態の有効化
            additionButton.isEnabled = true
            subtractionButton.isEnabled = true
            divisionButton.isEnabled = true
            multiplicationButton.isEnabled = true
        } else {
            // 四則演算用ボタンが押された時の挙動
            // ボタンの無効化
            additionButton.isEnabled = false
            subtractionButton.isEnabled = false
            divisionButton.isEnabled = false
            multiplicationButton.isEnabled = false
        }
        
    }
    
    // クリアボタン、イコールボタが押された時の初期化:リターンなし
    func resetCalculatorButtonColor(additionButton:UIButton, subtractionButton:UIButton, divisionButton:UIButton, multiplicationButton:UIButton, tapCalculatorButtonFlag:Bool) {
        if tapCalculatorButtonFlag {
            // ボタンの状態の有効化
            additionButton.backgroundColor = UIColor.systemOrange
            subtractionButton.backgroundColor = UIColor.systemOrange
            divisionButton.backgroundColor = UIColor.systemOrange
            multiplicationButton.backgroundColor = UIColor.systemOrange
        }
    }

}

