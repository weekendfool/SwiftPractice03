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
    }
    
    // スクリーンサイズの取得
    func setScreenSize() {
        screenWidth = self.view.frame.width
        screenHeight = self.view.frame.height
    }

    // レイアウトもコードで生成
    // ボタンの生成
    func MakeNumberButton(number: Int) {
        // ボタンのサイズを設定する
        // もしスクリーンサイズが取得できなかったら関数を抜ける
        guard let screenWidth = screenWidth, let screenHeight = screenHeight else { return }
            let buttonSizeWidth = screenWidth / 7.0
            let buttonSizeHight = screenHeight / 8.0
        // 場所を格納する変数設定
        var plsceNumber:String?
        var buttonPlaceX:CGFloat?
        var buttonPlaceY:CGFloat?
        // buttonのインスタンス作成
        let uiButton = UIButton()
        // for文で網羅する
        for placeNumber in 0...11 {
            // スイッチ文で条件分岐
            switch number {
            case 1:
                plsceNumber = "1";
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 6
            case 2:
                plsceNumber = "2"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 6
            case 3:
                plsceNumber = "3"
                buttonPlaceX = buttonSizeWidth * 4;
                buttonPlaceY = buttonSizeHight * 6
            case 4:
                plsceNumber = "4"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 5
            case 5:
                plsceNumber = "5"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 5
            case 6:
                plsceNumber = "6"
                buttonPlaceX = buttonSizeWidth * 4;
                buttonPlaceY = buttonSizeHight * 5
            case 7:
                plsceNumber = "7"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 4
            case 8:
                plsceNumber = "8"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 4
            case 9:
                plsceNumber = "9"
                buttonPlaceX = buttonSizeWidth * 4;
                buttonPlaceY = buttonSizeHight * 4
            case 0:
                plsceNumber = "0"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 7
            case 10:
                plsceNumber = "00"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 7
            case 11:
                plsceNumber = "Cler"
                buttonPlaceX = buttonSizeWidth * 4;
                buttonPlaceY = buttonSizeHight * 7
            default:
                print("errror");
                return
            }
            // 位置とサイズを指定
            if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                uiButton.frame = CGRect(x: buttonPlaceX, y: buttonPlaceY, width: buttonSizeWidth, height: buttonSizeHight)
            }
            // buttonのラベル作成
            uiButton.setTitle(plsceNumber, for: UIControl.State.normal)
            // buttonのフォントサイズを設定
            uiButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            // タップされた時のアクション
            uiButton.addTarget(self, action: #selector(ViewController.buttonTapped(_:)), for: .touchUpOutside)
            // viewにボタンを追加
            self.view.addSubview(uiButton)
        }
        
    }
    // タップされた時のアクション
    @objc func buttonTapped(_ sender : Any) {
        print("taped")
    }
    // ラベル生成
    
    //　表示機能
    // 数字入力機能
    //　クリア機能

}

