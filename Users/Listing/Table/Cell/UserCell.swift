//
//  UserCell.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import UIKit

class UserCell: UITableViewCell, BaseCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    func configure(_ config: User) {
        iconView.setImage(url: URL(string: config.picture.medium))
        nameLabel.text = config.getName()
        infoLabel.text = config.getInfo()
    }
}
