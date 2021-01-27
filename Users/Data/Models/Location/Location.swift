//
//  Location.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct Location {
    
    let country: String
    let city: String
    let state: String
    let street: Street
    let coordinates: Coordinates
    
    func localTransform() -> LocationRealm {
        return LocationRealm(country: country, city: city, state: state, street: street.localTransform(), coordinates: coordinates.localTransform())
    }
}
