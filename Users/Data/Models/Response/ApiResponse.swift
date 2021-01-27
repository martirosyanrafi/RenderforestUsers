//
//  ApiResponse.swift
//  Users
//
//  Created by Rafi Martirosyan on 27.01.21.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let results: [T]
}
