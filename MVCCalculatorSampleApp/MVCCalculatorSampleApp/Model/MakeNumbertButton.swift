//
//  MakeButton.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

// 数字用のボタンを生成を担当
import Foundation
import UIKit

class MakeNumbertButton {
    // ボタンサイズの設定
    func setButtonSize(screenWidth:CGFloat, screenHeight:CGFloat) -> (CGFloat, CGFloat){
        // ボタンのサイズの計算
        let buttonSizeWidth = screenWidth / 3.0 // 幅
        let buttonSizeHight = screenHeight / 12.0 // 高さ
        // 算出した値を返却
        return (buttonSizeWidth, buttonSizeHight)
    }
    
    // ボタンをviewに描写する
    func makeNumberButton(buttonSizeWidth:CGFloat, buttonSizeHight:CGFloat) {
        // for文でボタンを生成する
        for  buttonPlaceNumber in 0...10 {
            // buttonの名前を格納する変数
            var buttonName:String?
            // buttonの座標を格納する変数
            var buttonPointX:CGFloat? // x軸
            var buttonPointY:CGFloat? // y軸
            
            // スイッチ文で条件分岐
            switch buttonPlaceNumber {
            case 1:
                buttonName = "1";
                buttonPointX = buttonSizeWidth * 0;
                buttonPointY = buttonSizeHight * 8
            case 2:
                buttonName = "2"
                buttonPointX = buttonSizeWidth * 1;
                buttonPointY = buttonSizeHight * 8
            case 3:
                buttonName = "3"
                buttonPointX = buttonSizeWidth * 2;
                buttonPointY = buttonSizeHight * 8
            case 4:
                buttonName = "4"
                buttonPointX = buttonSizeWidth * 0;
                buttonPointY = buttonSizeHight * 7
            case 5:
                buttonName = "5"
                buttonPointX = buttonSizeWidth * 1;
                buttonPointY = buttonSizeHight * 7
            case 6:
                buttonName = "6"
                buttonPointX = buttonSizeWidth * 2;
                buttonPointY = buttonSizeHight * 7
            case 7:
                buttonName = "7"
                buttonPointX = buttonSizeWidth * 0;
                buttonPointY = buttonSizeHight * 6
            case 8:
                buttonName = "8"
                buttonPointX = buttonSizeWidth * 1;
                buttonPointY = buttonSizeHight * 6
            case 9:
                buttonName = "9"
                buttonPointX = buttonSizeWidth * 2;
                buttonPointY = buttonSizeHight * 6
            case 0:
                buttonName = "0"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 9
            case 10:
                buttonName = "00"
                buttonPointX = buttonSizeWidth * 3 / 2
                buttonPointY = buttonSizeHight * 9
            default:
                print("NumberButton Make Errror")
                return
            }
        }
    }
    
    // 計算ボタンの生成:リターンなし
    // 計算ボタンの生成
    func makeNumberButton(buttonPlaceX: CGFloat, buttonPlaceY: CGFloat, buttonSizeWidth: CGFloat, buttonSizeHight: CGFloat, labelName: String, targetView: UIView) {
        // buttonのインスタンス作成
        let numberButton = UIButton()
        switch labelName {
        case "1":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.oneButtonTapped), for: .touchUpInside)
        case "2":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.tewButtonTapped), for: .touchUpInside)
        case "3":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.threeButtonTapped), for: .touchUpInside)
        case "4":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.fourButtonTapped), for: .touchUpInside)
        case "5":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.fiveButtonTapped), for: .touchUpInside)
        case "6":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.sixButtonTapped), for: .touchUpInside)
        case "7":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.sevenButtonTapped), for: .touchUpInside)
        case "8":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.eightButtonTapped), for: .touchUpInside)
        case "9":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.nineButtonTapped), for: .touchUpInside)
        case "0":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.zeroButtonTapped), for: .touchUpInside)
        case "00":
            numberButton.addTarget(self, action: #selector(NumberButtonAction.ooButtonTapped), for: .touchUpInside)
        default:
            return
        }
        // buttonのラベル作成
        numberButton.setTitle("\(labelName)", for: UIControl.State.normal)
        // buttonのフォントサイズを設定
        numberButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        numberButton.frame = CGRect(x: buttonPlaceX, y: buttonPlaceY, width: buttonSizeWidth, height: buttonSizeHight)
    
        numberButton.backgroundColor = UIColor.gray
        // ボタンの枠線を設定
        numberButton.layer.borderColor = UIColor.darkGray.cgColor
        numberButton.layer.borderWidth = 2.0
        numberButton.layer.cornerRadius = 10
        
        // viewにボタンを追加
        targetView.addSubview(numberButton)
    }
    
}
    

