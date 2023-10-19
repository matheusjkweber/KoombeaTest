//
//  FaireEndpoint.swift
//  NetworkLayer
//
//  Created by Matheus Weber on 12/03/22.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//  This Network Layer was created from Malcolm Kumwenda`s Medium Tutorial
//

import Foundation

public enum CameraCarEndpoint {
    case getUsers
}

extension CameraCarEndpoint: EndPointType {
    
    var environmentBaseURL : String {
        return "https://jserver-api.herokuapp.com/"
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "users"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var completeURL: URL {
        guard let url = URL(string: "\(environmentBaseURL)\(path)") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
}


