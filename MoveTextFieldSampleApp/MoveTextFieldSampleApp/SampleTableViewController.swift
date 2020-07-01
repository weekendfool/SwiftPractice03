//
//  SampleTableViewController.swift
//  MoveTextFieldSampleApp
//
//  Created by 尾原徳泰 on 2020/07/01.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class SampleTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sampleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleTableView.delegate = self
        sampleTableView.dataSource = self
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sampleTableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    
    @IBAction func pressButton(_ sender: Any) {
        
        var height = sampleTableView.frame.size.height
        print(height)
        
        var height2 = sampleTableView.contentSize.height
        print(height2)
        
        var height3 = sampleTableView.constraints
        print(height3)
        
        height -= 100
        
        sampleTableView.frame.size.height = height
        
        print(height)
        
//        sampleTableView.reloadData()
        
        view.layoutIfNeeded()
        view.updateConstraints()
        
    }
    
}
