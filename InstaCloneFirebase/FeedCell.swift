//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Zeynep Bayrak Demirel on 1.05.2023.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userimageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    
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
