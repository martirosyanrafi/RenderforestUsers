//
//  GetUsersRequest.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Alamofire

struct GetUsersRequest {
    
    weak var tableView: UsersTableView?
    
    func load() {
        AF.request("https://randomuser.me/api?seed=renderforest&results=20&page=1").response { response in
            if let data: ApiResponse<UserResponse> = response.data?.toObject(), let tableView = tableView {
                tableView.addNewUsers(data.results.map({ $0.transform() }))
            } else {
                print("error")
                print(String(data: response.data ?? Data(), encoding: .utf8))
            }
        }
    }
}
