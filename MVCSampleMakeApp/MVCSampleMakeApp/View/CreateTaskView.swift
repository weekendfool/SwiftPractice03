//
//  CreateTaskView.swift
//  MVCSampleMakeApp
//
//  Created by 尾原徳泰 on 2020/10/06.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

protocol CreateTaskViewDelegate: class {
    func createView(taskEditting view: CreateTaskView, text: String)
    func createView(deadlineEditting View: CreateTaskView, deadline: Date)
    func createView(saveButtonDidTap view: CreateTaskView)
}

class CreateTaskView: UIView {
    
    private var taskTextField: UITextField!
    private var datePicker: UIDatePicker!
    private var deadLineTextField: UITextField!
    private var saveButton: UIButton!

}
