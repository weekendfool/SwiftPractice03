//
//  TaskCell.swift
//  MVCSampleMakeApp
//
//  Created by 尾原徳泰 on 2020/10/04.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    private var taskLabel: UILabel!
    private var deadlineLabel: UILabel!
    
    // 初期化してviewを描写
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // UILabelのインスタンス生成
        self.taskLabel = UILabel()
        // UILabelの文字色変更
        self.taskLabel.textColor = .black
        // UILabelのフォント設定
        self.taskLabel.font = UIFont.systemFont(ofSize: 14)
        // viewに追加
        contentView.addSubview(self.taskLabel)
        
        // deadlineLabelのインスタンス生成
        self.deadlineLabel = UILabel()
        // deadlineLabelの文字色変更
        self.deadlineLabel.textColor = .black
        // deadlineLabelのフォント設定
        self.deadlineLabel.font = UIFont.systemFont(ofSize: 14)
        // viewに追加
        contentView.addSubview(self.deadlineLabel)
    }
    
    // エラー処理
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
