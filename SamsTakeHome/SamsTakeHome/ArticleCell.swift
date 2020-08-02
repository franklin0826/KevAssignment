//
//  ArticleCell.swift
//  SamsTakeHome
//
//  Created by Franklin Mott on 8/2/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
