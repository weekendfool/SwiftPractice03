//
//  Sample2TableViewCell.swift
//  MoveTextFieldSampleApp
//
//  Created by 尾原徳泰 on 2020/07/06.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

var indexPath1:IndexPath?

class Sample2TableViewCell: UITableViewCell {

    @IBOutlet weak var sample2Label: UILabel!
    @IBOutlet weak var sampleImage: UIImageView!
    
    
    
    var imageName = UIImage(named: "igaiga")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         print("!!!!!!!!!!!!!!!!!!!")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        print("&&&&&&&&&&&&&&&&&&&&&&&&&")
        
        sample2Label.text = "\(indexPath1!.row)"
            
        
            
        sampleImage.image = imageName
        
    }

}
