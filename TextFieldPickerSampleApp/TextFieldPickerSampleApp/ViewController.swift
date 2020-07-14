//
//  ViewController.swift
//  TextFieldPickerSampleApp
//
//  Created by 尾原徳泰 on 2020/07/07.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleButton: UIButton!
    
    //pickerViewのインスタンス格納
    var pickerView = UIDatePicker()
    var data:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    
    var textBool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createPickerView()
        v()
    }

//    //pickerViewの設定
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 12
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        data[row]
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        sampleTextField.text = data[row]
//        sampleLabel.text = data[row]
//    }
    
    @IBAction func pressSampleButton(_ sender: Any) {
        
        createPickerView()
        
        print(sampleTextField.text)
    }
    
    @IBAction func pressButton2(_ sender: Any) {
        if textBool {
            textBool = false
        } else {
            textBool = true
        }
        if sampleTextField.text == "" {
        print("nil")
        }
    }
    
    func createPickerView() {
        //delegateの設定
//        pickerView.delegate = self
        //テキストフィールドのインプットにpickerViewを設定
        if textBool {
            sampleTextField.inputView = pickerView
        } else {
            sampleTextField.inputView = nil
        }
        
        //ツールバー作成
        //インスタンス作成
        let toolBar = UIToolbar()
        //配置決め
        toolBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        //doneButton作成
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePicker))
        //ツールバーにボタン追加
        toolBar.setItems([doneButton], animated: true)
        sampleTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePicker() {
        sampleTextField.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextField.endEditing(true)
    }
    
    func v () {
        if sampleTextField == nil {
            print("nil")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("566")
        if sampleTextField.text != nil {
            print(sampleTextField.text)
    }
}
}

