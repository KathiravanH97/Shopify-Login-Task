//
//  TableViewCell.swift
//  KathiravanVajroTask
//
//  Created by Mac on 21/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var lbl2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
