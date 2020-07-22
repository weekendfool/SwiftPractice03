//
//  NextViewController.swift
//  CoreDataSampleApp
//
//  Created by 尾原徳泰 on 2020/07/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import CoreData

class NextViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //パーツの紐付け
    @IBOutlet weak var sample2TextField: UITextField!
    @IBOutlet weak var sample2TableView: UITableView!
    
    //entityのperson型の配列を宣言
    var personNameArray:[Person] = []
    var personAgeArray:[Person] = []
    
    //オブジェクト化している
    var managedOfContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //delegateの設定
        sample2TableView.delegate = self
        sample2TableView.dataSource = self
        sample2TextField.delegate = self
        
        //取得したいデータの条件
        let conditions = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        do {
            //配列に取得したい条件のデータを引っ張ってきて格納
            personNameArray = try managedOfContext.fetch(conditions) as! [Person]
            print("personNameArray:\(personNameArray)")
        } catch {
            print("errorだよ！")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを下げる
        sample2TextField.resignFirstResponder()
        return true
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sample2TableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let personNameString = personNameArray[indexPath.row]
        cell.textLabel?.text = personNameString.personName
        return cell
    }
    
    @IBAction func clearButtonAcction(_ sender: Any) {
    }
    
    @IBAction func buttonAction(_ sender: Any) {
    }
}
