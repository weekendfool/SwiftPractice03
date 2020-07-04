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
    @IBOutlet weak var sampleButton: NSLayoutConstraint!
    @IBOutlet weak var sampleTable: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var beforeHeight:CGFloat?
    var afterHeight:CGFloat?
    
    var height:CGFloat?
    //選択したviewの保持
    var acttiveTextView:UIView?
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
            //tableViewの設定
            sampleTable.delegate = self
            sampleTable.dataSource = self

            //キーボードの高さ分だけtextFieldの座標を移動させる
            beforeHeight = self.sampleText.frame.origin.y
            print("beforeHeight:\(beforeHeight!)")
        
            height = tableViewHeight.constant
            
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
               return 40
           }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = sampleTable.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell

//            if indexPath.row % 2 == 0 {
//                cell.backgroundColor = .brown
//            } else {
//                cell.backgroundColor = .green
//            }
//
            cell.textLabel?.text = String(indexPath.row)

            return cell
        }

        //textFieldを上方に移動させる処理
        @objc func keyBoardWillShow(notification: NSNotification) {
            //キーボードの高さ取得
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                //キーボード分移動
                tableViewHeight.constant = height! - keyboardSize.height
                
//                //キーボードの高さ分だけtextFieldの座標を移動させる
//                afterHeight = self.sampleText.frame.origin.y
                print(beforeHeight!)
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
                let suggestionHeight =  self.sampleText.frame.origin.y + keyboardSize.height
                self.sampleText.frame.origin.y -= suggestionHeight
                print("ko")
                
            }
        }
        
        //textFieldを下方に移動させる処理
        @objc func keyboardWillHide() {
            //textFieldが元の位置にいない場合
            
            self.sampleText.frame.origin.y = beforeHeight!
            
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

    }

