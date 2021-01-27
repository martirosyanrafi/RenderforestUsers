//
//  Coordinates.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Foundation

struct Coordinates {
    
    let latitude: Double
    let longitude: Double
    
    func localTransform() -> CoordinatesRealm {
        return CoordinatesRealm(latitude: latitude, longitude: longitude)
    }
}
