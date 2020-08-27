//
//  NextViewController.swift
//  navSampleApp
//
//  Created by 尾原徳泰 on 2020/08/26.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    var v = 0 {
        willSet {
            print("new \(v) -> \(newValue)")
            if newValue == 1 {
                navigationController?.popViewController(animated: true)
            }
        }
        didSet {
            print("old \(oldValue) -> \(v)")
            if v == 1 {
                navigationController?.popViewController(animated: true)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        go(j: v)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func popupAlert() {
        //UIAlertControllerのインスタンス化
        let alertController = UIAlertController(title: "この設定でクエストを募集するにゃん！", message: "", preferredStyle: .alert)
        //UIAlertActionのインスタンス化
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        //アクションの追加
        alertController.addAction(alertAction)
        //アクションの実行
       
        present(alertController, animated: true, completion: {
            //初期化と保存
//            self.dismiss(animated: true, completion: nil)
            //tableViewの更新
//            self.navigationController?.popToRootViewController(animated: true)
            
            
            print("OK")
            
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.navigationController?.popViewController(animated: true)
        }
        self.v = 1
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        popupAlert()
        
    }
    
    @IBAction func tappedButton(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func go(j: Int) {
        if j == 1 {
            navigationController?.popViewController(animated: true)
        }
        v = 0
    }
}
