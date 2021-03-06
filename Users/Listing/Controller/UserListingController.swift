//
//  UserListingController.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import UIKit

class UserListingController: UIViewController {
    
    @IBOutlet weak var tableView: UsersTableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let localDataProvider = UserLocalDataProvider()
    private let apiDataProvider = UserApiDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Users"
        tableView.selectionCommand = UserSelectionCommand(controller: self)
        tableView.dataProvider = apiDataProvider
        tableView.loadMoreData()
        searchBar.delegate = tableView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadCurrentData()
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        tableView.dataProvider.stopLoadingData()
        tableView.dataProvider = sender.selectedSegmentIndex == 0 ? apiDataProvider : localDataProvider
        tableView.reloadCurrentData()
    }
}

