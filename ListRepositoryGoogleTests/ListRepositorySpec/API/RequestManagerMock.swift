//
//  RequestManagerMock.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 28/01/22.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class RequestManagerMock: RequestManagerProtocol {
    
    var shouldReturn: Bool = false

    init(shouldReturn: Bool) {
        self.shouldReturn = shouldReturn
    }

    func request<T>(url: URL, method: HTTPMethodV2, parameters: ParametersV2?, headers: HTTPHeadersV2?, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        if shouldReturn {
            guard let data = JSONHelper.getDataFrom(json: "RepositorieModel") else { return }
            let decoder = JSONDecoder()

            guard let jsonData = try? decoder.decode(T.self, from: data) else { return }
            completion(.success(jsonData))
        } else {
            completion(.failure(RequestError(reason: "Error request API" , statusCode: 500, data: nil)))
        }
    }
    
}
