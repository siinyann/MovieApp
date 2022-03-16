//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Sin Yan on 15/3/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
