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
    
    var beforeHeight:CGFloat?
    var afterHeight:CGFloat?
    
    var beforeTableHight:CGFloat?
    var afterTableHight:CGFloat?
    var v:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableViewの設定
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        
        //キーボードの高さ分だけtextFieldの座標を移動させる
        beforeHeight = self.sampleTextField.frame.origin.y
//        print("beforeHeight:\(beforeHeight!)")
        
        beforeTableHight = self.sampleTableView.frame.height
//        print("beforeTableHight:\(beforeTableHight!)")
        
        v = self.sampleTableView.contentSize.height
        v = beforeTableHight!
//        print("v:\(v!)")
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
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .brown
        } else {
            cell.backgroundColor = .green
        }
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    
    
    //textFieldを上方に移動させる処理
    @objc func keyBoardWillShow(notification: NSNotification) {
        //キーボードの高さ取得
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //キーボードの高さ分だけtextFieldの座標を移動させる
            afterHeight = self.sampleTextField.frame.origin.y
            afterTableHight = self.sampleTableView.frame.height
//            print(beforeHeight!)
//            print(afterHeight!)
            //初期値と同じ高さの場合
            if afterHeight! != beforeHeight! {
                afterHeight! -= keyboardSize.height
                
                v! -= keyboardSize.height
                print(v!)
                
                
            } else {
                //予測変換の高さ分だけtextFieldの座標を移動させる
                let suggestionHeight = afterHeight! + keyboardSize.height
                afterHeight! -= suggestionHeight
                
                //予測変換の高さ分だけtableの座標を移動させる
                let suggestionTableHeight = v! - keyboardSize.height
                v! -= suggestionTableHeight
                
                
            }
        }
    }
    
    //textFieldを下方に移動させる処理
    @objc func keyboardWillHide() {
        //textFieldが元の位置にいない場合
        if afterHeight! != beforeHeight! {
            afterHeight! = beforeHeight!
            
            afterTableHight! = beforeTableHight!
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

