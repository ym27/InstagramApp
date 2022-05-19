//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by Yuji Mochizuki on 2022/05/15.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // CommentDataの内容をセルに表示
    func setCommentData(_ commentData: CommentData) {
        // ユーザー名の表示
        self.nameLabel.text = commentData.name!

        // コメントの表示
        self.commentTextView.text = commentData.comment
    }
}

