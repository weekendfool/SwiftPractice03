//
//  TapButtonAction.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

// 数字ボタンが押された時の挙動
import Foundation

// タップされた時のアクション
func zeroButtonTapped(inputNumberString: String) {
    print("inputNumberString:\(inputNumberString)")
    if let inputNumberString = inputNumberString {
        if inputNumberString.count < 10 {
        if inputNumberString != "0" {
            self.inputNumberString! += "0"
        } else {
            self.inputNumberString! = "0"
            
        }
    }
    }
}

// タップされた時のアクション
func oneButtonTapped() {
    print("placeNumber:1")
    print("inputNumberString:\(inputNumberString)")
    // lableに表示する
    if let inputNumberString = inputNumberString {
        if inputNumberString.count < 10 {
            if inputNumberString == "0" {
                self.inputNumberString = "1"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "1"
            }
        }
        
        mainLabel.text = self.inputNumberString
    }
}
