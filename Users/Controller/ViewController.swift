//
//  ViewController.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UsersTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetUsersRequest(tableView: tableView).load()
    }
}

