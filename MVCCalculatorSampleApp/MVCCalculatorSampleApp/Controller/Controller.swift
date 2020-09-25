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
        // 数字ボタンのアクションを設定
        for targetNumber in 0...10 {
            numberButtonAction.numberButtonTapped(inputNumberString: inputNumber, targetNumber: targetNumber)
        }
        
        inputNumber = "8"
        
        var labelanswerNumber = answerNumber {
        didSet{
            // ラベルに反映する
            makeResultLabel.changeLabel(inputNumberString: labelanswerNumber!, targetLabelInstance: calculatorView.resultLabel)
            }
        }
        
    }
    
    

    // 計算の挙動
    // ラベルに反映する挙動

}

