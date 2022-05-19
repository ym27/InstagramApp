//
//  CommentViewController.swift
//  Instagram
//
//  Created by Yuji Mochizuki on 2022/05/13.
//

import UIKit
import Firebase
import FirebaseStorageUI
import SVProgressHUD

class CommentViewController: UIViewController {
    var image_id: String!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextView!
    @IBAction func handlePostCommentButton(_ sender: Any) {
        // 画像と投稿データの保存場所を定義する
        let commentRef = Firestore.firestore().collection(Const.CommentPath).document()
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        let name = Auth.auth().currentUser?.displayName
        let commentDic = [
            "name": name!,
            "image_id": image_id!,
            "comment": commentTextField.text!,
            "date": FieldValue.serverTimestamp(),
            ] as [String : Any]
        commentRef.setData(commentDic)
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました")
        // 投稿処理が完了したので先頭画面に戻る
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func handleCancelButton(_ sender: Any) {
        // home画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 画像の表示
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(image_id + ".jpg")
        imageView.sd_setImage(with: imageRef)
    }


}
