//
//  ViewController.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

// 入力された値
var inputNumber:String?
// 出力された値
var answerNumber:String?
// 計算記号の格納
var calculatorType:Int?

class Controller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期設定のコード
        // CalculatorViewのインスタンスを作成
        let calculatorView = CalculatorView()
        
        // 各modelについてのインスタンス設定
        // GetScreenSizeクラスのインスタンス作成
        let getScreenSize = GetScreenSize()
        // GetScreenSizeクラスのインスタンス作成
        let makeResultLabel = ResultLabel()
        // SetBackGroundColorのインスタンスを作成
        let setBackGroundColor = SetBackGroundColor()
        // MakeNumbertButtonのインスタンスを作成
        let makeNumbertButton = MakeNumbertButton()
        // MakeNumbertButtonのインスタンスを作成
        let makeCalculatorButton = MakeCalculatorButton()
        // calculatorButtonActionのインスタンスを作成
        let calculatorButtonAction = CalculatorButtonAction()
        // numberButtonActionのインスタンスを作成
        let numberButtonAction = NumberButtonAction()
        
        let mainView = self.view
        
        // 関数を実行
        // サイズを取得
        let myiPhoneScreenSize = getScreenSize.setScreenSize()
        // サイズを取得
        let screenWidth = myiPhoneScreenSize.0
        let screenHeight = myiPhoneScreenSize.1
        
        // 背景を黒色に設定
        setBackGroundColor.setBackGroundColor(view: mainView!)
        
        // labelを描画
        makeResultLabel.makeResultLabel(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, targetLabelInstance: calculatorView.resultLabel)
        
        //初期値を代入
        makeResultLabel.setFirstNumber(targetLabelInstance: calculatorView.resultLabel)
        
        // ボタンの生成
        // 数字ボタンを作成
        makeNumbertButton.makeNumberButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!)
        
        // 四則演算ボタンを作成
        // 足算
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: calculatorView.additionButton, buttonInstanceName: "additionButton")
        // 引き算
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: calculatorView.subtractionButton, buttonInstanceName: "subtractionButton")
        // かけ算
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: calculatorView.divisionButton, buttonInstanceName: "divisionButton")
        // わり算
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: calculatorView.multiplicationButton, buttonInstanceName: "multiplicationButton")
        // イコール
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: calculatorView.equalButton, buttonInstanceName: "equalButton")
        // クリア
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: calculatorView.clearButton, buttonInstanceName: "clearButton")
        
        // ボタンのアクションを設定
//        numberButtonAction.numberButtonTapped(inputNumberString: "1", targetNumber: 1)
        
        inputNumber = "8"
        
        var labelanswerNumber = answerNumber {
        didSet{
            // ラベルに反映する
            makeResultLabel.changeLabel(inputNumberString: labelanswerNumber!, targetLabelInstance: calculatorView.resultLabel)
            }
        }
        
    }
    
   
   @objc func oneButtonTapped() {
       print("oneButtonTapped")
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 1)

       }
   }
   @objc func tewButtonTapped() {
       if let inputNumber = inputNumber {
           print("tewButtonTapped")
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 2)
           
       }
   }
   @objc func threeButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 3)
           print("threeButtonTapped")
       }
   }
   @objc func fourButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 4)
           print("fourButtonTapped")
       }
   }
   @objc func fiveButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 5)
           print("fiveButtonTapped")
       }
   }
   @objc func sixButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 6)
           print("sixButtonTapped")
       }
   }
   @objc func sevenButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 7)
           print("sevenButtonTapped")
       }
   }
   @objc func eightButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 8)
           print("eightButtonTapped")
       }
   }
   @objc func nineButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 9)
           print("nineButtonTapped")
       }
   }
   @objc func zeroButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 0)
           print("zeroButtonTapped")
       }
   }
   @objc func ooButtonTapped() {
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 00)
           print("ooButtonTapped")
       }
   }
   
    // 四則演算用ボタンの押された時のリターン
    @objc func additionButtonTapped() {
        calculatorType = 1
    }
    @objc func subtractionButtonTapped() {
        calculatorType = 2
    }
    @objc func divisionButtonTapped() {
        calculatorType = 3
    }
    @objc func multiplicationButtonTapped() {
        calculatorType = 4
    }
    // タップされた時のアクション:記録した数字と計算記号を返す
    @objc func calculatorButtonTapped() {
        
    }
    
    @objc func equalButtonTapped() {
        print("taped:equalButtonTapped")
    }
    
    @objc func clearButtonTapped() {
        // 表示変更するだけ？
        }

    func calculatorButtonAction(inputNumberString:String) -> Int {
        var beforeNumberString:Int? // 返り値である現在値を格納する変数
        beforeNumberString = Int(inputNumberString)
        return beforeNumberString!
    }
    
    func equalButtonAction(inputNumberString:String, calculatorType:Int, beforeNumberString:Int) -> String {
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
        // 答えを返す
        return answerNumberString!
        }
    
   
   
   
            
        }



