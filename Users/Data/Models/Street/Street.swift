//
//  Street.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct Street {
    
    let number: Int
    let name: String
    
    func localTransform() -> StreetRealm {
        return StreetRealm(number: number, name: name)
    }
}
