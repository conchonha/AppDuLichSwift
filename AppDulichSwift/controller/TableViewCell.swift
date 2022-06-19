//
//  TableViewCell.swift
//  AppDulichSwift
//
//  Created by Sang on 18/06/2022.
//

import UIKit

class TableViewCell: UITableViewCell {    
    @IBOutlet weak var userLable: UILabel!
    @IBOutlet weak var idLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
