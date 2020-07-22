//
//  NextViewController.swift
//  CoreDataSampleApp
//
//  Created by 尾原徳泰 on 2020/07/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //パーツの紐付け
    @IBOutlet weak var sample2TextField: UITextField!
    @IBOutlet weak var sample2TableView: UITableView!
    
    //entityのperson型の配列を宣言
    var personNameArray:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //delegateの設定
        sample2TableView.delegate = self
        sample2TableView.dataSource = self
        sample2TextField.delegate = self
    }
    

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    @IBAction func clearButtonAcction(_ sender: Any) {
    }
    
    @IBAction func buttonAction(_ sender: Any) {
    }
}
