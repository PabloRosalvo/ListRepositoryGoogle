//
//  ListRepositoryViewModel.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 24/01/22.
//

import Foundation

final class ListRepositoryViewModel {
    
    private let api: ListRepositoryGoogleApiProtocol
    private var model: [RepositorieModel]?
    
    init(api: ListRepositoryGoogleApiProtocol = ListRepositoryGoogleApi()) {
        self.api = api
    }
    
    var modelList: [RepositorieModel]? {
        return model
    }
    
    var dataList: [RepositorieModel]?
    
    func fetchDetails(_ completion: @escaping (RequestError?) -> Void) {
        api.fetch { [weak self] model, error in
            guard error == nil else {
                completion(error)
                return
            }
            self?.model = model
            self?.dataList = model
            completion(error)
        }
    }
    
}
