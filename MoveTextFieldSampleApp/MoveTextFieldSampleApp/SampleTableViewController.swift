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
    @IBOutlet weak var smapleHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleTableView.delegate = self
        sampleTableView.dataSource = self
       
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        
//        smapleHeight.constant = CGFloat(500)
//    }
    
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

//        var height3 = sampleTableView.constraints
//        print(height3)
//
        height -= 100
        
        
//        self.sampleTableView.frame.size.height = CGFloat(500)
        smapleHeight.constant = CGFloat(height)

        
        print(height)
        
        
        self.sampleTableView.reloadData()
        
        view.layoutIfNeeded()
        view.updateConstraints()
        
        
        
    }
    
}
