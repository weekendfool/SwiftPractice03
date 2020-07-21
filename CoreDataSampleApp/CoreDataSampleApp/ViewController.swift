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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        sampleTextField.delegate = self
    }


}

