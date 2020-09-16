//
//  ViewController.swift
//  FatCalculatorSampleApp
//
//  Created by 尾原徳泰 on 2020/09/15.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // スクリーンサイズを格納する変数
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setScreenSize()
        makeNumberButton()
    }
    
    // スクリーンサイズの取得
    func setScreenSize() {
        screenWidth = UIScreen.main.bounds.size.width
        screenHeight = UIScreen.main.bounds.size.height
    }

    // レイアウトもコードで生成
    // 数字ボタンの生成
    func makeNumberButton() {
        // ボタンのサイズを設定する
        // もしスクリーンサイズが取得できなかったら関数を抜ける
        guard let screenWidth = screenWidth, let screenHeight = screenHeight else { return }
            let buttonSizeWidth = screenWidth / 3.0
            let buttonSizeHight = screenHeight / 12.0
        // 場所を格納する変数設定
        var plsceNumberName:String?
        var buttonPlaceX:CGFloat?
        var buttonPlaceY:CGFloat?
        // buttonのインスタンス作成
        let uiButton = UIButton()
        // for文で網羅する
        for placeNumber in 0...10 {
            // スイッチ文で条件分岐
            switch placeNumber {
            case 1:
                plsceNumberName = "1";
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 9
            case 2:
                plsceNumberName = "2"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 9
            case 3:
                plsceNumberName = "3"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 9
            case 4:
                plsceNumberName = "4"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 8
            case 5:
                plsceNumberName = "5"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 8
            case 6:
                plsceNumberName = "6"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 8
            case 7:
                plsceNumberName = "7"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 7
            case 8:
                plsceNumberName = "8"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 7
            case 9:
                plsceNumberName = "9"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 7
            case 0:
                plsceNumberName = "0"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 10
            case 10:
                plsceNumberName = "00"
                buttonPlaceX = buttonSizeWidth / 2 * 3;
                buttonPlaceY = buttonSizeHight * 10
            default:
                print("errror");
                return
            }
            // 位置とサイズを指定
            if placeNumber == 0 || placeNumber == 10 {
                // 0と10の場合
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    uiButton.frame = CGRect(x: buttonPlaceX, y: buttonPlaceY, width: buttonSizeWidth * 3 / 2, height: buttonSizeHight)
                }
            } else {
                // 1~9の場合
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    uiButton.frame = CGRect(x: buttonPlaceX, y: buttonPlaceY, width: buttonSizeWidth, height: buttonSizeHight)
                }
            }
            
            // buttonのラベル作成
            uiButton.setTitle(plsceNumberName, for: UIControl.State.normal)
            // buttonのフォントサイズを設定
            uiButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            // タップされた時のアクション
            uiButton.addTarget(self, action: #selector(ViewController.buttonTapped(placeNumber:)), for: .touchUpOutside)
            // viewにボタンを追加
            self.view.addSubview(uiButton)
        }
        
    }
    // タップされた時のアクション
    @objc func buttonTapped(placeNumber: String) {
        print("taped")
        print("placeNumber:\(placeNumber)")
    }
    
    // 計算ボタンの生成
    func makeCalculatButton() {
        
    }
    // ラベル生成
    
    //　表示機能
    // 数字入力機能
    //　クリア機能

}

