//
//  ListRepositoryGoogleApi.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Foundation

protocol ListRepositoryGoogleApiProtocol {
    func fetch(completion: @escaping ([RepositorieModel]?, RequestError?)  -> Swift.Void)
}

class ListRepositoryGoogleApi: ListRepositoryGoogleApiProtocol {
    
    
    private let requestManagerProtocol: RequestManagerProtocol
    
    enum BaseUrl {
        static let url = "https://api.github.com/users/google/repos"
    }
    
    init(requestManagerProtocol: RequestManagerProtocol = RequestManager()) {
        self.requestManagerProtocol = requestManagerProtocol
    }
    
    func fetch(completion: @escaping ([RepositorieModel]?, RequestError?) -> Void) {
        guard let url = URL(string: BaseUrl.url) else {
            return
        }
        self.requestManagerProtocol.request(url: url, method: .get, parameters: nil, headers: nil) { (result: Result<[RepositorieModel]?>) in
            switch result {
            case .success(let model):
                completion(model, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
        
    }

    
}
