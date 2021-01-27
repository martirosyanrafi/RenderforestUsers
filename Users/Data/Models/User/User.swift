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
    let name: Name
    let location: Location
    let picture: Picture
    
    func getName() -> String {
        return "\(name.first) \(name.last)"
    }
    
    func getInfo() -> String {
        return """
        \(gender.capitalized), \(phone)
        \(location.country)
        \(location.street.number) \(location.street.name) \(location.state) \(location.city)
        """
    }
}
