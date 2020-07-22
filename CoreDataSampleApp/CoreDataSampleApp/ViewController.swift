//
//  ViewController.swift
//  CoreDataSampleApp
//
//  Created by 尾原徳泰 on 2020/07/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var sampleTableView: UITableView!
    @IBOutlet weak var sampleTextField: UITextField!
    
    var monsterArray:[Monster] = []
    
    var managerContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        sampleTextField.delegate = self
        
        let conditions = NSFetchRequest<NSFetchRequestResult>(entityName: "Monster")
        
        do {
            monsterArray = try managerContext.fetch(conditions) as! [Monster]
        } catch {
            print("error")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sampleTextField.resignFirstResponder()
        
        let newMonsterObject = Monster(context: self.managerContext)
        
        newMonsterObject.monsterName = sampleTextField.text
        
        self.monsterArray.append(newMonsterObject)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        sampleTableView.reloadData()
        
        sampleTextField.text = ""
        
        return true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sampleTableView.dequeueReusableCell(withIdentifier: "myCell") as! UITableViewCell
        
        let monsterData = monsterArray[indexPath.row]
        
        cell.textLabel?.text = monsterData.monsterName
        
        return cell
    }

}

