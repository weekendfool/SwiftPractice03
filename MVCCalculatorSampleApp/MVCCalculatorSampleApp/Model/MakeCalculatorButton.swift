//
//  MakeCalculatorButton.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//


// 数字用のボタンを生成を担当
import Foundation
import UIKit

class MakeCalculatorButton {
    
    // ボタンをviewに描写する
    func makeCalculatorButton(screenWidth:CGFloat, screenHeight:CGFloat, targetView:UIView, buttonInstance:UIButton?, buttonInstanceName:String) {
        // ボタンのサイズの計算
        let buttonSizeWidth = screenWidth / 4.0 // 幅
        let buttonSizeHight = screenHeight / 12.0 // 高さ
        // for文でボタンを生成する
//        for  buttonPlaceNumber in 0...5 {
            // buttonの名前を格納する変数
            var buttonName:String?
            // buttonの座標を格納する変数
            var buttonPointX:CGFloat? // x軸
            var buttonPointY:CGFloat? // y軸
            // uibuttonのインスタンス作成
            var calculatButton:UIButton?
            calculatButton = buttonInstance
            // スイッチ文で条件分岐
            switch buttonInstanceName {
            case "additionButton":
                buttonName = "+"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 10
                
                calculatButton!.addTarget(self, action: #selector(CalculatorButtonAction.additionButtonTapped), for:.touchUpInside)
            case "subtractionButton":
                buttonName = "-"
                buttonPointX = buttonSizeWidth
                buttonPointY = buttonSizeHight * 10
//                calculatButton = buttonInstance
                calculatButton!.addTarget(self, action: #selector(CalculatorButtonAction.subtractionButtonTapped), for:.touchUpInside)
            case "divisionButton":
                buttonName = "*"
                buttonPointX = buttonSizeWidth * 2
                buttonPointY = buttonSizeHight * 10
//                calculatButton = buttonInstance
                calculatButton!.addTarget(self, action: #selector(CalculatorButtonAction.divisionButtonTapped), for:.touchUpInside)
            case "multiplicationButton":
                buttonName = "/"
                buttonPointX = buttonSizeWidth * 3
                buttonPointY = buttonSizeHight * 10
//                calculatButton = buttonInstance
                calculatButton!.addTarget(self, action: #selector(CalculatorButtonAction.multiplicationButtonTapped), for:.touchUpInside)
            case "equalButton":
                buttonName = "="
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 11
//                calculatButton = buttonInstance
                calculatButton!.addTarget(self, action: #selector(CalculatorButtonAction.equalButtonTapped), for:.touchUpInside)
            case "clearButton":
                buttonName = "Clear"
                buttonPointX = buttonSizeWidth * 2
                buttonPointY = buttonSizeHight * 11
//                calculatButton = buttonInstance
                calculatButton!.addTarget(self, action: #selector(CalculatorButtonAction.clearButtonTapped), for:.touchUpInside)
            default:
                print("CalculatorButton Make Errror")
                return
            }
            // buttonのラベル作成
        if let buttonName = buttonName {
            calculatButton!.setTitle("\(buttonName)", for: UIControl.State.normal)
        }
            
            // buttonのフォントサイズを設定
            calculatButton!.titleLabel?.font = UIFont.systemFont(ofSize: 28)
            calculatButton!.frame = CGRect(x: buttonPointX!, y: buttonPointY!, width: buttonSizeWidth, height: buttonSizeHight)
            
            calculatButton!.backgroundColor = UIColor.systemOrange
            // ボタンの枠線を設定
            calculatButton!.layer.borderColor = UIColor.darkGray.cgColor
            calculatButton!.layer.borderWidth = 2.0
            calculatButton!.layer.cornerRadius = 10
            
            // viewにボタンを追加
            targetView.addSubview(calculatButton!)
        }
//    }
        
        
}
