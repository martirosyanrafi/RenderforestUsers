//
//  UserApiDataProvider.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Alamofire

class UserApiDataProvider: BaseUserDataProvider {
    
    private var data: [User] = []
    private var page = 1
    private var loadInProgress = false
    
    func loadMoreData(completion: @escaping ([User]) -> Void) {
        guard !loadInProgress else { return }
        loadInProgress = true
        
        AF.request("https://randomuser.me/api?seed=renderforest&results=20&page=\(page)").response { [weak self] response in
            guard let self = self else { return }
            
            if let responseData: ApiResponse<UserResponse> = response.data?.toObject() {
                let users = responseData.results.map({ $0.transform() })
                self.data.append(contentsOf: users)
                self.page += 1
                completion(users)
            }
            
            self.loadInProgress = false
        }
    }
    
    func getCurrentData() -> [User] {
        return data
    }
    
    func hasMoreData() -> Bool {
        return true
    }
}
