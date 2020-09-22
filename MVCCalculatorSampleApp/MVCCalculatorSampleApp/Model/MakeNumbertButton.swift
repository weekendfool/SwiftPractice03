//
//  MakeButton.swift
//  MVCCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

// 数字用のボタンを生成を担当
import Foundation
import UIKit

class MakeNumbertButton {
    // ボタンサイズの設定
    func setButtonSize(screenWidth:CGFloat, screenHeight:CGFloat) -> (CGFloat, CGFloat){
        // ボタンのサイズの計算
        let buttonSizeWidth = screenWidth / 3.0　// 幅
        let buttonSizeHight = screenHeight / 12.0　// 高さ
        // 算出した値を返却
        return (buttonSizeWidth, buttonSizeHight)
    }
    
    // ボタンをviewに描写する
    func makeNumberButton(buttonSizeWidth:CGFloat, buttonSizeHight:CGFloat) {
        
    }
}
    

