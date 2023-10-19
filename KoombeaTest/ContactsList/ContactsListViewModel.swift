//
//  ContactsListViewModel.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import Foundation

protocol ContactsListViewModelDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func reloadData(with users: [UserModel])
}

class ContactsListViewModel {
    let networkManager: NetworkManager
    lazy var service = ContactsListService(manager: networkManager)
    weak var delegate: ContactsListViewModelDelegate?
    let tableViewDataSourceAndDelegate: ContactsListTableViewDataSourceAndDelegate
    
    init(networkManager: NetworkManager, tableViewDataSourceAndDelegate: ContactsListTableViewDataSourceAndDelegate) {
        self.networkManager = networkManager
        self.tableViewDataSourceAndDelegate = tableViewDataSourceAndDelegate
    }
    
    func loadUsers() {
        delegate?.showLoading()
        
        service.getUsers { users in
            DispatchQueue.main.async {
                self.delegate?.hideLoading()
                self.tableViewDataSourceAndDelegate.rows = users
                self.delegate?.reloadData(with: users)
            }
        } failure: { error in
            DispatchQueue.main.async {
                self.delegate?.hideLoading()
            }
            //TODO: Error handling
        }
    }
}
