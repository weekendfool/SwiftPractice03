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
        self.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .touchUpInside)
        
        // deadLineTextFieldが選択されたとにきピッカーを表示する
        self.deadLineTextField.inputView = self.datePicker
        
        // インスタンスを生成
        self.saveButton = UIButton()
    }

    
}
