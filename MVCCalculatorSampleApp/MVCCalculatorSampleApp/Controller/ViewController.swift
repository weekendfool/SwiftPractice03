//
//  ViewController.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期設定のコード
        // スクリーンサイズを取得
        // GetScreenSizeクラスのインスタンス作成
        let getScreenSize = GetScreenSize()
        // 関数を実行
        let myiPhoneScreenSize = getScreenSize.setScreenSize()
        print("myiPhoneScreenSize:\(myiPhoneScreenSize)")
        let screenWidth = myiPhoneScreenSize[0]
        let screenHeight = myiPhoneScreenSize[1]
        
        // labelの初期設定
        // GetScreenSizeクラスのインスタンス作成
        let makeResultLabel = MakeResultLabel()
        
    }

    // 計算の挙動
    // ラベルに反映する挙動

}

