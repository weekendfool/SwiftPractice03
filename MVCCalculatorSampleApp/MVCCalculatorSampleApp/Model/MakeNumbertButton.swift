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

    
    // ボタンをviewに描写する
    func makeNumberButton(screenWidth:CGFloat, screenHeight:CGFloat, targetView: UIView) {
        let numberButtonAction = NumberButtonAction()
        // for文でボタンを生成する
        for  buttonPlaceNumber in 0...10 {
            // buttonの名前を格納する変数
            var buttonName:String?
            // buttonの座標を格納する変数
            var buttonPointX:CGFloat? // x軸
            var buttonPointY:CGFloat? // y軸
            // ボタンのサイズの計算
            let buttonSizeWidth = screenWidth / 3.0 // 幅
            let buttonSizeHight = screenHeight / 12.0 // 高さ
            // buttonのインスタンス作成
            let numberButton = UIButton()
            // スイッチ文で条件分岐
            switch buttonPlaceNumber {
            case 1:
                buttonName = "1";
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 8
                numberButton.addTarget(Controller(), action: #selector(Controller().oneButtonTapped), for: .touchUpInside)
            case 2:
                buttonName = "2"
                buttonPointX = buttonSizeWidth * 1
                buttonPointY = buttonSizeHight * 8
                numberButton.addTarget(Controller(), action: #selector(Controller().tewButtonTapped), for: .touchUpInside)
            case 3:
                buttonName = "3"
                buttonPointX = buttonSizeWidth * 2
                buttonPointY = buttonSizeHight * 8
                numberButton.addTarget(Controller(), action: #selector(Controller().threeButtonTapped), for: .touchUpInside)
            case 4:
                buttonName = "4"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 7
                numberButton.addTarget(Controller(), action: #selector(Controller().fourButtonTapped), for: .touchUpInside)
            case 5:
                buttonName = "5"
                buttonPointX = buttonSizeWidth * 1
                buttonPointY = buttonSizeHight * 7
                numberButton.addTarget(Controller(), action: #selector(Controller().fiveButtonTapped), for: .touchUpInside)
            case 6:
                buttonName = "6"
                buttonPointX = buttonSizeWidth * 2
                buttonPointY = buttonSizeHight * 7
                numberButton.addTarget(Controller(), action: #selector(Controller().sixButtonTapped), for: .touchUpInside)
            case 7:
                buttonName = "7"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 6
                numberButton.addTarget(Controller(), action: #selector(Controller().sevenButtonTapped), for: .touchUpInside)
            case 8:
                buttonName = "8"
                buttonPointX = buttonSizeWidth * 1
                buttonPointY = buttonSizeHight * 6
                numberButton.addTarget(Controller(), action: #selector(Controller().eightButtonTapped), for: .touchUpInside)
            case 9:
                buttonName = "9"
                buttonPointX = buttonSizeWidth * 2
                buttonPointY = buttonSizeHight * 6
                numberButton.addTarget(Controller(), action: #selector(Controller().nineButtonTapped), for: .touchUpInside)
            case 0:
                buttonName = "0"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 9
                numberButton.addTarget(Controller(), action: #selector(Controller().zeroButtonTapped), for: .touchUpInside)
            case 10:
                buttonName = "00"
                buttonPointX = buttonSizeWidth * 3 / 2
                buttonPointY = buttonSizeHight * 9
                numberButton.addTarget(Controller(), action: #selector(Controller().ooButtonTapped), for: .touchUpInside)
            default:
                print("NumberButton Make Errror")
                return
            }
            
            if let buttonName = buttonName {
                // buttonのラベル作成
                numberButton.setTitle("\(buttonName)", for: UIControl.State.normal)
            }
            
            // buttonのフォントサイズを設定
            numberButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
            // buttonのサイズを設定
            if buttonPlaceNumber == 0 || buttonPlaceNumber == 10 {
                numberButton.frame = CGRect(x: buttonPointX!, y: buttonPointY!, width: buttonSizeWidth * 3 / 2, height:buttonSizeHight)
//                print("Button 0 & 00")
            } else {
                numberButton.frame = CGRect(x: buttonPointX!, y: buttonPointY!, width: buttonSizeWidth, height:buttonSizeHight)
            }
            // buttonの色を設定
            numberButton.backgroundColor = UIColor.gray
            // ボタンの枠線を設定
            numberButton.layer.borderColor = UIColor.darkGray.cgColor
            numberButton.layer.borderWidth = 2.0
            numberButton.layer.cornerRadius = 10
            // viewにボタンを追加
            targetView.addSubview(numberButton)
        }
    }
    
}
    

