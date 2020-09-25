//
//  MakeView.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

// 画面の反映担当クラス
// 画面の描写のみ担当する
class CalculatorView {
    // 画面に使用されている要素のインスタンス
    // 計算結果を反映するラベル
    var resultLabel = UILabel()
    // 四則演算用のボタン
    let additionButton = UIButton()
    let subtractionButton = UIButton()
    let divisionButton = UIButton()
    let multiplicationButton = UIButton()
    let equalButton = UIButton()
    let clearButton = UIButton()
    // UIViewControllerのインスタンス作成
    let controller = Controller()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期設定のコード
        // GetScreenSizeクラスのインスタンス作成
        let getScreenSize = GetScreenSize()
        // 関数を実行
        let myiPhoneScreenSize = getScreenSize.setScreenSize()
        print("myiPhoneScreenSize:\(myiPhoneScreenSize)")
        let screenWidth = myiPhoneScreenSize.0
        let screenHeight = myiPhoneScreenSize.1
        // GetScreenSizeクラスのインスタンス作成
        let makeResultLabel = ResultLabel()
        // SetBackGroundColorのインスタンスを作成
        let setBackGroundColor = SetBackGroundColor()
        setBackGroundColor.setBackGroundColor(view: self.view)
        // labelを描画
        makeResultLabel.makeResultLabel(screenWidth: screenWidth, screenHeight: screenHeight, targetView: self.view, targetLabelInstance: resultLabel)
    }

    // ボタン生成の関数
    // 数字ボタン
    // 四則演算ボタン
    // バックグラウンドカラーの設定
    
    // ラベル生成の関数

}
