//
//  ViewController.swift
//  GameSampleApp
//
//  Created by 尾原徳泰 on 2020/08/30.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var sampleButton1: UIButton!
    @IBOutlet weak var sampleButton2: UIButton!
    @IBOutlet weak var sampleButton3: UIButton!
    @IBOutlet weak var sampleButton4: UIButton!
    @IBOutlet weak var sampleButton5: UIButton!
    @IBOutlet weak var sampleButton6: UIButton!
    @IBOutlet weak var sampleButton7: UIButton!
    @IBOutlet weak var sampleButton8: UIButton!
    @IBOutlet weak var sampleButton9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func changeCouler(number: Int) {
        var place:UIButton?
        //どのボタンが押されたかの条件分岐
        switch number {
        case 1:
            place = sampleButton1
        case 2:
            place = sampleButton2
        case 3:
            place = sampleButton3
        case 4:
            place = sampleButton4
        case 5:
            place = sampleButton5
        case 6:
            place = sampleButton6
        case 7:
            place = sampleButton7
        case 8:
            place = sampleButton8
        case 9:
            place = sampleButton9
        default:
            return
        }
        
    }

    @IBAction func sampleButton1Action(_ sender: Any) {
    }
    
    @IBAction func sampleButton2Action(_ sender: Any) {
    }
    @IBAction func sampleButton3Action(_ sender: Any) {
    }
    
    @IBAction func sampleButton4Action(_ sender: Any) {
    }
    
    @IBAction func sampleButton5Action(_ sender: Any) {
    }
    
    @IBAction func sampleButton6Action(_ sender: Any) {
    }
    
    @IBAction func sampleButton7Action(_ sender: Any) {
    }
    
    @IBAction func sampleButton8Action(_ sender: Any) {
    }
    
    @IBAction func sampleButton9Action(_ sender: Any) {
    }
}

