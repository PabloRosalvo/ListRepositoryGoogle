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
    
    func fetchDetails(_ completion: @escaping (Bool) -> Void) {
        api.fetch { statusCode, model in
            guard let statusCode = statusCode else { return }
            if ConnectionErrorManager.isSuccessfulStatusCode(statusCode: statusCode) {
                guard let model = model else { return }
                self.model = model
                self.dataList = model
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
