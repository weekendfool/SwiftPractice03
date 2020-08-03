//
//  ViewController.swift
//  chatSampleApp
//
//  Created by 尾原徳泰 on 2020/08/03.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var sampleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellName = ""
        let cell = sampleTableView.dequeueReusableCell(withIdentifier: cellName)! as UITableViewCell
        
        cell.textLabel!.text = "\(indexPath.row)"
        
        return cell
    }

    @IBAction func buttonAction(_ sender: Any) {
    }
    
}

