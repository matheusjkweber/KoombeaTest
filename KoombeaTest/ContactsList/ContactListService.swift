//
//  ContactListService.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

class ContactsListService {
    let manager: NetworkManager
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func getUsers(success: @escaping (_ users: [UserModel]) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ()) {
        
        manager.request(request: .getUsers, success: { (response: [UserModel]) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
}
