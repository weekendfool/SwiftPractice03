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
//        makeCalculatButton()
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
        print("buttonSizeWidth:\(buttonSizeWidth)")
        print("buttonSizeHight:\(buttonSizeHight)")
        // 場所を格納する変数設定
        var plsceNumberName:String?
        var buttonPlaceX:CGFloat?
        var buttonPlaceY:CGFloat?
        // buttonのインスタンス作成
        let uiButton = UIButton()
        // for文で網羅する
        for placeNumber in 0...10 {
            print("placeNumber:\(placeNumber)")
            // スイッチ文で条件分岐
            switch placeNumber {
            case 1:
                plsceNumberName = "1";
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 9
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 2:
                plsceNumberName = "2"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 9
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 3:
                plsceNumberName = "3"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 9
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 4:
                plsceNumberName = "4"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 8
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 5:
                plsceNumberName = "5"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 8
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 6:
                plsceNumberName = "6"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 8
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 7:
                plsceNumberName = "7"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 7
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 8:
                plsceNumberName = "8"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 7
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 9:
                plsceNumberName = "9"
                buttonPlaceX = buttonSizeWidth * 3;
                buttonPlaceY = buttonSizeHight * 7
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            case 0:
                plsceNumberName = "0"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 10
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
                print("KO")
            case 10:
                plsceNumberName = "00"
                buttonPlaceX = buttonSizeWidth / 2 * 3;
                buttonPlaceY = buttonSizeHight * 10
                print("-------------------------------")
                print("placeNumber:\(placeNumber)")
                print("buttonPlaceX:\(buttonPlaceX)")
                print("buttonPlaceY:\(buttonPlaceY)")
            default:
                print("errror");
                return
            }
            // 位置とサイズを指定
            if placeNumber == 0 || placeNumber == 10 {
                // 0と10の場合
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    uiButton.frame = CGRect(x: 10, y: buttonPlaceY, width: buttonSizeWidth * 3 / 2, height: buttonSizeHight)
                    print("$$$$$$$$$$$$$$$$$$$$$$$$$4")
                }
            } else {
                // 1~9の場合
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    uiButton.frame = CGRect(x: 10, y: buttonPlaceY, width: buttonSizeWidth, height: buttonSizeHight)
//                    // buttonのラベル作成
//                    uiButton.setTitle(plsceNumberName, for: UIControl.State.normal)
//                    // buttonのフォントサイズを設定
//                    uiButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//                    // タップされた時のアクション
//                    uiButton.addTarget(self, action: #selector(ViewController.buttonTapped(placeNumber:)), for: .touchUpOutside)
//                    uiButton.backgroundColor = UIColor.red
//                    // viewにボタンを追加
//                    self.view.addSubview(uiButton)
//                    print("ButtonMake")
                }
            }
            
            // buttonのラベル作成
            uiButton.setTitle(plsceNumberName, for: UIControl.State.normal)
            // buttonのフォントサイズを設定
            uiButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            // タップされた時のアクション
            uiButton.addTarget(self, action: #selector(ViewController.buttonTapped(placeNumber:)), for: .touchUpOutside)
            uiButton.backgroundColor = UIColor.red
            // viewにボタンを追加
            self.view.addSubview(uiButton)
            print("ButtonMake")
        }
        
    }
    // タップされた時のアクション
    @objc func buttonTapped(placeNumber: String) {
        print("taped")
        print("placeNumber:\(placeNumber)")
    }
    
    // 計算ボタンの生成
    func makeCalculatButton() {
        // buttonのインスタンス作成
        let uiButton = UIButton()
        // buttonのラベル作成
        uiButton.setTitle("ok", for: UIControl.State.normal)
        // buttonのフォントサイズを設定
        uiButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        uiButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        // タップされた時のアクション
        uiButton.addTarget(self, action: #selector(ViewController.buttonTapped(placeNumber:)), for: .touchUpOutside)
        uiButton.backgroundColor = UIColor.red
        // viewにボタンを追加
        self.view.addSubview(uiButton)
        print("ButtonMake")
    }
    // ラベル生成
    
    //　表示機能
    // 数字入力機能
    //　クリア機能

}

