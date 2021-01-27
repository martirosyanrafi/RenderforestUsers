//
//  UserResponse.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct UserResponse: Decodable {
    
    let gender: String
    let phone: String
    let name: NameResponse
    let location: LocationResponse
    let picture: PictureResponse
    
    func transform() -> User {
        return User(gender: gender, phone: phone, name: name.transform(), location: location.transform(), picture: picture.transform())
    }
}
