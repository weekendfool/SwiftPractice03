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
    }
}
