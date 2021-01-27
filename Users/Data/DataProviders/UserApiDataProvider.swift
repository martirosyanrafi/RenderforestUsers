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
    private var currentRequest: DataRequest?
    
    func loadMoreData(completion: @escaping ([User]) -> Void) {
        guard currentRequest == nil else { return }
        
        currentRequest = AF.request("https://randomuser.me/api?seed=renderforest&results=20&page=\(page)").response { [weak self] response in
            guard let self = self else { return }
            
            if let responseData: ApiResponse<UserResponse> = response.data?.toObject() {
                let users = responseData.results.map({ $0.transform() })
                self.data.append(contentsOf: users)
                self.page += 1
                completion(users)
            }
            
            self.currentRequest = nil
        }
    }
    
    func getCurrentData() -> [User] {
        return data
    }
    
    func hasMoreData() -> Bool {
        return true
    }
    
    func stopLoadingData() {
        currentRequest?.suspend()
        currentRequest = nil
    }
}
