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
    @IBOutlet weak var sampleAgeTextField: UITextField!
    
    //entityのperson型の配列を宣言
    var personNameArray:[Person] = []
    var personAgeArray:[Person] = []
    
    var coreDataNumber:Int?
    
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
            personAgeArray = try managedOfContext.fetch(conditions) as! [Person]
            print("personNameArray:\(personNameArray)")
        } catch {
            print("errorだよ！")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを下げる
        sample2TextField.resignFirstResponder()
        sampleAgeTextField.resignFirstResponder()
        return true
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sample2TableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let personNameString = personNameArray[indexPath.row]
        let personAgaString = personAgeArray[indexPath.row]
        cell.textLabel?.text = personNameString.personName
        cell.detailTextLabel?.text = String(personAgaString.personAge)
        return cell
    }
    
    @IBAction func clearButtonAcction(_ sender: Any) {
//        (UIApplication.shared.delegate as! AppDelegate).delete("Person")
        coreDataNumber = personNameArray.count
        for number in 0..<coreDataNumber! {
            managedOfContext.delete(self.personNameArray[number])
        }
//        managedOfContext.delete(self.personNameArray[0])
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        personNameArray.removeAll()
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print(personNameArray)
        print(personNameArray.count)
        sample2TableView.reloadData()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        //dbに情報を保存
        //person型のマネージドオブジェクトを作成
        let newPersonName = Person(context: self.managedOfContext)
        let newPersonAge = Person(context: self.managedOfContext)
        //テキストフィールドのテキストをPersonのpersonNameに格納する
        //この時点で格納は終わっている
        newPersonName.personName = sample2TextField?.text
        personNameArray.append(newPersonName)
        
        //ageの格納
        if let text = sampleAgeTextField.text {
            newPersonAge.personAge = Int16(text)!
        }
        personAgeArray.append(newPersonAge)
//        print(personNameArray)
       (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print(personNameArray)
        print(personNameArray.count)
        sample2TableView.reloadData()
        sample2TextField.text = ""
    }
    
}
