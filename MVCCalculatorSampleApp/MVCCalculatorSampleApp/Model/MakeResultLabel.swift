//
//  MakeResultButton.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

// ラベルの生成を担当
import Foundation
import UIKit

class MakeResultLabel {
    // ラベル生成
    func makeResultLabel(screenWidth:CGFloat, screenHeight:CGFloat, targetView:UIView, targetLabelInstance:UILabel) {
        // ラベルの位置決定
        targetLabelInstance.frame = CGRect(x:0, y: 100, width: screenWidth, height: screenHeight / 8)
        // ラベルの色決定
        targetLabelInstance.textColor = UIColor.gray
        targetLabelInstance.backgroundColor = UIColor.black
        // ラベルの文字サイズを設定
        targetLabelInstance.font = UIFont.systemFont(ofSize: 40)
        // ラベルの位置決定
        targetLabelInstance.textAlignment = NSTextAlignment.right
        // viewに追加
        targetView.addSubview(targetLabelInstance)
    }
    
    // ラベルの初期化処理
    func setFirstNumber(targetLabelInstance:UILabel) {
        // ラベルの初期化
        let inputNumberString = "0"
        targetLabelInstance.text = inputNumberString
    }
    
    // ラベルの表示処理
    func changeLabel(inputNumberString:String, targetLabelInstance:UILabel) {
        // ラベルの表示処理
        targetLabelInstance.text = inputNumberString
    }
    
}
