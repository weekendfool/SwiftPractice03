//
//  NextViewController.swift
//  MoveTextFieldSampleApp
//
//  Created by 尾原徳泰 on 2020/07/01.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sampleText: UITextField!
    @IBOutlet weak var sampleTable: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var sampleStackview: UIStackView!
    @IBOutlet weak var sampleButton: UIButton!
    
    var countNumber:Int = 1
    var beforeHeight:CGFloat?
    var kyeBoardHeight:CGFloat?
    
    var height:CGFloat?
    
    var pressButton = true
    
    var customCell = Sample2TableViewCell()
    
    var key = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
            //tableViewの設定
            sampleTable.delegate = self
            sampleTable.dataSource = self

            //元の座標を記録
            beforeHeight = self.sampleStackview.frame.origin.y
//            print("beforeHeight:\(beforeHeight!)")
        
            height = tableViewHeight.constant
        
//        countNumber = 1
        
        reload(pressButton: pressButton)
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            //キーボードの表示・非表示を監視を開始する処理
            NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
            //キーボードをタップの検知で下げる処理を定義
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            //処理として追加
            self.view.addGestureRecognizer(tapGesture)
        }
        override func viewWillDisappear(_ animated: Bool) {
            //キーボードの表示・非表示を監視を終了する処理
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        
        //tableViewの設定
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            print("countNumber:",countNumber)
            return countNumber
            
           }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell:UITableViewCell?
            

            if indexPath.row % 2 == 0 {
                cell = sampleTable.dequeueReusableCell(withIdentifier: "cell1") as! UITableViewCell
                
            } else {
                cell = sampleTable.dequeueReusableCell(withIdentifier: "cell2") as! UITableViewCell
                indexPath1 = indexPath
//                countNumber! += 1
                print("##################\(indexPath1)")
            }

//            cell.textLabel?.text = String(indexPath.row)

            return cell!
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

        //textFieldを上方に移動させる処理
        @objc func keyBoardWillShow(notification: NSNotification) {
            //キーボードの高さ取得
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                kyeBoardHeight = keyboardSize.height
                //キーボード分移動
                tableViewHeight.constant = height! - keyboardSize.height
                
//                //キーボードの高さ分だけtextFieldの座標を移動させる
//                afterHeight = self.sampleText.frame.origin.y
                print(self.sampleText.frame.origin.y)
                print(keyboardSize.height)
                //初期値と同じ高さの場合
             
//                self.sampleText.frame.origin.y -= keyboardSize.height
//
//                print(self.sampleText.frame.origin.y)
//
////                self.sampleText.frame.origin.y = afterHeight!
////                print(afterHeight!)
//                //tableViewの初期値取得
//                print("$$$$$$$$$$$$$$$")
                
                //予測変換の高さ分だけtextFieldの座標を移動させる
//                let suggestionHeight =  self.sampleText.frame.origin.y - keyboardSize.height
//                self.sampleStackview.frame.origin.y = suggestionHeight
                print(self.sampleText.frame.origin.y)
                print("ko")
                
                sampleStackview.transform = CGAffineTransform(translationX: 0, y: -kyeBoardHeight!)
                
            }
        }
        
        //textFieldを下方に移動させる処理
        @objc func keyboardWillHide() {
            //textFieldが元の位置にいない場合
            
            sampleStackview.transform = CGAffineTransform.identity
            
            tableViewHeight.constant = height!
        }
        
        //実際にタップでキーボードを下げる処理
        @objc func dismissKeyboard() {
            self.sampleText.endEditing(true)
        }
        
        //リターンボタンでキーボードをさげる命令
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.sampleText.endEditing(true)
            return false
        }
    
    @IBAction func pressButton(_ sender: Any) {
        countNumber += 2
        pressButton = true
        print("$$$$$$$$$$$$")
        print(countNumber)
        talk()
        reload(pressButton: pressButton)
    }
    
    func reload(pressButton:Bool) {
        if countNumber % 2 != 0 {
            if pressButton {
                sampleTable.reloadData()
//                countNumber! += 1
                self.pressButton = false
                
            } else {
                talk()
//                self.pressButton = true
//                key = true
                print("000000000000000000")

            }
        } else {
//            self.pressButton = true
//            countNumber! += 1
            sampleTable.reloadData()
//            countNumber! -= 1
        }
    
    }
    
    func talk() {
        if countNumber % 2 == 0 {
//            sampleButton.isEnabled = false
            sampleText.isEnabled = true
        } else {
//            sampleButton.isEnabled = true
            sampleText.isEnabled = false
            
        }
    }
    
    }

