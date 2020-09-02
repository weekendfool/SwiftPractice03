//
//  ViewController.swift
//  GameSampleApp
//
//  Created by 尾原徳泰 on 2020/08/30.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var sampleButton1: UIButton!
    @IBOutlet weak var sampleButton2: UIButton!
    @IBOutlet weak var sampleButton3: UIButton!
    @IBOutlet weak var sampleButton4: UIButton!
    @IBOutlet weak var sampleButton5: UIButton!
    @IBOutlet weak var sampleButton6: UIButton!
    @IBOutlet weak var sampleButton7: UIButton!
    @IBOutlet weak var sampleButton8: UIButton!
    @IBOutlet weak var sampleButton9: UIButton!
    
    //プレイヤーの変数
    var player = 0
    //奇数か偶数かの保持
    var playerCount = 0
    //マスの色を記録する辞書
    var colorDic: [Int: Int] = [1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtonborder()
        playerCount = 1
        player = 0
    }
//MARK: - ボタンの色変え
    func changeCouler(number: Int, player: Int) {
        var place:UIButton?
        //どのボタンが押されたかの条件分岐
        switch number {
        case 1:
            place = sampleButton1
        case 2:
            place = sampleButton2
        case 3:
            place = sampleButton3
        case 4:
            place = sampleButton4
        case 5:
            place = sampleButton5
        case 6:
            place = sampleButton6
        case 7:
            place = sampleButton7
        case 8:
            place = sampleButton8
        case 9:
            place = sampleButton9
        default:
            return
        }
        
        if player == 1 {
            //ボタンの色を変える処理
            place?.backgroundColor = UIColor.red
            //色を塗ったことを記録
            colorDic[number] = 1
        } else if player == 2 {
            //ボタンの色を変える処理
            place?.backgroundColor = UIColor.blue
            //色を塗ったことを記録
            colorDic[number] = 2
        }
        
        //二回以上選択できなくする処理
        place?.isEnabled = false
        
        
    }
    //MARK: - プレイヤーの選択
    func judgmentPlayerNumber(playerCount: Int) {
        //奇数か偶数かで１pか２pかを判断する
        if (playerCount % 2) == 1 {
            //奇数なら１p
            player = 1
        } else {
            //偶数なら２p
            player = 2
        }
        
    }
    //MARK: - ボタンのActionを関数化
    func butttonActionGroup(number: Int) {
        //プレイヤーを選別
        print("playerCount5:\(playerCount)")
        judgmentPlayerNumber(playerCount: playerCount)
        //色を変える処理
        changeCouler(number: number, player: player)
        //色を記録する処理
        saveDrowPLaceOfColor(number: number)
        //勝敗の判定
        judgmentWiner()
        //playerCountのカウントをすすめる
        playerCount += 1
        chack()
    }
    
     //MARK: - ボタンの枠線を設定
    func setButtonborder() {
        //for文で全てのボタンに枠線を設定する
        for num in 1...9 {
            var selectButtton: UIButton?
            //switch文でどのボタンが押されたかの条件分岐
            switch num {
            case 1:
                selectButtton = sampleButton1
            case 2:
                selectButtton = sampleButton2
            case 3:
                selectButtton = sampleButton3
            case 4:
                selectButtton = sampleButton4
            case 5:
                selectButtton = sampleButton5
            case 6:
                selectButtton = sampleButton6
            case 7:
                selectButtton = sampleButton7
            case 8:
                selectButtton = sampleButton8
            case 9:
                selectButtton = sampleButton9
            default:
                return
            }
            //buttonの枠線の色を設定
            selectButtton?.layer.borderColor = UIColor.gray.cgColor
            //buttonの枠線の幅を設定
            selectButtton?.layer.borderWidth = 3.0
            }
        
    }
    
    //MARK: - ボタンのAction

    @IBAction func sampleButton1Action(_ sender: Any) {
        butttonActionGroup(number: 1)
    }
    
    @IBAction func sampleButton2Action(_ sender: Any) {
        butttonActionGroup(number: 2)
    }
    @IBAction func sampleButton3Action(_ sender: Any) {
        butttonActionGroup(number: 3)
    }
    
    @IBAction func sampleButton4Action(_ sender: Any) {
        butttonActionGroup(number: 4)
    }
    
    @IBAction func sampleButton5Action(_ sender: Any) {
        butttonActionGroup(number: 5)
    }
    
    @IBAction func sampleButton6Action(_ sender: Any) {
        butttonActionGroup(number: 6)
    }
    
    @IBAction func sampleButton7Action(_ sender: Any) {
        butttonActionGroup(number: 7)
    }
    
    @IBAction func sampleButton8Action(_ sender: Any) {
        butttonActionGroup(number: 8)
    }
    
    @IBAction func sampleButton9Action(_ sender: Any) {
        butttonActionGroup(number: 9)
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        resetAction()
    }
    
    
    //チェック用関数
    func chack() {
        print("playerCount:\(playerCount)")
        print("player:\(player)")
    }
    
    //MARK: - 塗られた箇所の色の記録
    func saveDrowPLaceOfColor(number: Int) {
        if player == 1 {
            //色を塗ったことを記録
            colorDic[number] = 1
        } else if player == 2 {
            //色を塗ったことを記録
            colorDic[number] = 2
        }
        //確認用
        print(colorDic)
    }
    
    //MARK: - 勝負の判定機能
    func judgmentWiner() {
        //勝敗が決まるかの判定を二色分for文で行う
        let dic1 = colorDic[1]
        let dic2 = colorDic[2]
        let dic3 = colorDic[3]
        let dic4 = colorDic[4]
        let dic5 = colorDic[5]
        let dic6 = colorDic[6]
        let dic7 = colorDic[7]
        let dic8 = colorDic[8]
        let dic9 = colorDic[9]
        
        //勝敗が決まるかの判定を二色分for文で行う
        for num in 1...2 {
            if (dic1 == num && dic2 == num && dic3 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
            } else if (dic4 == num && dic5 == num && dic6 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
            } else if (dic7 == num && dic8 == num && dic9 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
            } else if (dic1 == num && dic4 == num && dic7 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
            } else if (dic2 == num && dic5 == num && dic8 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
            } else if (dic3 == num && dic6 == num && dic9 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
            } else if (dic1 == num && dic5 == num && dic9 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
            } else if (dic3 == num && dic5 == num && dic7 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
            } else if playerCount == 9 {
                sampleLabel.text = "ドロー"
            }
        }
    }
    //MARK: - 勝敗が確定した時のボタン凍結機能
    func stopButtonAction() {
        //for文で全てのボタンを選択できなくする
        for num in 1...9 {
            var selectButtton: UIButton?
            //switch文でどのボタンが押されたかの条件分岐
            switch num {
            case 1:
                selectButtton = sampleButton1
            case 2:
                selectButtton = sampleButton2
            case 3:
                selectButtton = sampleButton3
            case 4:
                selectButtton = sampleButton4
            case 5:
                selectButtton = sampleButton5
            case 6:
                selectButtton = sampleButton6
            case 7:
                selectButtton = sampleButton7
            case 8:
                selectButtton = sampleButton8
            case 9:
                selectButtton = sampleButton9
            default:
                return
            }
            //buttonの枠線の色を設定
            selectButtton?.isEnabled = false
            }
    }
    
     //MARK: - リセット機能
    func resetAction() {
        //変数の初期化
        playerCount = 1
        player = 0
        //for文で全てのボタンの色の初期化する
        for num in 1...9 {
            colorDic[num] = 0
        }
        
        //for文で全てのボタンの色の初期化する
        for num in 1...9 {
            var selectButtton: UIButton?
            //switch文でどのボタンが押されたかの条件分岐
            switch num {
            case 1:
                selectButtton = sampleButton1
            case 2:
                selectButtton = sampleButton2
            case 3:
                selectButtton = sampleButton3
            case 4:
                selectButtton = sampleButton4
            case 5:
                selectButtton = sampleButton5
            case 6:
                selectButtton = sampleButton6
            case 7:
                selectButtton = sampleButton7
            case 8:
                selectButtton = sampleButton8
            case 9:
                selectButtton = sampleButton9
            default:
                return
            }
            selectButtton?.backgroundColor = UIColor.white
            selectButtton?.isEnabled = true
        }
    }
    
}

