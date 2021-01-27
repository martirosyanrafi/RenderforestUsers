//
//  User.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct User {
    
    let gender: String
    let phone: String
    let email: String
    let name: Name
    let location: Location
    let picture: Picture
    
    func getName() -> String {
        return "\(name.first) \(name.last)"
    }
    
    func localTransform() -> UserRealm {
        return UserRealm(gender: gender, phone: phone, email: email, name: name.localTransform(), location: location.localTransform(), picture: picture.localTransform())
    }
    
    func getInfo() -> String {
        return """
        \(gender.capitalized), \(phone)
        \(location.country)
        \(location.street.number) \(location.street.name) \(location.state) \(location.city)
        """
    }
}
