//
//  FeedViewController.swift
//  InstaCloneAndFirebase
//
//  Created by Erge Gevher Akova on 1.05.2022.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var utl = Utils()
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFirestore()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.documentId = posts[indexPath.row].documentId
        cell.lblUser.text = posts[indexPath.row].user
        cell.lblComment.text = posts[indexPath.row].comment
        cell.lblLikeCounter.text = String(posts[indexPath.row].likeCount)
        cell.postImageView.sd_setImage(with: URL(string: posts[indexPath.row].imageUrl))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 390
        return posts.count
    }

    func getDataFromFirestore() {
        let firestoreDB = Firestore.firestore()
        firestoreDB.collection("Posts").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            if error == nil {
                if snapshot?.isEmpty == false && snapshot != nil{
                    self.posts.removeAll()
                    for document in snapshot!.documents {
                        
                        let tempPost = Post(
                            documentIDInit: document.documentID,
                            userInit: document.get("user") as! String,
                            imageUrlInit: document.get("imageUrl") as! String,
                            commentInit: document.get("postComment") as! String,
                            likeCountInit: document.get("like") as! Int )
                       
                        self.posts.append(tempPost)
                        self.tableView.reloadData()
                    }
                }
            }else {
                self.present(self.utl.showBasicAlert(tit:"Error", msg: error?.localizedDescription ?? "error"), animated: true, completion: nil)
            }
        }
    }
}
