//
//  StreetResponse.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct StreetResponse: Decodable {
    
    let number: Int
    let name: String
    
    func transform() -> Street {
        return Street(number: number, name: name)
    }
}
