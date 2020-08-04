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
    @IBOutlet weak var sampleLablel: UILabel!
    
    var count = 0
    
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
        
        if (count % 2) == 0 {
            cellName = "cell1"
        } else {
            cellName = "cell2"
        }
        
        var cell = sampleTableView.dequeueReusableCell(withIdentifier: cellName)! as UITableViewCell
        
        cell.textLabel!.text = "\(indexPath.row)"
        
        print(indexPath.row)
        
        return cell
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        count += 1
        
        sampleLablel.text = "\(count)"
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        count = 0
        sampleTableView.reloadData()
        sampleLablel.text = "\(count)"
    }
}

