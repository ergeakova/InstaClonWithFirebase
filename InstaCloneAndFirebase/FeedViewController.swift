//
//  FeedViewController.swift
//  InstaCloneAndFirebase
//
//  Created by Erge Gevher Akova on 1.05.2022.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.lblUser.text = "userName"
        cell.lblComment.text = "Comment"
        cell.lblLikeCounter.text = "2"
        cell.postImageView.image = UIImage(named: "addImage.jpg")
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 400
        return 5
    }
}
