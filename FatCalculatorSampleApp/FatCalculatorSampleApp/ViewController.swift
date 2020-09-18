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
    // 計算に使用する変数
    var beforeNumber:Int?
    var afterNumber:Int?
    var answerNumber:Int?
    // labelのインスタンス生成
    let mainLabel = UILabel()
    // 選択したボタンの数字を格納する変数
    var tapNumber:Int?
    // どのボタンが押されたかの把握よう変数を設定
    var actionNumber = ()
    // 表示用変数
    var inputNumberString:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setScreenSize()
//        makeCalculatButton()
        makeNumberButton()
        makeLabel()
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
        
       
        // for文で網羅する
        for placeNumber in 0...16 {
//            print("placeNumber:\(placeNumber)")
            // スイッチ文で条件分岐
            switch placeNumber {
            case 1:
                plsceNumberName = "1";
                buttonPlaceX = buttonSizeWidth * 0;
                buttonPlaceY = buttonSizeHight * 8
                // どのボタンが押されたかの把握よう変数を設定
                actionNumber = oneButtonTapped()
            case 2:
                plsceNumberName = "2"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 8
                // どのボタンが押されたかの把握よう変数を設定
                actionNumber = tewButtonTapped()
            case 3:
                plsceNumberName = "3"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 8
            
            case 4:
                plsceNumberName = "4"
                buttonPlaceX = buttonSizeWidth * 0;
                buttonPlaceY = buttonSizeHight * 7
                
            case 5:
                plsceNumberName = "5"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 7
      
            case 6:
                plsceNumberName = "6"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 7
          
            case 7:
                plsceNumberName = "7"
                buttonPlaceX = buttonSizeWidth * 0;
                buttonPlaceY = buttonSizeHight * 6
       
            case 8:
                plsceNumberName = "8"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 6
 
            case 9:
                plsceNumberName = "9"
                buttonPlaceX = buttonSizeWidth * 2;
                buttonPlaceY = buttonSizeHight * 6

            case 0:
                plsceNumberName = "0"
                buttonPlaceX = buttonSizeWidth * 0
                buttonPlaceY = buttonSizeHight * 9

            case 10:
                plsceNumberName = "00"
                buttonPlaceX = buttonSizeWidth * 3 / 2
                buttonPlaceY = buttonSizeHight * 9

            case 11:
                plsceNumberName = "+"
                buttonPlaceX = buttonSizeWidth * 0
                buttonPlaceY = buttonSizeHight * 10
            case 12:
                plsceNumberName = "-"
                buttonPlaceX = buttonSizeWidth * 3 / 4
                buttonPlaceY = buttonSizeHight * 10
            case 13:
                plsceNumberName = "*"
                buttonPlaceX = buttonSizeWidth * 3 / 2
                buttonPlaceY = buttonSizeHight * 10
            case 14:
                plsceNumberName = "/"
                buttonPlaceX = buttonSizeWidth * 9 / 4
                buttonPlaceY = buttonSizeHight * 10
            case 15:
                plsceNumberName = "="
                buttonPlaceX = buttonSizeWidth * 0
                buttonPlaceY = buttonSizeHight * 11
            case 16:
                plsceNumberName = "Clear"
                buttonPlaceX = buttonSizeWidth * 3 / 2
                buttonPlaceY = buttonSizeHight * 11
            default:
                print("errror")
                return
            }
            // 位置とサイズを指定
            if placeNumber == 0 || placeNumber == 10 {
                // 0と10の場合
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    let newButtonSizeWidth = buttonSizeWidth * 3 / 2
                    makeNumberButton(buttonPlaceX: buttonPlaceX, buttonPlaceY: buttonPlaceY, buttonSizeWidth: newButtonSizeWidth, buttonSizeHight: buttonSizeHight, labelName: plsceNumberName!, action: actionNumber)
                }
            } else if placeNumber >= 1 && placeNumber < 10 {
                // 1~9の場合
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    makeNumberButton(buttonPlaceX: buttonPlaceX, buttonPlaceY: buttonPlaceY, buttonSizeWidth: buttonSizeWidth, buttonSizeHight: buttonSizeHight, labelName: plsceNumberName!, action: actionNumber)
                  
                }
            } else if placeNumber >= 11 && placeNumber < 15 {
                // ボタンの大きさを調整
                let newButtonSizeWidth = buttonSizeWidth * 3 / 4
                // ボタンの位置を調整
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    makeCalculatButton(buttonPlaceX: buttonPlaceX, buttonPlaceY: buttonPlaceY, buttonSizeWidth: newButtonSizeWidth, buttonSizeHight: buttonSizeHight, labelName: plsceNumberName!)
                }
            } else if placeNumber >= 15 && placeNumber < 17 {
                // ボタンの大きさを調整
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    // ボタンの位置を調整
                    let newButtonSizeWidth = buttonSizeWidth * 3 / 2
                    makeCalculatButton(buttonPlaceX: buttonPlaceX, buttonPlaceY: buttonPlaceY, buttonSizeWidth: newButtonSizeWidth, buttonSizeHight: buttonSizeHight, labelName: plsceNumberName!)
                }
            }
        }
        
    }
    // MARK:- ボタンのアクション群
    // タップされた時のアクション
    @objc func zeroButtonTapped() {
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString != "0" {
                self.inputNumberString! += "0"
            }
        }
        
        // 計算用の変数に入れる
       
        
    }
    // タップされた時のアクション
    @objc func oneButtonTapped() {
        print("placeNumber:1")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            
            if inputNumberString == "0" {
                self.inputNumberString = "1"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "1"
            }
            mainLabel.text = self.inputNumberString
        }
        
        
    }
    // タップされた時のアクション
    @objc func tewButtonTapped() {
        print("taped")
        print("placeNumber:2")
        
    }
    // タップされた時のアクション
    @objc func threeButtonTapped() {
        print("taped")
        print("placeNumber:3")
        
    }
    // タップされた時のアクション
    @objc func fourButtonTapped() {
        print("taped")
        print("placeNumber:4")
        
    }
    // タップされた時のアクション
    @objc func fiveButtonTapped() {
        print("taped")
        print("placeNumber:5")
        
    }
    // タップされた時のアクション
    @objc func sixButtonTapped() {
        print("taped")
        print("placeNumber:6")
        
    }
    // タップされた時のアクション
    @objc func sevenButtonTapped() {
        print("taped")
        print("placeNumber:7")
        
    }
    // タップされた時のアクション
    @objc func eightButtonTapped() {
        print("taped")
        print("placeNumber:8")
        
    }
    // タップされた時のアクション
    @objc func nineButtonTapped() {
        print("taped")
        print("placeNumber:9")
        
    }
    // タップされた時のアクション
    @objc func ooButtonTapped() {
        print("taped")
        print("placeNumber:00")
        
    }
    // タップされた時のアクション
        @objc func calculatButtonTapped(placeNumber: String) {
            print("taped")
            print("placeNumber:\(placeNumber)")
    //        switch placeNumber {
    //        case "0":
    //            <#code#>
    //        default:
    //            <#code#>
    //        }
        }
    
    // 計算ボタンの生成
    func makeCalculatButton(buttonPlaceX: CGFloat, buttonPlaceY: CGFloat, buttonSizeWidth: CGFloat, buttonSizeHight: CGFloat, labelName: String) {
         
        // buttonのインスタンス作成
        let calculatButton = UIButton()
        // buttonのラベル作成
        calculatButton.setTitle("\(labelName)", for: UIControl.State.normal)
        // buttonのフォントサイズを設定
        calculatButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        calculatButton.frame = CGRect(x: buttonPlaceX, y: buttonPlaceY, width: buttonSizeWidth, height: buttonSizeHight)
        // タップされた時のアクション
        calculatButton.addTarget(self, action: #selector(ViewController.calculatButtonTapped(placeNumber:)), for: .touchUpInside)
        calculatButton.backgroundColor = UIColor.orange
        // ボタンの枠線を設定
        calculatButton.layer.borderColor = UIColor.darkGray.cgColor
        calculatButton.layer.borderWidth = 2.0
        calculatButton.layer.cornerRadius = 10
        
        // viewにボタンを追加
        self.view.addSubview(calculatButton)
    }
    
    // 計算ボタンの生成
    func makeNumberButton(buttonPlaceX: CGFloat, buttonPlaceY: CGFloat, buttonSizeWidth: CGFloat, buttonSizeHight: CGFloat, labelName: String, action: ()) {
        // buttonのインスタンス作成
        let numberButton = UIButton()
        switch labelName {
        case "1":
            numberButton.addTarget(self, action: #selector(self.oneButtonTapped), for: .touchUpInside)
        case "2":
            numberButton.addTarget(self, action: #selector(self.tewButtonTapped), for: .touchUpInside)
        case "3":
            numberButton.addTarget(self, action: #selector(self.threeButtonTapped), for: .touchUpInside)
        case "4":
            numberButton.addTarget(self, action: #selector(self.fourButtonTapped), for: .touchUpInside)
        case "5":
            numberButton.addTarget(self, action: #selector(self.fiveButtonTapped), for: .touchUpInside)
        case "6":
            numberButton.addTarget(self, action: #selector(self.sixButtonTapped), for: .touchUpInside)
        case "7":
            numberButton.addTarget(self, action: #selector(self.sevenButtonTapped), for: .touchUpInside)
        case "8":
            numberButton.addTarget(self, action: #selector(self.eightButtonTapped), for: .touchUpInside)
        case "9":
            numberButton.addTarget(self, action: #selector(self.nineButtonTapped), for: .touchUpInside)
        case "0":
            numberButton.addTarget(self, action: #selector(self.zeroButtonTapped), for: .touchUpInside)
        case "00":
            numberButton.addTarget(self, action: #selector(self.ooButtonTapped), for: .touchUpInside)
        default:
            return
        }
        
        // buttonのラベル作成
        numberButton.setTitle("\(labelName)", for: UIControl.State.normal)
        // buttonのフォントサイズを設定
        numberButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        numberButton.frame = CGRect(x: buttonPlaceX, y: buttonPlaceY, width: buttonSizeWidth, height: buttonSizeHight)
        // タップされた時のアクション
        
        
        numberButton.backgroundColor = UIColor.gray
        // ボタンの枠線を設定
        numberButton.layer.borderColor = UIColor.darkGray.cgColor
        numberButton.layer.borderWidth = 2.0
        numberButton.layer.cornerRadius = 10
        
        // viewにボタンを追加
        self.view.addSubview(numberButton)
       
        
    }
    // ラベル生成
    func makeLabel() {
        // ラベルの位置決定
        mainLabel.frame = CGRect(x:0, y: 0, width: screenWidth!, height: screenHeight! / 9)
        // ラベルの色決定
        mainLabel.textColor = UIColor.gray
        mainLabel.backgroundColor = UIColor.black
        // ラベルの文字サイズを設定
        mainLabel.font = UIFont.systemFont(ofSize: 30)
        // ラベルの位置決定
        mainLabel.textAlignment = NSTextAlignment.right
        // ラベルの初期化
        inputNumberString = "0"
        mainLabel.text = inputNumberString
        self.view.addSubview(mainLabel)
    }
    //　表示機能
    // 数字入力機能
    //　クリア機能

}

