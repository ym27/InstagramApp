//
//  CommentData.swift
//  Instagram
//
//  Created by Yuji Mochizuki on 2022/05/11.
//

import UIKit
import Firebase

class CommentData: NSObject {
    var id: String
    var name: String?
    var image_id: String?
    var comment: String?
    var date: Date?

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let commentDic = document.data()

        self.name = commentDic["name"] as? String
        
        self.image_id = commentDic["image_id"] as? String

        self.comment = commentDic["comment"] as? String
        
        let timestamp = commentDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
    }
}
