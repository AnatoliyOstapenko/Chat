//
//  TableViewCell.swift
//  Chat
//
//  Created by MacBook on 06.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set a corner radius for cellView
        cellView.layer.cornerRadius = cellView.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
