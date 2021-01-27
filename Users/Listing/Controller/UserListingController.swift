//
//  UserListingController.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import UIKit

class UserListingController: UIViewController {

    @IBOutlet weak var tableView: UsersTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Users"
        tableView.selectionCommand = UserSelectionCommand(controller: self)
        GetUsersRequest(tableView: tableView).load()
    }
}

