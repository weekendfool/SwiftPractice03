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
    
    // ボタンサイズの設定
    func setButtonSize(screenWidth:CGFloat, screenHeight:CGFloat) -> (CGFloat, CGFloat){
        // ボタンのサイズの計算
        let buttonSizeWidth = screenWidth / 3.0 // 幅
        let buttonSizeHight = screenHeight / 12.0 // 高さ
        // 算出した値を返却
        return (buttonSizeWidth, buttonSizeHight)
    }
    
    // 計算ボタンの生成
    func makeCalculatButton(buttonPointX: CGFloat, buttonPointY: CGFloat, buttonSizeWidth: CGFloat, buttonSizeHight: CGFloat, labelName: String, targetView: UIView, buttonInstance: UIButton?) {
        // buttonのインスタンス作成
        var calculatButton:UIButton?
        
        switch labelName {
        case "+":
            calculatButton = buttonInstance
            calculatButton!.addTarget(self, action: #selector(self.additionButtonTapped), for:.touchUpInside)
        case "-":
            calculatButton = buttonInstance
            calculatButton!.addTarget(self, action: #selector(self.subtractionButtonTapped), for: .touchUpInside)
        case "*":
            calculatButton = buttonInstance
            calculatButton!.addTarget(self, action: #selector(self.divisionButtonTapped), for: .touchUpInside)
        case "/":
            calculatButton = buttonInstance
            calculatButton!.addTarget(self, action: #selector(self.multiplicationButtonTapped), for: .touchUpInside)
        case "=":
            calculatButton = buttonInstance
            calculatButton!.addTarget(self, action: #selector(self.equalButtonTapped), for: .touchUpInside)
        case "Clear":
            calculatButton = buttonInstance
            calculatButton!.addTarget(self, action: #selector(self.clearButtonTapped), for: .touchUpInside)
        default:
            print("Make CalculatButton Error")
            return
            }
            // buttonのラベル作成
            calculatButton!.setTitle("\(labelName)", for: UIControl.State.normal)
            // buttonのフォントサイズを設定
            calculatButton!.titleLabel?.font = UIFont.systemFont(ofSize: 28)
            calculatButton!.frame = CGRect(x: buttonPointX, y: buttonPointY, width: buttonSizeWidth, height: buttonSizeHight)
            
            calculatButton!.backgroundColor = UIColor.systemOrange
            // ボタンの枠線を設定
            calculatButton!.layer.borderColor = UIColor.darkGray.cgColor
            calculatButton!.layer.borderWidth = 2.0
            calculatButton!.layer.cornerRadius = 10
            
            // viewにボタンを追加
            targetView.addSubview(calculatButton!)
        }
    }
    // ボタンをviewに描写する
    func makeCalculatorButton(buttonSizeWidth:CGFloat, buttonSizeHight:CGFloat) {
        // for文でボタンを生成する
        for  buttonPlaceNumber in 0...5 {
            // buttonの名前を格納する変数
            var buttonName:String?
            // buttonの座標を格納する変数
            var buttonPointX:CGFloat? // x軸
            var buttonPointY:CGFloat? // y軸
            
            // スイッチ文で条件分岐
            switch buttonPlaceNumber {
            case 0:
                buttonName = "+"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 10
            case 1:
                buttonName = "-"
                buttonPointX = buttonSizeWidth * 3 / 4
                buttonPointY = buttonSizeHight * 10
            case 2:
                buttonName = "*"
                buttonPointX = buttonSizeWidth * 3 / 2
                buttonPointY = buttonSizeHight * 10
            case 3:
                buttonName = "/"
                buttonPointX = buttonSizeWidth * 9 / 4
                buttonPointY = buttonSizeHight * 10
            case 4:
                buttonName = "="
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 11
            case 5:
                buttonName = "Clear"
                buttonPointX = buttonSizeWidth * 3 / 2
                buttonPointY = buttonSizeHight * 11
            default:
                print("CalculatorButton Make Errror")
                return
            }
        }
        
        
}
