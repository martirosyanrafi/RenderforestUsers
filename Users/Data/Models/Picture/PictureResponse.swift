//
//  PictureResponse.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Foundation

struct PictureResponse: Decodable {
    
    let medium: String
    let large: String
    
    func transform() -> Picture {
        return Picture(medium: medium, large: large)
    }
}
