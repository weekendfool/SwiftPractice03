//
//  MakeView.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

var additionButton = UIButton(type: .custom)
// 画面の反映担当クラス
// 画面の描写のみ担当する
class CalculatorView {
    // 画面に使用されている要素のインスタンス
    // 計算結果を反映するラベル
    var resultLabel = UILabel()
    // 四則演算用のボタン
    @IBOutlet public weak var subtractionButton: UIButton!
//    let subtractionButton = UIButton()
    let divisionButton = UIButton()
    let multiplicationButton = UIButton()
    let equalButton = UIButton()
    let clearButton = UIButton()
    
}
