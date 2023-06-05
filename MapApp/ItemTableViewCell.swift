//
//  ItemTableViewCell.swift
//  MapApp
//
//  Created by 白川創大 on 2023/05/24.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title: String, date: String, image: UIImage?) {
        titleLabel.text = title
        dateLabel.text = date
        postImageView.image = image
    }

    
}
