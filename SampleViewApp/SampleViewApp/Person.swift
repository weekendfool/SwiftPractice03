//
//  Person.swift
//  SampleViewApp
//
//  Created by 尾原徳泰 on 2020/07/10.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

final class Person {
    //処理を任せる相手を保持
    var delegate: greetingDelegate?
    
    func greet() {
        guard let delegate = delegate else {
            print("No Person")
            return
        }
    }
}
