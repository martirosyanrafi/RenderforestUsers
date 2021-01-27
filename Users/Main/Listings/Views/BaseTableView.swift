//
//  BaseTableView.swift
//  ListingManager
//
//  Created by Rafi Martirosyan on 7/31/20.
//

import UIKit

open class BaseTableView: UITableView, UITableViewDataSource, UITableViewDelegate, BaseListing {
    
    public var builders: [[BaseCellBuilder]] = []
    var registeredIdentifiers: [String] = []
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
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
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return builders.count
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return builders[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: builders[indexPath.section][indexPath.row].getIdentifier(), for: indexPath)
        builders[indexPath.section][indexPath.row].configure(cell: cell, index: indexPath.row)
        return cell
    }
    
    func register(builder: BaseCellBuilder) {
        register(UINib(nibName: builder.getNibName(), bundle: nil), forCellReuseIdentifier: builder.getIdentifier())
        registeredIdentifiers.append(builder.getIdentifier())
    }
    
    open override func reloadData() {
        registerCells()
        super.reloadData()
    }
}
