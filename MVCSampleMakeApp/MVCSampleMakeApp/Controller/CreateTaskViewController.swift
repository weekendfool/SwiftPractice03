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
        
        self.createTaskView.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
}
