//
//  UserModel.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import Foundation

struct UserModel: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var gender: String
    var pictureURL: String
    var phone: String
    var birthday: String
    var twitterHandle: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "firstName"
        case lastName = "lastName"
        case username = "username"
        case email = "email"
        case gender = "gender"
        case pictureURL = "pictureURL"
        case phone = "phone"
        case birthday = "birthday"
        case twitterHandle = "twitterHandle"
    }
}
