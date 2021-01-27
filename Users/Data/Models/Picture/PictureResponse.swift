//
//  PictureResponse.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Foundation

struct PictureResponse: Decodable {
    
    let medium: String
    
    func transform() -> Picture {
        return Picture(medium: medium)
    }
}
