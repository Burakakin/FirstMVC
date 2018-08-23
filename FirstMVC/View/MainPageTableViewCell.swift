//
//  MainPageTableViewCell.swift
//  FirstMVC
//
//  Created by Burak Akin on 23.08.2018.
//  Copyright © 2018 Burak Akin. All rights reserved.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {

    @IBOutlet weak var MainPageCustomImage: UIImageView!
    @IBOutlet weak var appLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
