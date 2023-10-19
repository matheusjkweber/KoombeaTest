//
//  ContactsListTableViewDataSourceAndDelegate.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import UIKit

protocol ContactsListTableViewDelegate: AnyObject {
    func didSelect(user: UserModel)
}

final class ContactsListTableViewDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: ContactsListTableViewDelegate?
    var rows = [UserModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ContactTableViewCell.self)
        let item = rows[indexPath.row]
        cell.setup(image: item.pictureURL, title: item.firstName, subtitle: item.gender)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(user: rows[indexPath.row])
    }
}
