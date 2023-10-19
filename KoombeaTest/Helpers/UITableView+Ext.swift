//
//  UITableView+Ext.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import UIKit

public extension UITableView {
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, indexPath: IndexPath? = nil) -> T {
        guard let index = indexPath else {
            guard let cell = dequeueReusableCell(withIdentifier: String(describing: cell)) as? T else {
                fatalError("dequeueReusableCell failure")
            }
            return cell
        }
        
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cell), for: index) as? T else {
            fatalError("dequeueReusableCell failure")
        }
        return cell
    }
}

public extension UITableViewCell {
        
    static var identifier: String {
        return String(describing: self)
    }
}
