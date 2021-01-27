//
//  NameResponse.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct NameResponse: Decodable {
    
    let first: String
    let last: String
    
    func transform() -> Name {
        return Name(first: first, last: last)
    }
}
