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
    // タップされた時のアクション
    func tapCalculatorButtonAction(calculatorType:Int) {
        switch calculatorType {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
    }
    @objc func additionButtonTapped() {
        print("taped:additionButtonTapped")
        // 計算用の変数にinputNumberStringを格納
        if let inputNumberString = inputNumberString {
            beforeNumber = Int(inputNumberString)
            // inputNumberStringを初期化
            self.inputNumberString = "0"

        }
        // 計算記号を格納する
        calculatorType = 1
        sleepButton()
        
        }
    @objc func subtractionButtonTapped() {
        print("taped:subtractionButtonTapped")
        // 計算用の変数にinputNumberStringを格納
        if let inputNumberString = inputNumberString {
            beforeNumber = Int(inputNumberString)
            // inputNumberStringを初期化
            self.inputNumberString = "0"
                }
                // 計算記号を格納する
                calculatorType = 2
                sleepButton()
           }
    
    @objc func divisionButtonTapped() {
        print("taped:divisionButtonTapped")
        // 計算用の変数にinputNumberStringを格納
        if let inputNumberString = inputNumberString {
            beforeNumber = Int(inputNumberString)
            // inputNumberStringを初期化
            self.inputNumberString = "0"
            }
            // 計算記号を格納する
            calculatorType = 3
            sleepButton()
           }
    
    @objc func multiplicationButtonTapped() {
        print("taped:multiplicationButtonTapped")
        // 計算用の変数にinputNumberStringを格納
                if let inputNumberString = inputNumberString {
                    beforeNumber = Int(inputNumberString)
                    // inputNumberStringを初期化
                    self.inputNumberString = "0"
                }
                // 計算記号を格納する
                calculatorType = 4
                sleepButton()
           }
    
    @objc func equalButtonTapped() {
        print("taped:equalButtonTapped")
        var errorNumber = ""
        if let calculatorType = calculatorType, let beforeNumber = beforeNumber, let inputNumberString = inputNumberString {
            switch calculatorType {
            case 1:
                // 足算
                self.answerNumber = beforeNumber + Int(inputNumberString)!
            case 2:
                // 引き算
                self.answerNumber = beforeNumber - Int(inputNumberString)!
            case 3:
                // 掛け算
                self.answerNumber = beforeNumber * Int(inputNumberString)!
            case 4:
                // 割り算
                if Int(inputNumberString) == 0 {
                    // 0で割られていた場合割り算を実行しない
                    errorNumber = "error"
                    print("0 error")
                } else {
                    // 0で割られていない場合割り算を実行
                    self.answerNumber = beforeNumber / Int(inputNumberString)!
                }
            default:
                return
            }
            // 0で割られていた場合errorを表示する
            if errorNumber == "error" {
                mainLabel.text = "error"
            } else {
                // 0で割られていない場合計算結果を表示するlabelに表示
                if let answerNumber = answerNumber {
                    mainLabel.text = "\(answerNumber)"
                    self.inputNumberString = "\(answerNumber)"
                    }
            }
            
            // 初期化
            self.beforeNumber = 0
            self.calculatorType = 0
            self.answerNumber = 0
            // ボタンの状態の初期化
            additionButton.isEnabled = true
            subtractionButton.isEnabled = true
            divisionButton.isEnabled = true
            multiplicationButton.isEnabled = true
            // 色の初期化
            additionButton.backgroundColor = UIColor.systemOrange
            subtractionButton.backgroundColor = UIColor.systemOrange
            divisionButton.backgroundColor = UIColor.systemOrange
            multiplicationButton.backgroundColor = UIColor.systemOrange
            
            }
        }
    
    @objc func clearButtonTapped() {
        print("taped")
        // label表示の初期化
        inputNumberString = "0"
        mainLabel.text = inputNumberString
        // 計算用変数を初期化
        beforeNumber = 0
        // 計算用記号変数を初期化
        calculatorType = 0
        answerNumber = 0
        // ボタンの状態の初期化
        additionButton.isEnabled = true
        subtractionButton.isEnabled = true
        divisionButton.isEnabled = true
        multiplicationButton.isEnabled = true
        // 色の初期化
        additionButton.backgroundColor = UIColor.systemOrange
        subtractionButton.backgroundColor = UIColor.systemOrange
        divisionButton.backgroundColor = UIColor.systemOrange
        multiplicationButton.backgroundColor = UIColor.systemOrange
        }
    
    // 四則演算用ボタンの押された時のボタンの色変え:リターンなし
    func changeCalculatorButtonColor(targetButton:UIButton) {
        targetButton.backgroundColor = UIColor.orange
    }
    
    // 四則演算用ボタンの押された時のボタンの無効化:リターンなし
    func banTapCalculatorButton(additionButton:UIButton, subtractionButton:UIButton, divisionButton:UIButton, multiplicationButton:UIButton) {
        // ボタンを押せないように設定
        additionButton.isEnabled = false
        subtractionButton.isEnabled = false
        divisionButton.isEnabled = false
        multiplicationButton.isEnabled = false
    }
}
