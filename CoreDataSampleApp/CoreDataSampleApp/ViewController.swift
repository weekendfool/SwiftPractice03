//
//  ViewController.swift
//  CoreDataSampleApp
//
//  Created by 尾原徳泰 on 2020/07/18.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //パーツの紐付け
    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleTableView: UITableView!
    
    //monsterEntityから引っ張ってきたデータを格納する配列
    var monsterArray:[Monster] = []
    
    var managerOfContext = (UIApplication.shared.delegate as! AppDelegate).percistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sampleTextField.delegate = self
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
    }
    
    let myConditions = NSFetchRequest<NSFetchRequestResult>(entityName: "Monster")
    do {
    monsterArray = try managerOfContext.fetch(myConditions) as! [Monster]
    } catch {
    print("error")
    }
}

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    let newMonster = Monster(context: self.managerOfContext)
}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ui
    }
}

