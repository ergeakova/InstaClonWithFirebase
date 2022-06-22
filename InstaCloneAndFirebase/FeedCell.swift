//
//  FeedCell.swift
//  InstaCloneAndFirebase
//
//  Created by Erge Gevher Akova on 6.05.2022.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    var documentId : String = ""
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
        let firestoreDB = Firestore.firestore()
        if let likeCount = Int(lblLikeCounter.text!){
            let newCount = ["like" : likeCount + 1] as [String: Any]
            firestoreDB.collection("Posts").document(documentId).setData(newCount, merge: true)
        }
    }
}
