//
//  ViewController.swift
//  MoveTextFieldSampleApp
//
//  Created by 尾原徳泰 on 2020/06/30.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableViewの設定
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        
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
        
        let cell = sampleTableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    //textFieldを上方に移動させる処理
    @objc func keyBoardWillShow(notification: NSNotification) {
        //キーボードの高さ取得
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //キーボードの高さ分だけtextFieldの座標を移動させる
            if self.sampleTextField.frame.origin.y == 0 {
                self.sampleTextField.frame.origin.y -= keyboardSize.height
                //tableViewの高さ取得
                var tabelViewHeight = self.sampleTableView.frame.origin.x
                print(tabelViewHeight)
                //キーボードの高さ分だけtableViewの高さを減らす
                tabelViewHeight -= keyboardSize.height
                print(tabelViewHeight)
            } else {
                //予測変換の高さ分だけtextFieldの座標を移動させる
                let suggestionHeight = self.sampleTextField.frame.origin.y + keyboardSize.height
                self.sampleTextField.frame.origin.y -= suggestionHeight
                
            }
        }
    }
    
    //textFieldを下方に移動させる処理
    @objc func keyboardWillHide() {
        //textFieldが元の位置にいない場合
        if self.sampleTextField.frame.origin.y != 0 {
            self.sampleTextField.frame.origin.y = 0
        }
    }
    
    //実際にタップでキーボードを下げる処理
    @objc func dismissKeyboard() {
        self.sampleTextField.endEditing(true)
    }
    
    //リターンボタンでキーボードをさげる命令
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sampleTextField.endEditing(true)
        return false
    }

}

