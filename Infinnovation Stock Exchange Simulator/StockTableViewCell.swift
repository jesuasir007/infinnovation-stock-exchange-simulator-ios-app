//
//  StockTableViewCell.swift
//  InfiSES
//
//  Created by SwG Ghosh on 31/03/17.
//  Copyright © 2017 codecrafts. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var difference: UILabel!
    @IBOutlet weak var current: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        // Configure the view for the selected state
    }

}
