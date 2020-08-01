//
//  ViewController.swift
//  pickerViewSampleApp
//
//  Created by 尾原徳泰 on 2020/08/01.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleButton: UIButton!
    
    //インスタンス作成
    var pickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeDatePicker()
    }
    
    func makeDatePicker() {
        //datepickerの設定
        pickerView.datePickerMode = UIDatePicker.Mode.date
        pickerView.timeZone = NSTimeZone.local
        pickerView.locale = Locale.current
        sampleTextField.inputView = pickerView
    }

    @IBAction func sampleButtonAction(_ sender: Any) {
        //キーボードを下げる
        sampleTextField.endEditing(true)
        
        //日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        sampleTextField.text = "\(formatter.string(from: pickerView.date))"
    }
    
}

