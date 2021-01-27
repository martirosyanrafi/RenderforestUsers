//
//  CellBuilder.swift
//  ListingManager
//
//  Created by Rafi Martirosyan on 7/31/20.
//

import UIKit

public class CellBuilder<T, C: BaseCell>: BaseCellBuilder where C.T == T {

    private let data: T
    
    public init(_ data: T) {
        self.data = data
    }
    
    public func getNibName() -> String {
        return String(describing: C.self)
    }
    
    public func getIdentifier() -> String {
        return String(describing: C.self)
    }
    
    public func getData() -> T {
        return data
    }
    
    public func configure(cell: UIView, index: Int) {
        (cell as? C)?.configure(data)
    }
}
