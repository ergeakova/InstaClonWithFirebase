//
//  post.swift
//  InstaCloneAndFirebase
//
//  Created by Erge Gevher Akova on 11.05.2022.
//

import Foundation

class Post {
    
    let documentId : String
    var user : String
    var imageUrl : String
    var comment : String
    var likeCount : Int
    
    init(documentIDInit : String,  userInit : String, imageUrlInit: String, commentInit:String = "", likeCountInit:Int = 0){
        documentId = documentIDInit
        user = userInit
        imageUrl = imageUrlInit
        comment = commentInit
        likeCount = likeCountInit
    }
}
