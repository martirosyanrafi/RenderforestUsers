//
//  UsersTableView.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import UIKit

class UsersTableView: BaseTableView {
    
    var selectionCommand: UserSelectionCommand?
    var dataProvider: BaseUserDataProvider!
    private var lastContentOffset: CGFloat = 0
    
    override func commonInit() {
        super.commonInit()
        
        builders.append([])
        setIndicatorView()
    }
    
    func reloadCurrentData() {
        builders = [[]]
        addNewUsers(dataProvider.getCurrentData())
        reloadData()
    }
    
    private func setIndicatorView() {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        backgroundView = view
    }
    
    private func removeIndicatorView() {
        backgroundView = nil
    }
    
    func loadMoreData() {
        dataProvider.loadMoreData(completion: { [weak self] in self?.addNewUsers($0) })
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height * 3 / 4 && lastContentOffset < scrollView.contentOffset.y {
            loadMoreData()
        }
        self.lastContentOffset = scrollView.contentOffset.y
    }
}
