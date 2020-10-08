//
//  CounterViewController.swift
//  SimpleMVCSampleApp
//
//  Created by 尾原徳泰 on 2020/10/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {
    // view Modelの参照を保持
    @IBOutlet var counterView: CounterView!
    
    private(set) lazy var counterModel = CounterModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterModel.notificationCenter.addObserver(self, selector: #selector(self.handleCountChange(_:)), name: .init(NSNotification.Name(rawValue: CounterModel.notificationName)), object: nil)
    }
    
    @objc func handleCountChange(_ notification: Notification) {
        if let count = notification.object as? Int {
            counterView.render(count: count)
        }
    }
    
    @IBAction func OnPlusButtonTapped(_ sender: Any) {
        // modelに処理を依頼
        counterModel.countUp()
    }
    
    @IBAction func OnMinusButtonTapped(_ sender: Any) {
           // modelに処理を依頼
           counterModel.countDown()
       }
}
