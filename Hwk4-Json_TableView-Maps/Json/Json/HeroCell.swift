//
//  HeroCell.swift
//  Json
//
//  Created by 徐一鸣 on 3/5/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class HeroCell: UITableViewCell {

    @IBOutlet weak var heroNamelabel: UILabel!
    
    
    @IBOutlet weak var namelabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
