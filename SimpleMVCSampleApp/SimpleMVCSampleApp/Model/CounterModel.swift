//
//  CounterModel.swift
//  SimpleMVCSampleApp
//
//  Created by 尾原徳泰 on 2020/10/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class CounterModel {
    
    static let notificationName = "CounterModelChanged"
    // NotificationCenterのインスタンス作成
    let notificationCenter = NotificationCenter()
    // 現在の値を保持する
    // データの保持
    internal var count: Int = 0 {
        didSet {
            // Modelを監視しているコントローラーに変更を通知する
            notificationCenter.post(
                name: .init(rawValue: CounterModel.notificationName),
                object: count
            )
        }
    }
    
    // データの処理
    //　カウントの動作
    func countUp() {
        count += 1
    }
    
    func countDown() {
        count -= 1
    }
}
