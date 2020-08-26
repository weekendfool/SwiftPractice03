//
//  NextViewController.swift
//  navSampleApp
//
//  Created by 尾原徳泰 on 2020/08/26.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            dismiss(animated: true, completion: nil)
            //tableViewの更新
            
            
        })
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        popupAlert()
    }
    
}
