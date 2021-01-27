//
//  CoordinatesRealm.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import RealmSwift

class CoordinatesRealm: Object {
    
    @objc private dynamic var latitude: Double = 0
    @objc private dynamic var longitude: Double = 0
    
    convenience init(latitude: Double, longitude: Double) {
        self.init()
        
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func transform() -> Coordinates {
        return Coordinates(latitude: latitude, longitude: longitude)
    }
}
