//
//  DataExtension.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

extension Data {
    
    public func toObject<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
