//
//  BaseUserDataProvider.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Foundation

protocol BaseUserDataProvider {
    func hasMoreData() -> Bool
    func getCurrentData() -> [User]
    func loadMoreData(completion: @escaping ([User]) -> Void)
}

extension BaseUserDataProvider {
    
    func getCurrentData(search: String) -> [User] {
        getCurrentData().filter({ $0.email.contains(search) || $0.gender.contains(search) || $0.phone.contains(search) || $0.getName().contains(search) || $0.getInfo().contains(search) })
    }
}
