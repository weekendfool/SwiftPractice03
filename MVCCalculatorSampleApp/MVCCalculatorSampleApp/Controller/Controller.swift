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

    // 計算の挙動
    // ラベルに反映する挙動

}

