//
//  BaseCellBuilder.swift
//  ListingManager
//
//  Created by Rafi Martirosyan on 7/31/20.
//

import UIKit

public protocol BaseCellBuilder: class {

    func getNibName() -> String
    func getIdentifier() -> String
    func configure(cell: UIView, index: Int)
}
