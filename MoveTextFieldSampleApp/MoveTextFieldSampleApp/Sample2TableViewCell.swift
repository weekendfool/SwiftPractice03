//
//  Sample2TableViewCell.swift
//  MoveTextFieldSampleApp
//
//  Created by 尾原徳泰 on 2020/07/06.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class Sample2TableViewCell: UITableViewCell {

    @IBOutlet weak var sample2Label: UILabel!
    
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if let sample2Label = sample2Label, let indexPath = indexPath {
            sample2Label.text = "\(indexPath.row)"
        }
    }

}
