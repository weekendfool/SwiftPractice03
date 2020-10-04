//
//  Task.swift
//  MVCSampleMakeApp
//
//  Created by 尾原徳泰 on 2020/10/04.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

//　データを表すオブジェクト
import Foundation

class Task {
   
    let text: String
    let deadline: Date
    
    // 初期化
    init(text: String, deadline: Date) {
        self.text = text
        self.deadline = deadline
    }
    
    // ???
    init(from dictionary: [String: Any]) {
        // 引数を辞書型で定義して、代入、その後対応する型にキャストする
        self.text = dictionary["text"] as! String
        self.deadline = dictionary["deadline"] as! Date
    }
}
