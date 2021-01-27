//
//  BaseCell.swift
//  ListingManager
//
//  Created by Rafi Martirosyan on 7/31/20.
//

import Foundation

public protocol BaseCell {
    
    associatedtype T
    
    func configure(_ config: T)
}
