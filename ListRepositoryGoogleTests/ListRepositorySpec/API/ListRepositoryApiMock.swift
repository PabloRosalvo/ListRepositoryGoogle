//
//  ListRepositoryApiMock.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 27/01/22.
//


import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class ListRepositoryApiMock: ListRepositoryGoogleApiProtocol {
        
    var shouldReturn: Bool = false

    init(shouldReturn: Bool) {
        self.shouldReturn = shouldReturn
    }

    func fetch(completion: @escaping ([RepositorieModel]?, RequestError?) -> Void) {
        if shouldReturn {
            let model: [RepositorieModel]? = JSONHelper.getObjectFrom(json: "RepositorieModel", type: [RepositorieModel]?.self) ?? [RepositorieModel]()

            completion(model, nil )
        } else {
            completion(nil, RequestError(reason: "Erro API" , statusCode: 500, data: nil))
        }
    }

}
