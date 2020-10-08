//
//  CreateTaskView.swift
//  MVCSampleMakeApp
//
//  Created by 尾原徳泰 on 2020/10/06.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

protocol CreateTaskViewDelegate: class {
    func createView(taskEditting view: CreateTaskView, text: String)
    func createView(deadlineEditting View: CreateTaskView, deadline: Date)
    func createView(saveButtonDidTap view: CreateTaskView)
}

class CreateTaskView: UIView {
    
    // UIパーツの宣言
    private var taskTextField: UITextField!
    private var datePicker: UIDatePicker!
    private var deadLineTextField: UITextField!
    private var saveButton: UIButton!
    
    // デリゲートの設定
    weak var delegate: CreateTaskViewDelegate?
    
    // 初期化の実行
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        // インスタンスを生成
        self.taskTextField = UITextField()
        // delegateの対象を地震に設定
        self.taskTextField.delegate = self
        self.taskTextField.tag = 0
        self.taskTextField.placeholder = "予定を入れてください"
        // viewに追加
        self.addSubview(self.taskTextField)
        
        // インスタンスを生成
        self.deadLineTextField = UITextField()
        // delegateの対象を地震に設定
        self.deadLineTextField.delegate = self
        self.deadLineTextField.tag = 1
        self.deadLineTextField.placeholder = "期限を設定してください"
        // viewに追加
        self.addSubview(self.deadLineTextField)
        
        // インスタンスを生成
        self.datePicker = UIDatePicker()
        self.datePicker.datePickerMode = .dateAndTime
        self.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        // deadLineTextFieldが選択されたとにきピッカーを表示する
        self.deadLineTextField.inputView = self.datePicker
        
        // インスタンスを生成
        self.saveButton = UIButton()
        self.saveButton.setTitle("保存する", for: .normal)
        self.saveButton.setTitleColor(.black, for: .normal)
        self.saveButton.layer.borderWidth = 0.5
        self.saveButton.layer.cornerRadius = 4.0
        self.saveButton.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        self.addSubview(self.saveButton)
    }
    
    // エラー処理
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // ピッカーが選択された時の処理
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        // DateFormatterのインスタンス作成
        let dateFormatter = DateFormatter()
        // dateの型を設定
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        // deadlineTextにsenderのdateを格納する
        let deadlineText = dateFormatter.string(from: sender.date)
        self.deadLineTextField.text = deadlineText
        // CreateTaskViewDelegateプロトコルに準拠するために実装
        self.delegate?.createView(deadlineEditting: self, deadline: sender.date)
    }
    
    // セーブボタンが押された時の挙動
    @objc func saveButtonTapped(_ sender: UIButton) {
        self.delegate?.createView(saveButtonDidTap: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.taskTextField.frame = CGRect(x: bounds.origin.x + 30, y: bounds.origin.y + 30, width: bounds.size.width - 60, height: 50)
        
        self.deadLineTextField.frame = CGRect(x: self.taskTextField.frame.origin.x, y: self.taskTextField.frame.maxY + 30, width: self.taskTextField.frame.size.width, height: self.taskTextField.frame.size.height)
        
        let saveButtonSize = CGSize(width: 100, height: 50)
        self.saveButton.frame = CGRect(x: (bounds.size.width - saveButtonSize.width) / 2, y: self.deadLineTextField.frame.maxY + 20, width: saveButtonSize.width, height: saveButtonSize.height)
    }
}
    
    //　CreateTaskViewを拡張してUITextFieldDelegateプロトコルに批准
    extension CreateTaskView: UITextFieldDelegate {
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            delegate?.createView(taskEditting: self, text: textField.text ?? "")
            return true
        }
}
