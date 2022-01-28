//
//  RequestManagerSpec.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 28/01/22.
//


import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class RequestManagerSpec: QuickSpec {
    
    var requestManagerMock: RequestManagerMock!
    
    override func spec() {
        describe("RequestManagerSpec")  {
            
            context("when hitting the api and it was successful there should be no error") {
                beforeEach {
                    self.requestManagerMock = RequestManagerMock(shouldReturn: true)
                }
                
                it("should not give the error in the API") {
                    self.validatingApiLayer { model, error in
                        expect(model).toNot(beNil())
                    }
                }
            }
        }
    }
}


extension RequestManagerSpec {
    func validatingApiLayer(completion: @escaping ([RepositorieModel]?, RequestError?) -> Void) {
        guard let url = URL(string: "") else {
            return
        }
        self.requestManagerMock.request(url: url, method: .get, parameters: nil, headers: nil) { (result: Result<[RepositorieModel]?>) in
            switch result {
            case .success(let model):
                completion(model, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
