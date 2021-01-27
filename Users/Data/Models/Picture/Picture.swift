//
//  Picture.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Foundation

struct Picture {
    
    let medium: String
    let large: String
    
    func localTransform() -> PictureRealm {
        return PictureRealm(medium: medium, large: large)
    }
}
