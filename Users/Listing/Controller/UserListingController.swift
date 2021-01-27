//
//  UserListingController.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import UIKit

class UserListingController: UIViewController {
    
    @IBOutlet weak var tableView: UsersTableView!
    
    private let localDataProvider = UserLocalDataProvider()
    private let apiDataProvider = UserApiDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Users"
        tableView.selectionCommand = UserSelectionCommand(controller: self)
        tableView.setDataProvider(apiDataProvider)
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        tableView.setDataProvider(sender.selectedSegmentIndex == 0 ? apiDataProvider : localDataProvider)
    }
}

