//
//  TaskDataManager.swift
//  MVCSampleMakeApp
//
//  Created by 尾原徳泰 on 2020/10/04.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

// データに関するロジック
import Foundation

class TaskDataManager: NSObject {
    // TaskクラスをArrayに格納
    private var tasks = [Task]()
    
    // Userdefaultから保存したデータを取得
    func loadData() {
        // UserDefaultsのインスタンスを格納
        let userDefaults = UserDefaults.standard
        // アンラップ処理
        guard let taskDictionaries = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        for dic in taskDictionaries {
            // TaskクラスからtaskDictionariesに対応するものを引き出す
            let task = Task(from: dic)
            // Taskクラスに追加する
            self.tasks.append(task)
        }
    }
    
    // 引数にTaskクラスのインスタンスをとる
    func save(task: Task) {
        self.tasks.append(task)
        // 辞書の生成（辞書の中に辞書を格納する）
        var taskDictionaries = [[String: Any]]()
        for t in self.tasks {
            // 辞書に格納するための辞書を生成
            let taskDictionary: [String : Any] = ["text": t.text, "deadline": t.deadline]
            // 辞書に格納
            taskDictionaries.append(taskDictionary)
        }
        let userDefaults = UserDefaults.standard
        // UserDefaultsに保存する処理
        userDefaults.set(taskDictionaries, forKey: "tasks")
        // UserDefaultsを更新
        userDefaults.synchronize()
    }
    
    // 何個あるかカウントする関数
    func count() -> Int {
        return self.tasks.count
    }
    
    // taskの個数がインデックスより多ければ返り値を返す
    func data(at index: Int) -> Task? {
        if self.tasks.count > index {
            return tasks[index]
        }
        return nil
    }
    
}
