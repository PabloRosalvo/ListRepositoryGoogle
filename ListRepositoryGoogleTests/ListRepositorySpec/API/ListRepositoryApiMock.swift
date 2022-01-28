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

    func fetch(completion: @escaping (Int?, [RepositorieModel]?) -> Void) {
        if shouldReturn {
            let model: [RepositorieModel]? = JSONHelper.getObjectFrom(json: "RepositorieModel", type: [RepositorieModel]?.self) ?? [RepositorieModel]()

            completion(200, model)
        } else {
            completion(500, nil)
        }
    }

}
