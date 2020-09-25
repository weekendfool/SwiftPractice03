//
//  ViewController.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

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
        
        // 数字ボタンを作成
        makeNumbertButton.makeNumberButton(screenWidth: screenWidth, screenHeight: screenHeight, targetView: mainView!)
    }

    // 計算の挙動
    // ラベルに反映する挙動

}

