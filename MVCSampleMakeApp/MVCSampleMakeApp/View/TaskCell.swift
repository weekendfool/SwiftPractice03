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
        // taskLabelのインスタンス生成
        self.taskLabel = UILabel()
        // taskLabelの文字色変更
        self.taskLabel.textColor = .black
        // taskLabelのフォント設定
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
    
    // SubViewの更新処理
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // taskLabelの位置を設定
        self.taskLabel.frame = CGRect(x: 15.0, y: 15.0, width: self.contentView.frame.width - 30, height: 15.0)
        self.deadlineLabel.frame = CGRect(x: self.taskLabel.frame.origin.x, y: self.taskLabel.frame.maxY + 8, width: self.taskLabel.frame.width, height: 15.0)
    }
    
    // コンピューティッドプロパティの宣言
    var task: Task? {
        didSet {
            //　taskがnilでない時の挙動
            guard let t = task else { return }
            // taskLabelにtextを反映する
            self.taskLabel.text = t.text
            
            // DateFormatterのインスタンス作成
            let formatter = DateFormatter()
            // 日付のフォーマットを決定
            formatter.dateFormat = "yyyy/MM/dd"
            // deadlineLabelに設定したフォーマットで日付を代入
            self.deadlineLabel.text = formatter.string(from: t.deadline)
            
        }
    }
    
    // 描画の設定
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // 選ばれたセルのアニメーション処理
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
