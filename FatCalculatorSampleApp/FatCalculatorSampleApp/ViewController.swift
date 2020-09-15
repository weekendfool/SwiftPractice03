//
//  ViewController.swift
//  FatCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/15.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // レイアウトもコードで生成
    // ボタンの生成
    func MakeNumberButton(number: Int) {
        // 場所を格納する変数設定
        var plsceNumber:String?
        // buttonのインスタンス作成
        let uiButton = UIButton()
        // スイッチ文で条件分岐
        switch number {
        case 1:
            plsceNumber = "1"
        case 2:
            plsceNumber = "2"
        case 3:
            plsceNumber = "3"
        case 4:
            plsceNumber = "4"
        case 5:
            plsceNumber = "5"
        case 6:
            plsceNumber = "6"
        case 7:
            plsceNumber = "7"
        case 8:
            plsceNumber = "8"
        case 9:
            plsceNumber = "9"
        case 0:
            plsceNumber = "0"
        case 00:
            plsceNumber = "00"
        case 100:
            plsceNumber = "Cler"
        default:
            return
        }
        // 位置とサイズを指定
        // buttonのラベル作成
        uiButton.setTitle(plsceNumber, for: UIControl.State.normal)
        // buttonのフォントサイズを設定
        uiButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
    }
    // ラベル生成
    
    //　表示機能
    // 数字入力機能
    //　クリア機能

}

