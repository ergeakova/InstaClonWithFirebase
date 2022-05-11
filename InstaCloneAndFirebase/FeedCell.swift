//
//  FeedCell.swift
//  InstaCloneAndFirebase
//
//  Created by Erge Gevher Akova on 6.05.2022.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var btnLike: UIButton!
  
    @IBOutlet weak var lblLikeCounter: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        
    }
}
