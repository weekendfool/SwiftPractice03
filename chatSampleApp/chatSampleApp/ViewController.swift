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
    
    var count1 = 0
    var count2 = 0
    
    var array = ["ネズミ", "ウシ", "トラ", "ウサギ", "ドラゴン", "ヘビ", "ウマ", "ヒツジ", "サル", "トリ", "イヌ", "イノシシ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellName = ""
        
        if (indexPath.row % 2) == 0 {
            cellName = "cell1"
        } else {
            cellName = "cell2"
        }
        
        var cell = sampleTableView.dequeueReusableCell(withIdentifier: cellName)! as UITableViewCell
        
        cell.textLabel!.text = "\(indexPath.row)" + array[indexPath.row]
        
        print(indexPath.row)
        
        return cell
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        count1 += 2
        count2 += 1
        
        sampleLablel.text = "\(count2)"
        
        sampleTableView.reloadData()
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        count1 = 0
        count2 = 0
        sampleTableView.reloadData()
        sampleLablel.text = "\(count2)"
    }
}

