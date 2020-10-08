//
//  CreateTaskViewController.swift
//  MVCSampleMakeApp
//
//  Created by 尾原徳泰 on 2020/10/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    fileprivate var createTaskView: CreateTaskView!
    
    fileprivate var dataSource: TaskDataManager!
    fileprivate var taskText: String?
    fileprivate var taskDeadline: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景色の設定
        self.view.backgroundColor = .white
        // インスタンスの作成
        self.createTaskView = CreateTaskView()
        
        self.createTaskView.delegate = self
        self.view.addSubview(self.createTaskView)
        
        self.dataSource = TaskDataManager()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // createTaskViewのレイアウト設定
        self.createTaskView.frame = CGRect(x: self.view.safeAreaInsets.left, y: self.view.safeAreaInsets.top, width: self.view.frame.size.width - self.view.safeAreaInsets.left - self.view.safeAreaInsets.right, height: self.view.frame.size.height - self.view.safeAreaInsets.bottom)
    }
    
    // 保存が成功した時のアラート
    fileprivate func showSaveAlert() {
        let alertController = UIAlertController(title: "保存しました", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { action in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // タスクが未入力のアラート
    fileprivate func showMissingTaskTextAlert() {
        let alertController = UIAlertController(title: "タスクを入力してください", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { action in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 締め切りが未入力のアラート
    fileprivate func showMissingTaskDeadlineAlert() {
        let alertController = UIAlertController(title: "締切日を入力してください", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { action in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension CreateTaskViewController: CreateTaskViewDelegate {
    
    // タスク内容を入力している時に呼ばれるデリゲートメソッド
    func createView(taskEditting view: CreateTaskView, text: String) {
        self.taskText = text
    }
    
    // 締め切りを入力している時に呼ばれるデリゲートメソッド
    func  createView(deadlineEditting View: CreateTaskView, deadline: Date) {
        self.taskDeadline = deadline
    }
    
    func createView(saveButtonDidTap view: CreateTaskView) {
        guard let taskText = self.taskText else {
            self.showMissingTaskTextAlert()
            return
        }
        
        guard let taskDeadline = self.taskDeadline else {
            self.showMissingTaskDeadlineAlert()
            return
        }
        let task = Task(text: taskText, deadline: taskDeadline)
        self.dataSource.save(task: task)
        
        self.showSaveAlert()
    }
}
