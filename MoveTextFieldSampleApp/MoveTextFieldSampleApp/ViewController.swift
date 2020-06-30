//
//  ViewController.swift
//  MoveTextFieldSampleApp
//
//  Created by 尾原徳泰 on 2020/06/30.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var sampleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //キーボードの出現を検知する処理
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        //キーボードの消失を検知する処理
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //キーボードをタップの検知で下げる処理を定義
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //処理として追加
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    //textFieldを上方に移動させる処理
    @objc func keyBoardWillShow(notification: NSNotification) {
    
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //キーボードの高さ分だけtextFieldの座標を移動させる
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            } else {
                //予測変換の高さ分だけtextFieldの座標を移動させる
                let suggestionHeight = self.view.frame.origin.y + keyboardSize.height
                self.view.frame.origin.y -= suggestionHeight
                
            }
        }
    }
    
    //textFieldを下方に移動させる処理
    @objc func keyboardWillHide() {
        //textFieldが元の位置にいない場合
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //実際にタップでキーボードを下げる処理
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //リターンボタンでキーボードを`func`げる命令
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

