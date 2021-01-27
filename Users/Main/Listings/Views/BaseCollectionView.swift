//
//  BaseCollectionView.swift
//  ListingManager
//
//  Created by Rafi Martirosyan on 7/31/20.
//

import UIKit

open class BaseCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, BaseListing {
    
    public var builders: [[BaseCellBuilder]] = []
    var registeredIdentifiers: [String] = []
    
    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    open func commonInit() {
        delegate = self
        dataSource = self
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return builders.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return builders[section].count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: builders[indexPath.section][indexPath.row].getIdentifier(), for: indexPath)
        builders[indexPath.section][indexPath.row].configure(cell: cell, index: indexPath.row)
        return cell
    }
    
    func register(builder: BaseCellBuilder) {
        register(UINib(nibName: builder.getNibName(), bundle: nil), forCellWithReuseIdentifier: builder.getIdentifier())
        registeredIdentifiers.append(builder.getIdentifier())
    }
    
    open override func reloadData() {
        registerCells()
        super.reloadData()
    }
}
