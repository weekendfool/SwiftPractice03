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
    
    @IBOutlet weak var changeButton1: UIButton!
    @IBOutlet weak var changeButton2: UIButton!
    @IBOutlet weak var changeButton3: UIButton!
    @IBOutlet weak var changeButton4: UIButton!
    @IBOutlet weak var changeButton5: UIButton!
    @IBOutlet weak var changeButton6: UIButton!
    @IBOutlet weak var changeActionButton: UIButton!
    
    //プレイヤーの変数
    var player = 0
    //奇数か偶数かの保持
    var playerCount = 0
    //マスの色を記録する辞書
    var colorDic: [Int: Int] = [1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0]
    //ボタンの選択個数を保持する変数
    var buttonCount = 0
    //場所移動する選択肢の数字を格納する辞書
    var buttonDic: [Int: Int] = [0:0, 1:0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtonborder()
        playerCount = 1
        player = 0
        selectChangebutton()
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
    //格マスのボタンの処理
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
    //リセットボタンの処理
    @IBAction func resetButtonAction(_ sender: Any) {
        resetAction()
    }
    //入れ替える場所を選択するボタン
    @IBAction func changeButton1Action(_ sender: Any) {
        tappedChangeButton(buttonNumber: 1)
    }
    
    @IBAction func changeButton2Action(_ sender: Any) {
        tappedChangeButton(buttonNumber: 2)
    }
    
    @IBAction func changeButton3Action(_ sender: Any) {
        tappedChangeButton(buttonNumber: 3)
    }
    
    @IBAction func changeButton4Action(_ sender: Any) {
        tappedChangeButton(buttonNumber: 4)
    }
    
    @IBAction func changeButton5Action(_ sender: Any) {
        tappedChangeButton(buttonNumber: 5)
    }
    
    @IBAction func changeButton6Action(_ sender: Any) {
        tappedChangeButton(buttonNumber: 6)
    }
    //入れ替えを実行するボタン
    @IBAction func changeActionButtonAction(_ sender: Any) {
        //ボタンの押された回数をリセット
        buttonCount = 0
        //色を入れ替える
        changePlace()
        //入れ替えた後にボタンの状態を戻す
        changePlaceAction()
        //勝利判定を行う
        judgmentWiner()
        
        
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
                stopChangeButton()
            } else if (dic4 == num && dic5 == num && dic6 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
                stopChangeButton()
            } else if (dic7 == num && dic8 == num && dic9 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
                stopChangeButton()
            } else if (dic1 == num && dic4 == num && dic7 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
                stopChangeButton()
            } else if (dic2 == num && dic5 == num && dic8 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
                stopChangeButton()
            } else if (dic3 == num && dic6 == num && dic9 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
                stopChangeButton()
            } else if (dic1 == num && dic5 == num && dic9 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
                stopChangeButton()
            } else if (dic3 == num && dic5 == num && dic7 == num) {
                print("Win:\(num)P")
                sampleLabel.text = "Win:\(num)P"
                stopButtonAction()
                stopChangeButton()
            } else if playerCount == 9 {
                sampleLabel.text = "ドロー"
            }
        }
        
    }
    //勝者が決まったのでボタンをオフする処理
    func stopChangeButton() {
        //for文でボタンの状態をリセットする
        for buttonNumber in 1...6 {
            var selectButtton: UIButton?
            switch buttonNumber {
            case 1:
                selectButtton = changeButton1
            case 2:
                selectButtton = changeButton2
            case 3:
                selectButtton = changeButton3
            case 4:
                selectButtton = changeButton4
            case 5:
                selectButtton = changeButton5
            case 6:
                selectButtton = changeButton6
            default:
                return
                       }
            //ボタンを非表示に
            selectButtton?.isHidden = true
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
            //buttonを選択できなくする
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
        //for文でボタンの状態をリセットする
        for buttonNumber in 1...6 {
            var selectButtton: UIButton?
            switch buttonNumber {
            case 1:
                selectButtton = changeButton1
            case 2:
                selectButtton = changeButton2
            case 3:
                selectButtton = changeButton3
            case 4:
                selectButtton = changeButton4
            case 5:
                selectButtton = changeButton5
            case 6:
                selectButtton = changeButton6
            default:
                return
                       }
            //ボタンを非表示に
            selectButtton?.isHidden = false
        }
        
    }
    
    //MARK: -　場所チェンジ機能
    func changePlace() {
        //入れ替える場所のデータを入れ替える
        //データを一度取り出す
        let colorDic1Data = colorDic[1]
        let colorDic2Data = colorDic[2]
        let colorDic3Data = colorDic[3]
        let colorDic4Data = colorDic[4]
        let colorDic5Data = colorDic[5]
        let colorDic6Data = colorDic[6]
        let colorDic7Data = colorDic[7]
        let colorDic8Data = colorDic[8]
        let colorDic9Data = colorDic[9]
        //どのいちで入れ替えるかを条件分岐
        switch (buttonDic[0], buttonDic[1]) {
        case (1, 2), (2, 1):
            colorDic[1] = colorDic2Data; colorDic[4] = colorDic5Data; colorDic[7] = colorDic8Data; colorDic[2] = colorDic1Data; colorDic[5] = colorDic4Data; colorDic[8] = colorDic7Data
        case (1, 3), (3, 1):
            colorDic[1] = colorDic3Data; colorDic[4] = colorDic6Data; colorDic[7] = colorDic9Data; colorDic[3] = colorDic1Data; colorDic[6] = colorDic4Data; colorDic[9] = colorDic7Data
        case (2, 3), (3, 2):
            colorDic[2] = colorDic3Data; colorDic[5] = colorDic6Data; colorDic[8] = colorDic9Data; colorDic[3] = colorDic2Data; colorDic[6] = colorDic5Data; colorDic[9] = colorDic8Data
        case (4, 5), (5, 4):
            colorDic[1] = colorDic4Data; colorDic[2] = colorDic5Data; colorDic[3] = colorDic6Data; colorDic[4] = colorDic1Data; colorDic[5] = colorDic2Data; colorDic[6] = colorDic3Data
        case (4, 6), (6, 4):
            colorDic[1] = colorDic7Data; colorDic[2] = colorDic8Data; colorDic[3] = colorDic9Data; colorDic[7] = colorDic1Data; colorDic[8] = colorDic2Data; colorDic[9] = colorDic3Data
        case (5, 6), (6, 5):
            colorDic[4] = colorDic7Data; colorDic[5] = colorDic8Data; colorDic[6] = colorDic9Data; colorDic[7] = colorDic4Data; colorDic[8] = colorDic5Data; colorDic[9] = colorDic6Data
        default:
            return
        }
        
        //for文でボタンの色を変える
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
            //記録されている数字に従い色を付け直す
            switch colorDic[num] {
            case 0:
                selectButtton?.backgroundColor = UIColor.white; selectButtton?.isEnabled = true
            case 1:
                selectButtton?.backgroundColor = UIColor.red; selectButtton?.isEnabled = false
            case 2:
                selectButtton?.backgroundColor = UIColor.blue; selectButtton?.isEnabled = false
            default:
                return
            }
        }
    }
    //場所を入れ替えた後のリセット処理
    func changePlaceAction() {
        //for文でボタンの状態をリセットする
        for buttonNumber in 1...6 {
            var selectButtton: UIButton?
            switch buttonNumber {
            case 1:
                selectButtton = changeButton1
            case 2:
                selectButtton = changeButton2
            case 3:
                selectButtton = changeButton3
            case 4:
                selectButtton = changeButton4
            case 5:
                selectButtton = changeButton5
            case 6:
                selectButtton = changeButton6
            default:
                return
                       }
            selectButtton?.setTitleColor(UIColor.systemBlue, for: .normal)
            selectButtton?.isEnabled = true
            selectButtton?.isHidden = false
        }
        changeActionButton.isHidden = true
    }
    //MARK: -入れ替え時にボタンを押した時に選択できるもののみ選択できるようにする処理
    func selectButton(buttonNumber: Int) {
        //switch文でどのボタンが押されたかの条件分岐
        //選択されたボタンの文字色を変化させて選択できないようにした
        var selectButtton: UIButton?
        switch buttonNumber {
        case 1:
            selectButtton = changeButton1
        case 2:
            selectButtton = changeButton2
        case 3:
            selectButtton = changeButton3
        case 4:
            selectButtton = changeButton4
        case 5:
            selectButtton = changeButton5
        case 6:
            selectButtton = changeButton6
        default:
            return
                   }
        selectButtton?.setTitleColor(UIColor.white, for: .normal)
        selectButtton?.isEnabled = false
        //最初に選ばれたボタンにより縦か横を残すかの条件分岐
        if buttonNumber <= 3 {
            changeButton4.isHidden = true
            changeButton5.isHidden = true
            changeButton6.isHidden = true
            
        } else if buttonNumber > 3 && buttonNumber <= 6 {
            changeButton1.isHidden = true
            changeButton2.isHidden = true
            changeButton3.isHidden = true
        }
        
    }
    
    func selectChangebutton() {
        //もし二個ボタンが選択されていたらボタンの可視化を行う
        if buttonCount == 2 {
            //最初に選択されたのが横か立てた選択する
            //縦の場合
            if buttonDic[0]! <= 3 {
                let num = 6 - buttonDic[0]! - buttonDic[1]!
                //選択されたボタンの文字色を変化させて選択できないようにした
                var selectButtton: UIButton?
                switch num {
                case 1:
                    selectButtton = changeButton1
                case 2:
                    selectButtton = changeButton2
                case 3:
                    selectButtton = changeButton3
                default:
                    return
                           }
                //選択されなかったボタンを非表示にする
                selectButtton?.isHidden = true
            //縦の場合
            } else if (buttonDic[0]! > 3 && buttonDic[0]! <= 6) {
                let num = 15 - buttonDic[0]! - buttonDic[1]!
                //選択されたボタンの文字色を変化させて選択できないようにした
                var selectButtton: UIButton?
                switch num {
                case 4:
                    selectButtton = changeButton4
                case 5:
                    selectButtton = changeButton5
                case 6:
                    selectButtton = changeButton6
                default:
                    return
                           }
                //選択されなかったボタンを非表示にする
                selectButtton?.isHidden = true
            }
            //変更ボタンを表示する
            changeActionButton.isHidden = false
            
        } else {
            //変更ボタンを表示しない
            changeActionButton.isHidden = true
        }
    }
    //MARK: - 移動の選択ボタンが押された時の処理
    func tappedChangeButton(buttonNumber: Int) {
        buttonDic[buttonCount] = buttonNumber
        //ひとつめのボタンの選択だった場合
        if buttonCount == 0 {
            selectButton(buttonNumber: buttonNumber)
        
        } else if buttonCount == 1 {
            selectButton(buttonNumber: buttonNumber)
        }
        buttonCount += 1
        selectChangebutton()
    }
}

