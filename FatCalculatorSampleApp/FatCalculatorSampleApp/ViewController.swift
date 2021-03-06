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
    var calculatorType:Int?
    var answerNumber:Int?
    // labelのインスタンス生成
    let mainLabel = UILabel()
    // 選択したボタンの数字を格納する変数
    var tapNumber:Int?
    // 表示用変数
    var inputNumberString:String?
    // 計算記号用UIButtonのインスタンス格納用配列
    var additionButton = UIButton()
    let subtractionButton = UIButton()
    let divisionButton = UIButton()
    let multiplicationButton = UIButton()
    let equalButton = UIButton()
    let clearButton = UIButton()
//    var calculatButtonArray:[UIButton] = [additionButton, subtractionButton, divisionButton, multiplicationButton, equalButton, clearButton]
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
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
            case 2:
                plsceNumberName = "2"
                buttonPlaceX = buttonSizeWidth * 1;
                buttonPlaceY = buttonSizeHight * 8
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
                    makeNumberButton(buttonPlaceX: buttonPlaceX, buttonPlaceY: buttonPlaceY, buttonSizeWidth: newButtonSizeWidth, buttonSizeHight: buttonSizeHight, labelName: plsceNumberName!)
                }
            } else if placeNumber >= 1 && placeNumber < 10 {
                // 1~9の場合
                if let buttonPlaceX = buttonPlaceX, let buttonPlaceY = buttonPlaceY {
                    makeNumberButton(buttonPlaceX: buttonPlaceX, buttonPlaceY: buttonPlaceY, buttonSizeWidth: buttonSizeWidth, buttonSizeHight: buttonSizeHight, labelName: plsceNumberName!)
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
            if inputNumberString.count < 10 {
            if inputNumberString != "0" {
                self.inputNumberString! += "0"
                mainLabel.text = self.inputNumberString
            } else {
                self.inputNumberString! = "0"
                mainLabel.text = self.inputNumberString
            }
        }
        }
    }
    
    // タップされた時のアクション
    @objc func oneButtonTapped() {
        print("placeNumber:1")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
                if inputNumberString == "0" {
                    self.inputNumberString = "1"
                    print("inputNumberString:\(inputNumberString)")
                } else {
                    self.inputNumberString! += "1"
                }
            }
            
            mainLabel.text = self.inputNumberString
        }
    }
    // タップされた時のアクション
    @objc func tewButtonTapped() {
        print("placeNumber:2")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
                if inputNumberString == "0" {
                self.inputNumberString = "2"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "2"
            }
            }
            mainLabel.text = self.inputNumberString
        }
        
    }
    // タップされた時のアクション
    @objc func threeButtonTapped() {
        print("placeNumber:3")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
            if inputNumberString == "0" {
                self.inputNumberString = "3"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "3"
            }
            }
            mainLabel.text = self.inputNumberString
        }
        
    }
    // タップされた時のアクション
    @objc func fourButtonTapped() {
        print("placeNumber:4")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
            if inputNumberString == "0" {
                self.inputNumberString = "4"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "4"
            }
            mainLabel.text = self.inputNumberString
        }
        }
    }
    // タップされた時のアクション
    @objc func fiveButtonTapped() {
        print("placeNumber:5")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
            if inputNumberString == "0" {
                self.inputNumberString = "5"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "5"
            }
            mainLabel.text = self.inputNumberString
        }
        }
    }
    // タップされた時のアクション
    @objc func sixButtonTapped() {
        print("placeNumber:6")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
            if inputNumberString == "0" {
                self.inputNumberString = "6"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "6"
            }
            mainLabel.text = self.inputNumberString
        }
        }
    }
    // タップされた時のアクション
    @objc func sevenButtonTapped() {
        print("placeNumber:7")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
            if inputNumberString == "0" {
                self.inputNumberString = "7"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "7"
            }
            mainLabel.text = self.inputNumberString
        }
        }
    }
    // タップされた時のアクション
    @objc func eightButtonTapped() {
        print("placeNumber:8")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
            if inputNumberString == "0" {
                self.inputNumberString = "8"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "8"
            }
            mainLabel.text = self.inputNumberString
        }
        }
    }
    // タップされた時のアクション
    @objc func nineButtonTapped() {
        print("placeNumber:9")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            if inputNumberString.count < 10 {
            if inputNumberString == "0" {
                self.inputNumberString = "9"
                print("inputNumberString:\(inputNumberString)")
            } else {
                self.inputNumberString! += "9"
            }
            mainLabel.text = self.inputNumberString
        }
        }
    }
    // タップされた時のアクション
    @objc func ooButtonTapped() {
        print("placeNumber:00")
        print("inputNumberString:\(inputNumberString)")
        // lableに表示する
        if let inputNumberString = inputNumberString {
            print(inputNumberString.count)
            if inputNumberString.count < 9 {
            if inputNumberString != "0" {
                self.inputNumberString! += "00"
                }
            } else if inputNumberString.count == 9 {
                print("ok")
                self.inputNumberString! += "0"
                }
            mainLabel.text = self.inputNumberString
            }
        }
    
    // タップされた時のアクション
    @objc func additionButtonTapped() {
        print("taped:additionButtonTapped")
        // 計算用の変数にinputNumberStringを格納
        if let inputNumberString = inputNumberString {
            beforeNumber = Int(inputNumberString)
            // inputNumberStringを初期化
            self.inputNumberString = "0"

        }
        // 計算記号を格納する
        calculatorType = 1
        sleepButton()
        
        }
    @objc func subtractionButtonTapped() {
        print("taped:subtractionButtonTapped")
        // 計算用の変数にinputNumberStringを格納
        if let inputNumberString = inputNumberString {
            beforeNumber = Int(inputNumberString)
            // inputNumberStringを初期化
            self.inputNumberString = "0"
                }
                // 計算記号を格納する
                calculatorType = 2
                sleepButton()
           }
    
    @objc func divisionButtonTapped() {
        print("taped:divisionButtonTapped")
        // 計算用の変数にinputNumberStringを格納
        if let inputNumberString = inputNumberString {
            beforeNumber = Int(inputNumberString)
            // inputNumberStringを初期化
            self.inputNumberString = "0"
            }
            // 計算記号を格納する
            calculatorType = 3
            sleepButton()
           }
    
    @objc func multiplicationButtonTapped() {
        print("taped:multiplicationButtonTapped")
        // 計算用の変数にinputNumberStringを格納
                if let inputNumberString = inputNumberString {
                    beforeNumber = Int(inputNumberString)
                    // inputNumberStringを初期化
                    self.inputNumberString = "0"
                }
                // 計算記号を格納する
                calculatorType = 4
                sleepButton()
           }
    
    @objc func equalButtonTapped() {
        print("taped:equalButtonTapped")
        var errorNumber = ""
        if let calculatorType = calculatorType, let beforeNumber = beforeNumber, let inputNumberString = inputNumberString {
            switch calculatorType {
            case 1:
                // 足算
                self.answerNumber = beforeNumber + Int(inputNumberString)!
            case 2:
                // 引き算
                self.answerNumber = beforeNumber - Int(inputNumberString)!
            case 3:
                // 掛け算
                self.answerNumber = beforeNumber * Int(inputNumberString)!
            case 4:
                // 割り算
                if Int(inputNumberString) == 0 {
                    // 0で割られていた場合割り算を実行しない
                    errorNumber = "error"
                    print("0 error")
                } else {
                    // 0で割られていない場合割り算を実行
                    self.answerNumber = beforeNumber / Int(inputNumberString)!
                }
            default:
                return
            }
            // 0で割られていた場合errorを表示する
            if errorNumber == "error" {
                mainLabel.text = "error"
            } else {
                // 0で割られていない場合計算結果を表示するlabelに表示
                if let answerNumber = answerNumber {
                    mainLabel.text = "\(answerNumber)"
                    self.inputNumberString = "\(answerNumber)"
                    }
            }
            
            // 初期化
            self.beforeNumber = 0
            self.calculatorType = 0
            self.answerNumber = 0
            // ボタンの状態の初期化
            additionButton.isEnabled = true
            subtractionButton.isEnabled = true
            divisionButton.isEnabled = true
            multiplicationButton.isEnabled = true
            // 色の初期化
            additionButton.backgroundColor = UIColor.systemOrange
            subtractionButton.backgroundColor = UIColor.systemOrange
            divisionButton.backgroundColor = UIColor.systemOrange
            multiplicationButton.backgroundColor = UIColor.systemOrange
            
            }
        }
    
    @objc func clearButtonTapped() {
        print("taped")
        // label表示の初期化
        inputNumberString = "0"
        mainLabel.text = inputNumberString
        // 計算用変数を初期化
        beforeNumber = 0
        // 計算用記号変数を初期化
        calculatorType = 0
        answerNumber = 0
        // ボタンの状態の初期化
        additionButton.isEnabled = true
        subtractionButton.isEnabled = true
        divisionButton.isEnabled = true
        multiplicationButton.isEnabled = true
        // 色の初期化
        additionButton.backgroundColor = UIColor.systemOrange
        subtractionButton.backgroundColor = UIColor.systemOrange
        divisionButton.backgroundColor = UIColor.systemOrange
        multiplicationButton.backgroundColor = UIColor.systemOrange
        }
    
    // 四則演算ボタンの選択時の処理関数
    func sleepButton() {
        // 入力されている文字数が規定以下なら
//        if let cacalculatorType = calculatorType {
        switch calculatorType {
            case 1:
                additionButton.backgroundColor = UIColor.orange
            case 2:
                subtractionButton.backgroundColor = UIColor.orange
            case 3:
                divisionButton.backgroundColor = UIColor.orange
            case 4:
                multiplicationButton.backgroundColor = UIColor.orange
            default:
                print("error")
                return
            }
        // ボタンを押せないように設定
        additionButton.isEnabled = false
        subtractionButton.isEnabled = false
        divisionButton.isEnabled = false
        multiplicationButton.isEnabled = false
        }
//    }
    
    // 計算ボタンの生成
    func makeCalculatButton(buttonPlaceX: CGFloat, buttonPlaceY: CGFloat, buttonSizeWidth: CGFloat, buttonSizeHight: CGFloat, labelName: String) {
         // buttonのインスタンス作成
        var calculatButton:UIButton?
        
        switch labelName {
        case "+":
            calculatButton = additionButton
            calculatButton!.addTarget(self, action: #selector(self.additionButtonTapped), for: .touchUpInside)
        case "-":
            calculatButton = subtractionButton
            calculatButton!.addTarget(self, action: #selector(self.subtractionButtonTapped), for: .touchUpInside)
        case "*":
            calculatButton = divisionButton
            calculatButton!.addTarget(self, action: #selector(self.divisionButtonTapped), for: .touchUpInside)
        case "/":
            calculatButton = multiplicationButton
            calculatButton!.addTarget(self, action: #selector(self.multiplicationButtonTapped), for: .touchUpInside)
        case "=":
            calculatButton = equalButton
            calculatButton!.addTarget(self, action: #selector(self.equalButtonTapped), for: .touchUpInside)
        case "Clear":
            calculatButton = clearButton
            calculatButton!.addTarget(self, action: #selector(self.clearButtonTapped), for: .touchUpInside)
        default:
            return
        }
        // buttonのラベル作成
        calculatButton!.setTitle("\(labelName)", for: UIControl.State.normal)
        // buttonのフォントサイズを設定
        calculatButton!.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        calculatButton!.frame = CGRect(x: buttonPlaceX, y: buttonPlaceY, width: buttonSizeWidth, height: buttonSizeHight)
        
        calculatButton!.backgroundColor = UIColor.systemOrange
        // ボタンの枠線を設定
        calculatButton!.layer.borderColor = UIColor.darkGray.cgColor
        calculatButton!.layer.borderWidth = 2.0
        calculatButton!.layer.cornerRadius = 10
        
        // viewにボタンを追加
        self.view.addSubview(calculatButton!)
    }
    
    // 計算ボタンの生成
    func makeNumberButton(buttonPlaceX: CGFloat, buttonPlaceY: CGFloat, buttonSizeWidth: CGFloat, buttonSizeHight: CGFloat, labelName: String) {
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
        numberButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        numberButton.frame = CGRect(x: buttonPlaceX, y: buttonPlaceY, width: buttonSizeWidth, height: buttonSizeHight)
    
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
        mainLabel.frame = CGRect(x:0, y: 100, width: screenWidth!, height: screenHeight! / 8)
        // ラベルの色決定
        mainLabel.textColor = UIColor.gray
        mainLabel.backgroundColor = UIColor.black
        // ラベルの文字サイズを設定
        mainLabel.font = UIFont.systemFont(ofSize: 40)
        // ラベルの位置決定
        mainLabel.textAlignment = NSTextAlignment.right
        // ラベルの初期化
        inputNumberString = "0"
        mainLabel.text = inputNumberString
        self.view.addSubview(mainLabel)
    }
 
}

