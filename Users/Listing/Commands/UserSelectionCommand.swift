//
//  UserSelectionCommand.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import UIKit

struct UserSelectionCommand: CommonCommand {
    
    weak var controller: UIViewController!
    var user: User!
    
    func execute() {
        let newController: SingleUserController = getController()
        newController.user = user
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
