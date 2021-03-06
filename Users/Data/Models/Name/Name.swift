//
//  Name.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct Name {
    
    let first: String
    let last: String
    
    func localTransform() -> NameRealm {
        return NameRealm(first: first, last: last)
    }
}
