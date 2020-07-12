
//
//  Protocol.swift
//  SampleViewApp
//
//  Created by 尾原徳泰 on 2020/07/10.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

protocol greetingDelegate {
    //
    func sayHellow()
    func sayAge()
    func sayName()
    
}

extension greetingDelegate {
    //デフォルトで呼ばれる
    //プロトコル適合先で実装しなくてもエラーにならない
    func syaAge() {
        print("my age is 10")
    }
}
