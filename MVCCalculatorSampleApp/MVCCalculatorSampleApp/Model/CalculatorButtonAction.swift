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
    // 四則演算用ボタンの押された時のボタンの色変え:リターンなし
    func changeCalculatorButtonColor(calculatorType:Int) {
    // 入力されている文字数が規定以下なら
    switch calculatorType {
                case 1:
                    additionButton.backgroundColor = UIColor.orange
                case 2:
                    subtractionButton.backgroundColor = UIColor.orange
                case 3:
                    divisionButton.backgroundColor = UIColor.orange
                case 4:
                    multiplicationButton.backgroundColor = UIColor.orange
                default:
                    print("error")
                    return
                }
            
            }
    func banTapCalculatorButton(additionButton:UIButton, subtractionButton:UIButton, divisionButton:UIButton, multiplicationButton:UIButton) {
        // ボタンを押せないように設定
        additionButton.isEnabled = false
        subtractionButton.isEnabled = false
        divisionButton.isEnabled = false
        multiplicationButton.isEnabled = false
    }
}
