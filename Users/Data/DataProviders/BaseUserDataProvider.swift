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
