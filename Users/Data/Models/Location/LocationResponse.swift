//
//  LocationResponse.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct LocationResponse: Decodable {
    
    let country: String
    let city: String
    let state: String
    let street: StreetResponse
    let coordinates: CoordinatesResponse
    
    func transform() -> Location {
        return Location(country: country, city: city, state: state, street: street.transform(), coordinates: coordinates.transform())
    }
}
