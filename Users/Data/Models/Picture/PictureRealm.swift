//
//  PictureRealm.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import RealmSwift

class PictureRealm: Object {
    
    @objc private dynamic var medium: String!
    @objc private dynamic var large: String!
    
    convenience init(medium: String, large: String) {
        self.init()
        
        self.medium = medium
        self.large = large
    }
    
    func transform() -> Picture {
        return Picture(medium: medium, large: large)
    }
}
