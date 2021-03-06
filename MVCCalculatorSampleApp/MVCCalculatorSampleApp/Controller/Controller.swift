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
var answerNumber:String?{
    didSet{
        // ラベルに反映する
        print("didSet Done")
        ResultLabel().changeLabel(inputNumberString: answerNumber!, targetLabelInstance: resultLabel)
    }
}
// 計算記号の格納
var calculatorType:Int?
// 計算途中で前の値を保持しておく変数
var beforeNumber:String?
// 四則演算用のフラグを保持しておく変数
var tapCalculatorButtonFlag:Bool?

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
        makeResultLabel.makeResultLabel(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, targetLabelInstance: resultLabel)
        
        //初期値を代入
        makeResultLabel.setFirstNumber(targetLabelInstance: resultLabel)
        
        // ボタンの生成
        // 数字ボタンを作成
        makeNumbertButton.makeNumberButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!)
        
        // 四則演算ボタンを作成
        // 足算
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: additionButton, buttonInstanceName: "additionButton")
        // 引き算
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: subtractionButton, buttonInstanceName: "subtractionButton")
        // かけ算
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: divisionButton, buttonInstanceName: "divisionButton")
        // わり算
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: multiplicationButton, buttonInstanceName: "multiplicationButton")
        // イコール
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: equalButton, buttonInstanceName: "equalButton")
        // クリア
        makeCalculatorButton.makeCalculatorButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!, buttonInstance: clearButton, buttonInstanceName: "clearButton")
        
        
    }
    
    //　MARK: -  数字のアクション
   @objc func oneButtonTapped() {
        print("-----------------------------------")
       print("oneButtonTapped")
        print("inputNumber:\(inputNumber)")
       if let inputNumber = inputNumber {
        answerNumber = NumberButtonAction().numberButtonTapped(inputNumberString: inputNumber, targetNumber: 1)
        print("beforeNumber:\(beforeNumber)")
        print("answerNumber:\(answerNumber)")
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
    
    //　MARK: - 四則演算用ボタンのアクション
    // 四則演算用ボタンの押された時のリターン
    @objc func additionButtonTapped() {
        print("taped:additionButtonTapped")
//        additionButton.backgroundColor = UIColor.red
        calculatorType = 1
        tapCalculatorButtonFlag = true
        beforeNumber = answerNumber
        print("beforeNumber:\(beforeNumber)")
        print("inputNumber:\(inputNumber)")
        // 押されたボタンの色変え
        CalculatorButtonAction().changeCalculatorButtonColor(targetButton: additionButton)
        // 押されたボタンの無効化
        CalculatorButtonAction().banTapCalculatorButton(additionButton: additionButton, subtractionButton: subtractionButton, divisionButton: divisionButton, multiplicationButton: multiplicationButton, tapCalculatorButtonFlag: tapCalculatorButtonFlag!)
        
    }
    
    @objc func subtractionButtonTapped() {
        print("taped:subtractionButtonTapped")
        calculatorType = 2
        beforeNumber = answerNumber
        // 押されたボタンの色変え
        CalculatorButtonAction().changeCalculatorButtonColor(targetButton: subtractionButton)
        // 押されたボタンの無効化
        CalculatorButtonAction().banTapCalculatorButton(additionButton: additionButton, subtractionButton: subtractionButton, divisionButton: divisionButton, multiplicationButton: multiplicationButton, tapCalculatorButtonFlag: tapCalculatorButtonFlag!)
    }
    @objc func divisionButtonTapped() {
        print("taped:divisionButtonTapped")
        calculatorType = 3
        beforeNumber = answerNumber
        // 押されたボタンの色変え
        CalculatorButtonAction().changeCalculatorButtonColor(targetButton: divisionButton)
        // 押されたボタンの無効化
        CalculatorButtonAction().banTapCalculatorButton(additionButton: additionButton, subtractionButton: subtractionButton, divisionButton: divisionButton, multiplicationButton: multiplicationButton, tapCalculatorButtonFlag: tapCalculatorButtonFlag!)
    }
    @objc func multiplicationButtonTapped() {
        print("taped:multiplicationButtonTapped")
        calculatorType = 4
        beforeNumber = answerNumber
        // 押されたボタンの色変え
        CalculatorButtonAction().changeCalculatorButtonColor(targetButton: multiplicationButton)
        // 押されたボタンの無効化
        CalculatorButtonAction().banTapCalculatorButton(additionButton: additionButton, subtractionButton: subtractionButton, divisionButton: divisionButton, multiplicationButton: multiplicationButton, tapCalculatorButtonFlag: tapCalculatorButtonFlag!)
    }
    
    
    @objc func equalButtonTapped() {
        print("taped:equalButtonTapped")
        if calculatorType != 0 {
            answerNumber = CalculatorButtonAction().equalButtonTapped(inputNumberString: answerNumber!, calculatorType: calculatorType!, beforeNumberString: beforeNumber!)
            tapCalculatorButtonFlag = false
            
            // ボタンの有効化
            CalculatorButtonAction().banTapCalculatorButton(additionButton: additionButton, subtractionButton: subtractionButton, divisionButton: divisionButton, multiplicationButton: multiplicationButton, tapCalculatorButtonFlag: tapCalculatorButtonFlag!)
            // buttonの色変え
            CalculatorButtonAction().resetCalculatorButtonColor(additionButton: additionButton, subtractionButton: subtractionButton, divisionButton: divisionButton, multiplicationButton: multiplicationButton, tapCalculatorButtonFlag: tapCalculatorButtonFlag!)
            // 初期化
            beforeNumber = "0"
            calculatorType = 0
        }
    }
    
    @objc func clearButtonTapped() {
        // 表示変更するだけ？
        print("taped:clearButtonTapped")
        tapCalculatorButtonFlag = false
        // 初期化
        beforeNumber = "0"
        answerNumber = "0"
        calculatorType = 0
        // ボタンの有効化
        CalculatorButtonAction().banTapCalculatorButton(additionButton: additionButton, subtractionButton: subtractionButton, divisionButton: divisionButton, multiplicationButton: multiplicationButton, tapCalculatorButtonFlag: tapCalculatorButtonFlag!)
        // buttonの色変え
        CalculatorButtonAction().resetCalculatorButtonColor(additionButton: additionButton, subtractionButton: subtractionButton, divisionButton: divisionButton, multiplicationButton: multiplicationButton, tapCalculatorButtonFlag: tapCalculatorButtonFlag!)
    }

    
   
   
   
            
        }



