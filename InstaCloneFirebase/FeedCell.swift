//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Zeynep Bayrak Demirel on 1.05.2023.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userimageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentidLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!){
            
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            
            fireStoreDatabase.collection("Posts").document(documentidLabel.text!).setData(likeStore, merge: true) // sadece like ı güncelle digerlerine dokunma.
        }
        
        
        
        
        
    }
    
    

}
