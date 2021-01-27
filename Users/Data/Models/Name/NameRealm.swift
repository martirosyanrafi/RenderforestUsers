//
//  NameRealm.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import RealmSwift

class NameRealm: Object {

    @objc dynamic var first: String!
    @objc dynamic var last: String!
    
    convenience init(first: String, last: String) {
        self.init()
        
        self.first = first
        self.last = last
    }
    
    func transform() -> Name {
        return Name(first: first, last: last)
    }
}
