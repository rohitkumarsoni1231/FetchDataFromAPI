//
//  ListCell.swift
//  FetchDataFromAPI
//
//  Created by Rohit Kumar on 7/4/23.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureData(data: UserData?) {
        idLabel.text = "Id : \(data?.id ?? 0)"
        titleLabel.text = "Title : \(data?.title ?? "")"
        bodyLabel.text = "Body : \(data?.body ?? "")"
    }
    
    
}
