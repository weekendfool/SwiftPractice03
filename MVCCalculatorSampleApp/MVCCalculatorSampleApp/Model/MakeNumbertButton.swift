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
                numberButton.addTarget(Controller(), action: #selector(NumberButtonAction.oneButtonTapped), for: .touchUpInside)
            case 2:
                buttonName = "2"
                buttonPointX = buttonSizeWidth * 1
                buttonPointY = buttonSizeHight * 8
                numberButton.addTarget(Controller(), action: #selector(NumberButtonAction.tewButtonTapped), for: .touchUpInside)
            case 3:
                buttonName = "3"
                buttonPointX = buttonSizeWidth * 2
                buttonPointY = buttonSizeHight * 8
                numberButton.addTarget(self, action: #selector(NumberButtonAction.threeButtonTapped), for: .touchUpInside)
            case 4:
                buttonName = "4"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 7
                numberButton.addTarget(self, action: #selector(NumberButtonAction.fourButtonTapped), for: .touchUpInside)
            case 5:
                buttonName = "5"
                buttonPointX = buttonSizeWidth * 1
                buttonPointY = buttonSizeHight * 7
                numberButton.addTarget(self, action: #selector(NumberButtonAction.fiveButtonTapped), for: .touchUpInside)
            case 6:
                buttonName = "6"
                buttonPointX = buttonSizeWidth * 2
                buttonPointY = buttonSizeHight * 7
                numberButton.addTarget(self, action: #selector(NumberButtonAction.sixButtonTapped), for: .touchUpInside)
            case 7:
                buttonName = "7"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 6
                numberButton.addTarget(self, action: #selector(NumberButtonAction.sevenButtonTapped), for: .touchUpInside)
            case 8:
                buttonName = "8"
                buttonPointX = buttonSizeWidth * 1
                buttonPointY = buttonSizeHight * 6
                numberButton.addTarget(self, action: #selector(NumberButtonAction.eightButtonTapped), for: .touchUpInside)
            case 9:
                buttonName = "9"
                buttonPointX = buttonSizeWidth * 2
                buttonPointY = buttonSizeHight * 6
                numberButton.addTarget(self, action: #selector(NumberButtonAction.nineButtonTapped), for: .touchUpInside)
            case 0:
                buttonName = "0"
                buttonPointX = buttonSizeWidth * 0
                buttonPointY = buttonSizeHight * 9
                numberButton.addTarget(self, action: #selector(NumberButtonAction.zeroButtonTapped), for: .touchUpInside)
            case 10:
                buttonName = "00"
                buttonPointX = buttonSizeWidth * 3 / 2
                buttonPointY = buttonSizeHight * 9
                numberButton.addTarget(self, action: #selector(NumberButtonAction.ooButtonTapped), for: .touchUpInside)
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
    
//    class NumberButtonAction {
        // タップされた時のアクション
        // タップされた数字を返却する
        @objc func oneButtonTapped() {
            print("oneButtonTapped")
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 1)
                
            }
        }
        @objc func tewButtonTapped() {
            if let inputNumber = inputNumber {
                print("tewButtonTapped")
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 2)
                
            }
        }
        @objc func threeButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 3)
                print("threeButtonTapped")
            }
        }
        @objc func fourButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 4)
                print("fourButtonTapped")
            }
        }
        @objc func fiveButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 5)
                print("fiveButtonTapped")
            }
        }
        @objc func sixButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 6)
                print("sixButtonTapped")
            }
        }
        @objc func sevenButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 7)
                print("sevenButtonTapped")
            }
        }
        @objc func eightButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 8)
                print("eightButtonTapped")
            }
        }
        @objc func nineButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 9)
                print("nineButtonTapped")
            }
        }
        @objc func zeroButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 0)
                print("zeroButtonTapped")
            }
        }
        @objc func ooButtonTapped() {
            if let inputNumber = inputNumber {
                answerNumber = numberButtonTapped(inputNumberString: inputNumber, targetNumber: 00)
                print("ooButtonTapped")
            }
        }
        
        
        
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



    
//}
    

