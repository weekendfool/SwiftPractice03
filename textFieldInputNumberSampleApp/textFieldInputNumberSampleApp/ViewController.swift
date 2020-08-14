//
//  ViewController.swift
//  textFieldInputNumberSampleApp
//
//  Created by 尾原徳泰 on 2020/08/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var sampleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sampleTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string.isEmpty || (string.range(of: "^[0-9]+$", options: .regularExpression, range: nil, locale: nil) != nil)
    }
    
    

    @IBOutlet var buttonAction: UIView!
    
}

