//
//  BaseListing.swift
//  ListingManager
//
//  Created by Rafi Martirosyan on 7/31/20.
//

import Foundation

protocol BaseListing: class {
    
    var builders: [[BaseCellBuilder]] { get set }
    var registeredIdentifiers: [String] { get set }
    
    func register(builder: BaseCellBuilder)
    func reloadData()
}

extension BaseListing {
    
    func registerCells() {
        builders.reduce([], +).filter({ !registeredIdentifiers.contains($0.getIdentifier()) }).forEach({ register(builder: $0) })
    }
}
