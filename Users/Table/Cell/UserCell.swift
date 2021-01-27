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
        nameLabel.text = "\(config.name.first) \(config.name.last)"
        infoLabel.text = """
        \(config.gender.capitalized), \(config.phone)
        \(config.location.country)
        \(config.location.street.number) \(config.location.street.name) \(config.location.state) \(config.location.city)
        """
    }
}
