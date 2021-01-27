//
//  CoordinatesResponse.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Foundation

struct CoordinatesResponse: Decodable {
    
    let latitude: String
    let longitude: String
    
    func transform() -> Coordinates {
        return Coordinates(latitude: Double(latitude) ?? 0, longitude: Double(longitude) ?? 0)
    }
}
