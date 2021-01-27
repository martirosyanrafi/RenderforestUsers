//
//  StreetRealm.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import RealmSwift

class StreetRealm: Object {
    
    @objc private dynamic var number: Int = 0
    @objc private dynamic var name: String!
    
    convenience init(number: Int, name: String) {
        self.init()
        
        self.number = number
        self.name = name
    }
    
    func transform() -> Street {
        return Street(number: number, name: name)
    }
}
