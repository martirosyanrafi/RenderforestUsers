//
//  UsersTableView.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import UIKit

class UsersTableView: BaseTableView {
    
    var selectionCommand: UserSelectionCommand?
    
    override func commonInit() {
        super.commonInit()
        
        builders.append([])
        setIndicatorView()
    }
    
    private func setIndicatorView() {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        backgroundView = view
    }
    
    private func removeIndicatorView() {
        backgroundView = nil
    }
    
    func addNewUsers(_ users: [User]) {
        removeIndicatorView()
        
        let newBuilders = users.map({ CellBuilder<User, UserCell>($0) })
        builders[0].append(contentsOf: newBuilders)
        
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard var command = selectionCommand else { return }
        
        command.user = (builders[indexPath.section][indexPath.row] as! CellBuilder<User, UserCell>).getData()
        command.execute()
    }
}
