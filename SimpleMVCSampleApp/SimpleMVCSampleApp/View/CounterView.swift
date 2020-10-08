//
//  CounterView.swift
//  SimpleMVCSampleApp
//
//  Created by 尾原徳泰 on 2020/10/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

class CounterView: UIView {
    // labelのインスタンスの生成
    @IBOutlet weak var countLabel: UILabel!
    
    //　labelに反映する処理
    public func render(count: Int) {
        countLabel.text = String(count)
    }
    
}
