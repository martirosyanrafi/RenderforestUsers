//
//  UserApiDataProvider.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Alamofire

class UserApiDataProvider: BaseUserDataProvider {
    
    private var data: [User] = []
    
    func loadMoreData(completion: @escaping ([User]) -> Void) {
        AF.request("https://randomuser.me/api?seed=renderforest&results=20&page=1").response { [weak self] response in
            if let responseData: ApiResponse<UserResponse> = response.data?.toObject() {
                let users = responseData.results.map({ $0.transform() })
                self?.data.append(contentsOf: users)
                completion(users)
            }
        }
    }
    
    func getCurrentData() -> [User] {
        return data
    }
    
    func hasMoreData() -> Bool {
        return true
    }
}
