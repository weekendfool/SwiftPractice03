//
//  TaskListViewController.swift
//  MVCSampleMakeApp
//
//  Created by 尾原徳泰 on 2020/10/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {
    
    var dataSource: TaskDataManager!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = TaskDataManager()
        // tableViewの設定と追加
        self.tableView = UITableView(frame: self.view.bounds, style: .plain)
        self.tableView.register(TaskCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // この画面を開くたびに情報を更新して反映
        self.dataSource.loadData()
        self.tableView.reloadData()
    }
    
    @objc func barButtonTapped(_ sender: UIBarButtonItem) {
        // タスク作成画面への遷移コード
        let controller = UINavigationController()
        let navi = UINavigationController(rootViewController: controller)
        self.present(navi, animated: true, completion:  nil)
    }
}
    
    extension TaskListViewController: UITableViewDataSource {
        
        func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.dataSource.count()
        }
        
        func tableView(_ tableView:UITableView, HeightForRowAt indexPath: IndexPath) -> CGFloat {
            return 68.0
        }
        
        func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TaskCell else { return UITableViewCell() }
            
            let task = self.dataSource.data(at: indexPath.row)
            cell.task = task
            return cell
        
    }
}
