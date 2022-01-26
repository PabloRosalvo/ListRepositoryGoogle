//
//  DeailsGithubApi.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 08/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Foundation

protocol ListRepositoryGoogleApiProtocol {
    func fetch(completion: @escaping (Int?, [RepositorieModel]?) -> Swift.Void)
}

class ListRepositoryGoogleApi: ListRepositoryGoogleApiProtocol {
    
    
    private let connectionManager: ConnectionManager
    
    enum BaseUrl {
        static let url = "https://api.github.com/users/google/repos"
    }
    
    init(connectionManager: ConnectionManager = ConnectionManager()) {
        self.connectionManager = connectionManager
    }
    
    func fetch(completion: @escaping (Int?, [RepositorieModel]?) -> Void) {
        connectionManager.request(url:  BaseUrl.url, method: .get, parameters: nil, headers: nil) { (statusCode, list: [RepositorieModel]?) in
            completion(statusCode, list)
        }
    }

    
}
