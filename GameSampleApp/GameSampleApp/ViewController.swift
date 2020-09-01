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
    var playerCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtonborder()
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
        } else if player == 2 {
            //ボタンの色を変える処理
            place?.backgroundColor = UIColor.blue
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
        judgmentPlayerNumber(playerCount: number)
        //色を変える処理
        changeCouler(number: number, player: player)
        //playerCountのカウントをすすめる
        playerCount += 1
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
}

