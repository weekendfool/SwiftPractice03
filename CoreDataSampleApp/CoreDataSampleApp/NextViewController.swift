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
    var personArray:[Person] = []
//    var personAgeArray:[Person] = []
    
    var coreDataNumber:Int?
    
    //オブジェクト化している
    var managedOfContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //delegateの設定
        sample2TableView.delegate = self
        sample2TableView.dataSource = self
        sample2TextField.delegate = self
        sampleAgeTextField.delegate = self
        
        
        //取得したいデータの条件
        let conditions = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        do {
            //配列に取得したい条件のデータを引っ張ってきて格納
            personArray = try managedOfContext.fetch(conditions) as! [Person]
//            personAgeArray = try managedOfContext.fetch(conditions) as! [Person]
            print("personNameArray:\(personArray)")
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
        print("personArrayCount：\(personArray.count)")
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sample2TableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let personNameString = personArray[indexPath.row].personName
        let personAgaString = personArray[indexPath.row].personAge
//        let ageString = personNameString.personAge
        if let nameString = personNameString {
//            print(personAgaString)
            cell.textLabel?.text = String(nameString)
                   
           
            print("personAgeString:\(personAgaString)")
            
//            if personAgaString == 1 {
//                cell.detailTextLabel?.text = "3333333333333"
//            }
        }
         cell.detailTextLabel?.text = "\(String(personAgaString))"
      
        
         
        
        return cell
    }
    
    @IBAction func clearButtonAcction(_ sender: Any) {
//        (UIApplication.shared.delegate as! AppDelegate).delete("Person")
        coreDataNumber = personArray.count
        //削除処理
        for number in 0..<coreDataNumber! {
            managedOfContext.delete(self.personArray[number])
        }
//        managedOfContext.delete(self.personNameArray[0])
        //person型のマネージドオブジェクトを作成
//        let oldPerson = Person(context: self.managedOfContext)
        personArray.removeAll()
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
     
//        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        print(personArray)
//        print(personArray.count)
        sample2TableView.reloadData()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        //dbに情報を保存
        //person型のマネージドオブジェクトを作成
        let newPerson = Person(context: self.managedOfContext)
//        let newPersonAge = Person(context: self.managedOfContext)
        
//        let new = Person(context: self.managedOfContext)
        //テキストフィールドのテキストをPersonのpersonNameに格納する
        //この時点で格納は終わっている
        newPerson.personName = sample2TextField?.text
        //ageの格納
        if let text = sampleAgeTextField.text {
            newPerson.personAge = Int16(text)!
            print("-------------------------------")
        }
        personArray.append(newPerson)
        
        
//        print(personNameArray)
       (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        print(personNameArray)
//        print(personNameArray.count)
//        print(personAgeArray)
        sample2TableView.reloadData()
        sample2TextField.text = ""
        sampleAgeTextField.text = ""
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
//        print(personNameArray[0].personAge)
//        print()
//        print(personNameArray[1])
    }
    
}
