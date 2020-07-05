//
//  Sample1TableViewCell.swift
//  MoveTextFieldSampleApp
//
//  Created by 尾原徳泰 on 2020/07/06.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class Sample1TableViewCell: UITableViewCell {

    @IBOutlet weak var sample1Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        sample1Label.text = "sample1"
    }

}
