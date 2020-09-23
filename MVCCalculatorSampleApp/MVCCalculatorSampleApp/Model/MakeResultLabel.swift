//
//  MakeResultButton.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

// ラベル生成の挙動
import Foundation

class MakeResultLabel {
    // ラベル生成
    func makeLabel(screenWidth:CGFloat, screenWidth:CGFloat, targetView:UIView) {
        // ラベルの位置決定
        mainLabel.frame = CGRect(x:0, y: 100, width: screenWidth!, height: screenHeight! / 8)
        // ラベルの色決定
        mainLabel.textColor = UIColor.gray
        mainLabel.backgroundColor = UIColor.black
        // ラベルの文字サイズを設定
        mainLabel.font = UIFont.systemFont(ofSize: 40)
        // ラベルの位置決定
        mainLabel.textAlignment = NSTextAlignment.right
        
    }
    
    // ラベルの初期化処理
    func setFirstNumber(inputNumberString:String) {
        // ラベルの初期化
        inputNumberString = "0"
        mainLabel.text = inputNumberString
        targetView.addSubview(mainLabel)
    }
    
    // ラベルの表示処理
}
