//
//  UserDataProvider.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import RealmSwift

struct UserLocalDataProvider: BaseUserDataProvider {
    
    func getSavedUsers() -> [User] {
        return try! Realm().objects(UserRealm.self).map({ $0.transform() })
    }
    
    func saveUser(_ user: User) {
        let realm = try! Realm()
        try! realm.write({ realm.add(user.localTransform()) })
    }
    
    func removeUser(_ user: User) {
        let realm = try! Realm()
        if let user = realm.objects(UserRealm.self).first(where: { user.email == $0.getEmail() }) {
            try! realm.write({ realm.delete(user) })
        }
    }
    
    func hasMoreData() -> Bool {
        return false
    }
    
    func getCurrentData() -> [User] {
        return getSavedUsers()
    }
    
    func loadMoreData(completion: ([User]) -> Void) {
        completion([])
    }
}
